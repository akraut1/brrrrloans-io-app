"use client";

import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";

interface Document {
  id: string;
  name: string;
  deal_id: string;
  deal_name: string;
  category: string;
  file_type: string;
  file_size: number;
  file_url: string;
  upload_date: string;
}

interface UseDocumentsOptions {
  category?: string;
  dealId?: string;
  search?: string;
}

export function useDocuments(options: UseDocumentsOptions = {}) {
  const [documents, setDocuments] = useState<Document[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<Error | null>(null);
  const router = useRouter();

  useEffect(() => {
    async function fetchDocuments() {
      setLoading(true);
      setError(null);

      try {
        // Build query params
        const params = new URLSearchParams();
        if (options.category) params.append("category", options.category);
        if (options.dealId) params.append("dealId", options.dealId);
        if (options.search) params.append("search", options.search);

        const response = await fetch(`/api/documents?${params.toString()}`);

        if (!response.ok) {
          if (response.status === 401) {
            // Unauthorized, redirect to login
            router.push("/sign-in");
            return;
          }
          throw new Error(`Error ${response.status}: ${response.statusText}`);
        }

        const data = await response.json();
        setDocuments(data);
      } catch (err) {
        console.error("Failed to fetch documents:", err);
        setError(err instanceof Error ? err : new Error(String(err)));
      } finally {
        setLoading(false);
      }
    }

    fetchDocuments();
  }, [options.category, options.dealId, options.search, router]);

  return { documents, loading, error };
}

export async function deleteDocument(id: string) {
  const response = await fetch(`/api/documents/${id}`, {
    method: "DELETE",
  });

  if (!response.ok) {
    const error = await response.json();
    throw new Error(error.message || "Failed to delete document");
  }

  return await response.json();
}
