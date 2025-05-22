"use client";

import { useRouter } from "next/navigation";
import { useCallback, useEffect, useState, useRef } from "react";
import { useUser } from "@/hooks/use-clerk-auth";
import { useSupabase } from "@/hooks/use-supabase";
import {
  Dropzone,
  DropzoneContent,
  DropzoneEmptyState,
} from "@/components/ui/dropzone";
import { cn } from "@/lib/utils";
import { Button } from "./ui/button";
import { useSupabaseUpload } from "@/hooks/use-supabase-upload";
import { Upload } from "tus-js-client";
import { Progress } from "@/components/ui/progress";

// Size threshold for using resumable uploads (6MB as per Supabase docs)
const RESUMABLE_THRESHOLD = 6 * 1024 * 1024; // 6MB

interface FileData {
  name: string;
  size: number;
  type: string;
  path: string;
  url: string;
  uploadedAt: string;
}

interface FileDropzoneProps {
  bucketName: string;
  folderPath?: string;
  onUploadComplete?: (fileUrl: string, fileData: FileData) => void;
  maxSizeMB?: number;
  allowedFileTypes?: string[];
  className?: string;
}

export function FileDropzone({
  bucketName,
  folderPath = "",
  onUploadComplete,
  maxSizeMB = 50,
  allowedFileTypes = [
    "image/*",
    "application/pdf",
    ".doc",
    ".docx",
    ".xls",
    ".xlsx",
    ".zip",
  ],
  className,
}: FileDropzoneProps) {
  const router = useRouter();
  const { user } = useUser();
  const supabase = useSupabase(); // Get authenticated Supabase client
  const [uploading, setUploading] = useState(false);
  const [uploadSuccess, setUploadSuccess] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [uploadProgress, setUploadProgress] = useState(0);
  const [isResumableUpload, setIsResumableUpload] = useState(false);
  const tusUploadRef = useRef<Upload | null>(null);
  const uploadCancelledRef = useRef<boolean>(false);

  // Convert maxSizeMB to bytes for the hook
  const maxSizeBytes = maxSizeMB * 1024 * 1024;

  // Convert allowedFileTypes to MIME types for the hook
  const convertedAllowedTypes = allowedFileTypes.filter(
    (type) => !type.startsWith(".")
  );

  const dropzoneProps = useSupabaseUpload({
    bucketName,
    path: folderPath,
    maxFileSize: maxSizeBytes,
    maxFiles: 1,
    allowedMimeTypes: convertedAllowedTypes,
  });

  // Standard Supabase upload for smaller files
  const uploadStandard = async (file: File) => {
    if (uploading) return;

    setUploading(true);
    setError(null);
    setIsResumableUpload(false);
    uploadCancelledRef.current = false;

    try {
      // Ensure the bucket exists before trying to upload
      const bucketReady = await ensureBucketExists();
      if (!bucketReady) {
        throw new Error("Storage bucket is not available");
      }

      if (!user) {
        throw new Error("User authentication required for uploads");
      }

      // Construct the storage path
      const filePath = `${folderPath ? `${folderPath}/` : ""}${file.name}`;

      console.log("Standard upload to Supabase Storage:", {
        bucket: bucketName,
        path: filePath,
        fileSize: formatBytes(file.size),
      });

      // Update progress for UI
      setUploadProgress(10);

      // Check if upload was cancelled
      if (uploadCancelledRef.current) {
        console.log("Upload cancelled before it started");
        throw new Error("Upload cancelled");
      }

      // Use standard upload method for small files
      const { data, error: uploadError } = await supabase.storage
        .from(bucketName)
        .upload(filePath, file, {
          upsert: true, // Overwrite if file exists
          contentType: file.type, // Set the correct content type
        });

      // Check if upload was cancelled
      if (uploadCancelledRef.current) {
        console.log("Upload cancelled after completion but before processing");
        throw new Error("Upload cancelled");
      }

      // Update progress
      setUploadProgress(90);

      if (uploadError) {
        console.error("File upload failed:", uploadError);
        setError(uploadError.message || "Upload failed");
        return;
      }

      // Update progress
      setUploadProgress(95);

      console.log("Upload successful:", data);

      // Get the public URL for the file
      const { data: publicUrlData } = supabase.storage
        .from(bucketName)
        .getPublicUrl(filePath);

      const fileUrl = publicUrlData.publicUrl;

      // Create file data object
      const fileData: FileData = {
        name: file.name,
        size: file.size,
        type: file.type,
        path: filePath,
        url: fileUrl,
        uploadedAt: new Date().toISOString(),
      };

      // Set success state
      setUploadSuccess(true);
      setUploadProgress(100);

      // Call the callback
      if (onUploadComplete) {
        console.log("Standard upload complete:", fileData);
        onUploadComplete(fileUrl, fileData);
      }

      // Refresh router to update UI
      router.refresh();
    } catch (err) {
      console.error("Standard upload error:", err);
      const errorMessage =
        err instanceof Error ? err.message : "Failed to upload file";
      if (errorMessage !== "Upload cancelled") {
        setError(errorMessage);
      }
      setUploadProgress(0);
    } finally {
      setUploading(false);
    }
  };

  // Resumable upload using TUS protocol for larger files
  const uploadResumable = async (file: File) => {
    if (uploading || !user) return;

    setUploading(true);
    setError(null);
    setIsResumableUpload(true);
    uploadCancelledRef.current = false;

    try {
      // Ensure the bucket exists before trying to upload
      const bucketReady = await ensureBucketExists();
      if (!bucketReady) {
        throw new Error("Storage bucket is not available");
      }

      // Get JWT token from Clerk user session
      // @ts-ignore - Clerk types issue
      const token = await user.getToken({ template: "supabase" });

      if (!token) {
        throw new Error(
          "Unable to get authentication token for resumable upload"
        );
      }

      // Construct the storage path
      const filePath = `${folderPath ? `${folderPath}/` : ""}${file.name}`;

      console.log("Starting resumable upload:", {
        bucket: bucketName,
        path: filePath,
        fileSize: formatBytes(file.size),
        hasToken: !!token,
        tokenLength: token ? token.length : 0,
      });

      // Get the project ID from the URL
      const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || "";
      const projectId =
        supabaseUrl.match(/https:\/\/([^.]+)\.supabase\.co/)?.[1] || "";

      if (!projectId) {
        throw new Error("Could not determine Supabase project ID from URL");
      }

      return new Promise<void>((resolve, reject) => {
        // Create TUS upload
        const upload = new Upload(file, {
          endpoint: `https://${projectId}.supabase.co/storage/v1/upload/resumable`,
          retryDelays: [0, 3000, 5000, 10000, 20000],
          headers: {
            authorization: `Bearer ${token}`, // Use direct Clerk JWT token
            "x-upsert": "true", // Overwrite existing files
          },
          uploadDataDuringCreation: true,
          removeFingerprintOnSuccess: true,
          metadata: {
            bucketName: bucketName,
            objectName: filePath,
            contentType: file.type,
            cacheControl: "3600",
          },
          chunkSize: 6 * 1024 * 1024, // Must be 6MB as per Supabase docs
          onError: (error) => {
            console.error("Resumable upload failed:", error);
            setError(error.message || "Upload failed");
            setUploading(false);
            setUploadProgress(0);
            reject(error);
          },
          onProgress: (bytesUploaded, bytesTotal) => {
            const percentage = Math.round((bytesUploaded / bytesTotal) * 100);
            console.log(
              `Uploaded ${formatBytes(bytesUploaded)} of ${formatBytes(
                bytesTotal
              )} (${percentage}%)`
            );
            setUploadProgress(percentage);
          },
          onSuccess: async () => {
            console.log("Resumable upload completed successfully");

            // Check if the upload was cancelled
            if (uploadCancelledRef.current) {
              console.log("Upload was cancelled after completion");
              setUploading(false);
              resolve();
              return;
            }

            // Get the public URL for the file
            const { data: publicUrlData } = supabase.storage
              .from(bucketName)
              .getPublicUrl(filePath);

            const fileUrl = publicUrlData.publicUrl;

            // Create file data object
            const fileData: FileData = {
              name: file.name,
              size: file.size,
              type: file.type,
              path: filePath,
              url: fileUrl,
              uploadedAt: new Date().toISOString(),
            };

            // Set success state
            setUploadSuccess(true);
            setUploadProgress(100);
            setUploading(false);

            // Call the callback
            if (onUploadComplete) {
              console.log("Resumable upload complete:", fileData);
              onUploadComplete(fileUrl, fileData);
            }

            // Refresh router to update UI
            router.refresh();
            resolve();
          },
        });

        // Store reference to allow cancellation
        tusUploadRef.current = upload;

        // Check for previous uploads to resume
        upload.findPreviousUploads().then((previousUploads) => {
          // Check if cancelled before starting
          if (uploadCancelledRef.current) {
            console.log("Upload cancelled before starting");
            setUploading(false);
            return;
          }

          if (previousUploads.length) {
            console.log("Resuming previous upload");
            upload.resumeFromPreviousUpload(previousUploads[0]);
          }

          // Start the upload
          upload.start();
        });
      });
    } catch (err) {
      console.error("Error setting up resumable upload:", err);
      const errorMessage =
        err instanceof Error ? err.message : "Failed to start upload";
      if (errorMessage !== "Upload cancelled") {
        setError(errorMessage);
      }
      setUploading(false);
      setUploadProgress(0);
    }
  };

  // Choose upload method based on file size
  const uploadFile = async (file: File) => {
    // Reset states
    setError(null);
    setUploadProgress(0);
    uploadCancelledRef.current = false;

    if (file.size >= RESUMABLE_THRESHOLD) {
      console.log(
        `File size ${formatBytes(file.size)} exceeds ${formatBytes(
          RESUMABLE_THRESHOLD
        )}, using resumable upload`
      );
      await uploadResumable(file);
    } else {
      console.log(
        `File size ${formatBytes(file.size)} is below ${formatBytes(
          RESUMABLE_THRESHOLD
        )}, using standard upload`
      );
      await uploadStandard(file);
    }
  };

  // Cancel upload if in progress
  const cancelUpload = () => {
    console.log("Cancelling upload");
    uploadCancelledRef.current = true;

    // Cancel TUS upload if active
    if (tusUploadRef.current) {
      console.log("Cancelling resumable upload");
      tusUploadRef.current.abort();
      tusUploadRef.current = null;
    }

    setUploading(false);
    setUploadProgress(0);
  };

  // Automatically handle file uploads when files are added
  useEffect(() => {
    const files = dropzoneProps.files;
    if (files.length > 0 && !uploading && !uploadSuccess) {
      // Get the first file (we only allow one)
      const file = files[0];

      // Only upload if there are no errors
      if (file.errors.length === 0) {
        uploadFile(file);
      }
    }
  }, [dropzoneProps.files, uploading, uploadSuccess]);

  // Reset state when files are removed
  useEffect(() => {
    if (dropzoneProps.files.length === 0) {
      setUploadSuccess(false);
      setError(null);
      setUploadProgress(0);
    }
  }, [dropzoneProps.files]);

  // Cleanup on unmount
  useEffect(() => {
    return () => {
      uploadCancelledRef.current = true;
      if (tusUploadRef.current) {
        tusUploadRef.current.abort();
      }
    };
  }, []);

  // Helper function to format bytes into readable format
  const formatBytes = (bytes: number): string => {
    if (bytes === 0) return "0 Bytes";
    const k = 1024;
    const sizes = ["Bytes", "KB", "MB", "GB", "TB"];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + " " + sizes[i];
  };

  // Utility function to ensure the bucket exists
  const ensureBucketExists = async () => {
    try {
      if (!user) {
        throw new Error("User authentication required");
      }

      // Check if the bucket exists
      const { data: buckets, error: bucketsError } =
        await supabase.storage.listBuckets();

      if (bucketsError) {
        console.error("Error listing buckets:", bucketsError);
        throw new Error(`Bucket access error: ${bucketsError.message}`);
      }

      const bucketExists = buckets?.some(
        (bucket) => bucket.name === bucketName
      );

      if (!bucketExists) {
        console.warn(
          `Bucket "${bucketName}" does not exist. Attempting to create it...`
        );

        // Try to create the bucket
        const { error: createError } = await supabase.storage.createBucket(
          bucketName,
          {
            public: false,
            fileSizeLimit: maxSizeBytes,
          }
        );

        if (createError) {
          console.error("Error creating bucket:", createError);
          throw new Error(
            `Failed to create bucket "${bucketName}": ${createError.message}`
          );
        }

        console.log(`Bucket "${bucketName}" created successfully`);
      } else {
        console.log(`Bucket "${bucketName}" exists`);
      }

      return true;
    } catch (err) {
      console.error("Error ensuring bucket exists:", err);
      const errorMessage =
        err instanceof Error
          ? err.message
          : "Failed to access or create storage bucket";
      setError(errorMessage);
      return false;
    }
  };

  return (
    <div className={cn("flex flex-col gap-4", className)}>
      <Dropzone {...dropzoneProps} className="w-full">
        <DropzoneEmptyState />
        <DropzoneContent />
      </Dropzone>

      {/* Progress bar */}
      {uploading && (
        <div className="w-full space-y-2">
          <div className="flex justify-between text-xs text-muted-foreground">
            <span>
              {isResumableUpload ? "Resumable upload" : "Standard upload"}
            </span>
            <span>{uploadProgress}%</span>
          </div>
          <Progress value={uploadProgress} className="h-2" />
          <div className="flex justify-end">
            <Button
              onClick={cancelUpload}
              variant="outline"
              size="sm"
              type="button"
            >
              Cancel
            </Button>
          </div>
        </div>
      )}

      {error && <p className="text-sm text-destructive">{error}</p>}

      {dropzoneProps.files.length > 0 && !uploadSuccess && !uploading && (
        <div className="flex justify-end">
          <Button
            onClick={() => uploadFile(dropzoneProps.files[0])}
            disabled={dropzoneProps.files[0]?.errors.length > 0}
            variant="outline"
            size="sm"
            type="button"
          >
            Retry Upload
          </Button>
        </div>
      )}

      {uploadSuccess && (
        <p className="text-sm text-primary">File uploaded successfully!</p>
      )}
    </div>
  );
}
