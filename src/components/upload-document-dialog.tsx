"use client";

import { useState } from "react";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { FileDropzone } from "@/components/file-dropzone";
import { createClerkSupabaseClient } from "@/lib/supabase";
import { useUser } from "@/hooks/use-clerk-auth";

interface FileData {
  name: string;
  size: number;
  type: string;
  path: string;
  url: string;
  uploadedAt: string;
}

interface UploadDocumentDialogProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  deals: { id: string; name: string }[];
  onUploadComplete?: () => void;
}

export function UploadDocumentDialog({
  open,
  onOpenChange,
  deals,
  onUploadComplete,
}: UploadDocumentDialogProps) {
  const [documentName, setDocumentName] = useState("");
  const [dealId, setDealId] = useState("");
  const [category, setCategory] = useState("");
  const [fileData, setFileData] = useState<FileData | null>(null);
  const [uploading, setUploading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const { user } = useUser();

  const handleFileUploadComplete = (fileUrl: string, fileData: FileData) => {
    setFileData(fileData);
  };

  const handleSubmit = async () => {
    if (!documentName || !dealId || !category || !fileData || !user) {
      setError("Please fill in all fields and upload a file.");
      return;
    }

    setUploading(true);
    setError(null);

    try {
      const supabase = createClerkSupabaseClient();

      // Generate a document ID
      const documentId = `DOC-${Math.floor(100000 + Math.random() * 900000)}`;

      // Insert document record into the database
      const { error: dbError } = await supabase.from("document_files").insert({
        id: documentId,
        name: documentName,
        deal_id: dealId,
        category: category,
        file_type: fileData.type.split("/").pop()?.toUpperCase() || "UNKNOWN",
        file_size: fileData.size,
        file_url: fileData.url,
        uploaded_by: user.id, // Add the user's ID
        upload_date: new Date().toISOString(),
      });

      if (dbError) throw dbError;

      // Close dialog and refresh
      onOpenChange(false);
      if (onUploadComplete) {
        onUploadComplete();
      }
    } catch (err: unknown) {
      if (err instanceof Error) {
        console.error("Error saving document:", err);
        setError(err.message || "Failed to save document. Please try again.");
      } else {
        console.error("Error saving document:", err);
        setError("Failed to save document. Please try again.");
      }
    } finally {
      setUploading(false);
    }
  };

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="sm:max-w-[500px]">
        <DialogHeader>
          <DialogTitle>Upload Document</DialogTitle>
          <DialogDescription>
            Upload a new document to the system. The file will be stored in
            Supabase Storage.
          </DialogDescription>
        </DialogHeader>

        <div className="grid gap-4 py-4">
          <div className="grid gap-2">
            <Label htmlFor="document-name">Document Name</Label>
            <Input
              id="document-name"
              value={documentName}
              onChange={(e) => setDocumentName(e.target.value)}
              placeholder="Enter document name"
            />
          </div>

          <div className="grid grid-cols-2 gap-4">
            <div className="grid gap-2">
              <Label htmlFor="deal">Related Deal</Label>
              <Select value={dealId} onValueChange={setDealId}>
                <SelectTrigger id="deal">
                  <SelectValue placeholder="Select deal" />
                </SelectTrigger>
                <SelectContent>
                  {deals.map((deal) => (
                    <SelectItem key={deal.id} value={deal.id}>
                      {deal.name}
                    </SelectItem>
                  ))}
                  <SelectItem value="multiple">Multiple Deals</SelectItem>
                </SelectContent>
              </Select>
            </div>

            <div className="grid gap-2">
              <Label htmlFor="category">Category</Label>
              <Select value={category} onValueChange={setCategory}>
                <SelectTrigger id="category">
                  <SelectValue placeholder="Select category" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="Legal">Legal</SelectItem>
                  <SelectItem value="Financial">Financial</SelectItem>
                  <SelectItem value="Marketing">Marketing</SelectItem>
                  <SelectItem value="Other">Other</SelectItem>
                </SelectContent>
              </Select>
            </div>
          </div>

          <div className="grid gap-2">
            <Label>Document File</Label>
            <FileDropzone
              bucketName="documents"
              folderPath={
                user
                  ? `user_${user.id}/${
                      dealId !== "multiple" ? dealId : "general"
                    }`
                  : "temp"
              }
              onUploadComplete={handleFileUploadComplete}
              maxSizeMB={50}
            />
          </div>

          {error && <p className="text-sm text-destructive">{error}</p>}
        </div>

        <DialogFooter>
          <Button variant="outline" onClick={() => onOpenChange(false)}>
            Cancel
          </Button>
          <Button onClick={handleSubmit} disabled={uploading}>
            {uploading ? "Saving..." : "Save Document"}
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}
