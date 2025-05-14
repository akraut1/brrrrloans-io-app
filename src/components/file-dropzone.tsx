"use client";

import { useRouter } from "next/navigation";
import { useCallback } from "react";
import { useUser } from "@/hooks/use-clerk-auth";
import { useSupabaseUpload } from "@/hooks/use-supabase-upload";
import {
  Dropzone,
  DropzoneContent,
  DropzoneEmptyState,
} from "@/components/dropzone";
import { cn } from "@/lib/utils";

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

  // Convert maxSizeMB to bytes for the hook
  const maxSizeBytes = maxSizeMB * 1024 * 1024;

  // Convert allowedFileTypes to MIME types for the hook
  const convertedAllowedTypes = allowedFileTypes.filter(
    (type) => !type.startsWith(".")
  );

  const dropzoneProps = useSupabaseUpload({
    bucketName,
    path: user ? `user_${user.id}/${folderPath}` : folderPath,
    maxFileSize: maxSizeBytes,
    maxFiles: 1,
    allowedMimeTypes: convertedAllowedTypes,
  });

  // Handle successful uploads
  const handleUploadComplete = useCallback(() => {
    if (
      dropzoneProps.isSuccess &&
      dropzoneProps.files.length > 0 &&
      onUploadComplete
    ) {
      // Get the file details from the first file
      const file = dropzoneProps.files[0];

      // Get the public URL
      const fileUrl = `${process.env.NEXT_PUBLIC_SUPABASE_URL}/storage/v1/object/public/${bucketName}/${dropzoneProps.files[0].name}`;

      // Create file data object similar to the old implementation
      const fileData: FileData = {
        name: file.name,
        size: file.size,
        type: file.type,
        path: `${folderPath}/${file.name}`,
        url: fileUrl,
        uploadedAt: new Date().toISOString(),
      };

      // Call the callback
      onUploadComplete(fileUrl, fileData);

      // Refresh the router
      router.refresh();
    }
  }, [
    dropzoneProps.isSuccess,
    dropzoneProps.files,
    bucketName,
    folderPath,
    onUploadComplete,
    router,
  ]);

  // Call the handler when upload is successful
  if (dropzoneProps.isSuccess) {
    handleUploadComplete();
  }

  return (
    <div className={cn("flex flex-col gap-4", className)}>
      <Dropzone {...dropzoneProps} className="w-full">
        <DropzoneEmptyState />
        <DropzoneContent />
      </Dropzone>
    </div>
  );
}
