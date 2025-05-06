"use client";

import { useState, useEffect, useCallback } from "react";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Badge } from "@/components/ui/badge";
import { Download, Plus, Search } from "lucide-react";
import { UploadDocumentDialog } from "@/components/upload-document-dialog";
import { createClerkSupabaseClient } from "@/lib/supabase";
import { useUser } from "@/hooks/use-clerk-auth";
import type { Database } from "@/types/supabase";
import { SiteHeader } from "@/components/layout/site-header";

// Sample deals data - in a real app, this would come from the database
const deals = [
  { id: "1", name: "Oakwood Apartments" },
  { id: "2", name: "Riverfront Plaza" },
  { id: "3", name: "Sunset Heights" },
  { id: "4", name: "Downtown Office Building" },
];

export default function DocumentsPage() {
  const [searchTerm, setSearchTerm] = useState("");
  const [documents, setDocuments] = useState<
    Database["public"]["Tables"]["document_files"]["Row"][]
  >([]);
  const [isLoading, setIsLoading] = useState(true);
  const [uploadDialogOpen, setUploadDialogOpen] = useState(false);
  const [selectedCategory, setSelectedCategory] = useState("all");
  const [selectedDeal, setSelectedDeal] = useState("all-deals");
  const { user } = useUser();

  // Fetch documents from Supabase
  const fetchDocuments = useCallback(async () => {
    if (!user) return;

    setIsLoading(true);
    try {
      const supabase = createClerkSupabaseClient();

      // Start with a query that filters by the current user's ID
      // RLS will enforce this anyway, but it's good practice to be explicit
      let query = supabase
        .from("document_files")
        .select("*")
        .eq("uploaded_by", user.id);

      // Apply additional filters if selected
      if (selectedCategory !== "all") {
        query = query.eq("category", selectedCategory);
      }

      if (selectedDeal !== "all-deals" && selectedDeal !== "multiple") {
        query = query.eq("deal_id", selectedDeal);
      } else if (selectedDeal === "multiple") {
        query = query.eq("deal_id", "multiple");
      }

      const response = await query.order("uploaded_at", {
        ascending: false,
      });

      if (response.error) {
        let errorMsg = `Error: ${response.error.message}`;
        if (response.error.details) {
          errorMsg += ` - ${response.error.details}`;
        }
        throw new Error(errorMsg);
      }

      setDocuments(response.data || []);
    } catch (error) {
      console.error(
        "Error fetching documents:",
        error instanceof Error ? error.message : error
      );
      // Optionally, set an error state here for the UI
    } finally {
      setIsLoading(false);
    }
  }, [user, selectedCategory, selectedDeal]);

  useEffect(() => {
    if (user) {
      fetchDocuments();
    }
  }, [selectedCategory, selectedDeal, user, fetchDocuments]);

  // Handle document download
  const handleDownload = async (fileUrl: string, fileName: string) => {
    try {
      const response = await fetch(fileUrl);
      const blob = await response.blob();

      // Create a download link and trigger it
      const downloadLink = document.createElement("a");
      downloadLink.href = URL.createObjectURL(blob);
      downloadLink.download = fileName;
      document.body.appendChild(downloadLink);
      downloadLink.click();
      document.body.removeChild(downloadLink);
    } catch (error) {
      console.error("Error downloading file:", error);
      // Show error message to user
    }
  };

  // Filter documents based on search term
  const filteredDocuments = documents.filter(
    (doc) =>
      doc.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
      doc.id.toLowerCase().includes(searchTerm.toLowerCase()) ||
      (doc.deal_id &&
        (deals.find((d) => d.id === doc.deal_id)?.name || "")
          .toLowerCase()
          .includes(searchTerm.toLowerCase()))
  );

  // Helper to get deal name from deal_id
  function getDealName(deal_id: string | null) {
    if (!deal_id) return "Multiple";
    const deal = deals.find((d) => d.id === deal_id);
    return deal ? deal.name : "Multiple";
  }

  return (
    <>
      <SiteHeader />
      <div className="flex flex-col gap-4 py-4 md:gap-6 md:py-6 px-4 lg:px-6">
        <div className="flex items-center justify-between">
          <h1 className="text-2xl font-bold tracking-tight">Documents</h1>
          <Button onClick={() => setUploadDialogOpen(true)}>
            <Plus className="mr-2 h-4 w-4" />
            Upload Document
          </Button>
        </div>

        <Card>
          <CardHeader>
            <CardTitle>My Documents</CardTitle>
            <CardDescription>
              View and manage your uploaded documents
            </CardDescription>
          </CardHeader>
          <CardContent>
            <div className="flex items-center gap-2 mb-4">
              <div className="relative flex-1 max-w-sm">
                <Search className="absolute left-2.5 top-2.5 h-4 w-4 text-muted-foreground" />
                <Input
                  placeholder="Search documents..."
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  className="pl-8"
                />
              </div>
              <Select
                value={selectedCategory}
                onValueChange={setSelectedCategory}
              >
                <SelectTrigger className="w-[180px]">
                  <SelectValue placeholder="Filter by category" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">All Categories</SelectItem>
                  <SelectItem value="Legal">Legal</SelectItem>
                  <SelectItem value="Financial">Financial</SelectItem>
                  <SelectItem value="Marketing">Marketing</SelectItem>
                  <SelectItem value="Other">Other</SelectItem>
                </SelectContent>
              </Select>
              <Select value={selectedDeal} onValueChange={setSelectedDeal}>
                <SelectTrigger className="w-[180px]">
                  <SelectValue placeholder="Filter by deal" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all-deals">All Deals</SelectItem>
                  {deals.map((deal) => (
                    <SelectItem key={deal.id} value={deal.id}>
                      {deal.name}
                    </SelectItem>
                  ))}
                  <SelectItem value="multiple">Multiple Deals</SelectItem>
                </SelectContent>
              </Select>
            </div>

            {isLoading ? (
              <div className="flex justify-center py-8">
                <p>Loading documents...</p>
              </div>
            ) : filteredDocuments.length === 0 ? (
              <div className="flex flex-col items-center justify-center py-8 text-center">
                <p className="text-muted-foreground mb-2">No documents found</p>
                <Button
                  variant="outline"
                  size="sm"
                  onClick={() => setUploadDialogOpen(true)}
                >
                  <Plus className="mr-2 h-4 w-4" />
                  Upload Your First Document
                </Button>
              </div>
            ) : (
              <Table>
                <TableHeader>
                  <TableRow>
                    <TableHead>ID</TableHead>
                    <TableHead>Name</TableHead>
                    <TableHead>Deal</TableHead>
                    <TableHead>Category</TableHead>
                    <TableHead>Type</TableHead>
                    <TableHead>Size</TableHead>
                    <TableHead>Upload Date</TableHead>
                    <TableHead className="text-right">Actions</TableHead>
                  </TableRow>
                </TableHeader>
                <TableBody>
                  {filteredDocuments.map((doc) => (
                    <TableRow key={doc.id}>
                      <TableCell className="font-medium">{doc.id}</TableCell>
                      <TableCell>{doc.name}</TableCell>
                      <TableCell>{getDealName(doc.deal_id)}</TableCell>
                      <TableCell>
                        <Badge
                          variant={
                            doc.category === "Legal"
                              ? "default"
                              : doc.category === "Financial"
                              ? "secondary"
                              : "outline"
                          }
                        >
                          {doc.category}
                        </Badge>
                      </TableCell>
                      <TableCell>{doc.file_type}</TableCell>
                      <TableCell>{formatFileSize(doc.file_size)}</TableCell>
                      <TableCell>
                        {doc.upload_date
                          ? new Date(doc.upload_date).toLocaleDateString()
                          : ""}
                      </TableCell>
                      <TableCell className="text-right">
                        <Button
                          variant="ghost"
                          size="icon"
                          onClick={() =>
                            doc.file_url && doc.name
                              ? handleDownload(doc.file_url, doc.name)
                              : undefined
                          }
                          disabled={!doc.file_url || !doc.name}
                        >
                          <Download className="h-4 w-4" />
                          <span className="sr-only">Download</span>
                        </Button>
                      </TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            )}
          </CardContent>
        </Card>
      </div>

      <UploadDocumentDialog
        open={uploadDialogOpen}
        handleOpenChangeAction={setUploadDialogOpen}
        deals={deals}
        onUploadComplete={fetchDocuments}
      />
    </>
  );
}

// Helper function to format file size
function formatFileSize(bytes: number | null): string {
  if (bytes == null) return "";
  if (bytes < 1024) return bytes + " B";
  else if (bytes < 1048576) return (bytes / 1024).toFixed(1) + " KB";
  else return (bytes / 1048576).toFixed(1) + " MB";
}
