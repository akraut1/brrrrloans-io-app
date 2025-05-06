"use server";

import { auth } from "@clerk/nextjs/server";
import { revalidatePath } from "next/cache";
import { getSupabaseClient } from "@/lib/supabase-server";

export async function uploadDocument(formData: FormData) {
  const { userId } = await auth();
  if (!userId) {
    throw new Error("Unauthorized");
  }

  const documentName = formData.get("name") as string;
  const documentDealId = formData.get("deal_id") as string;
  const documentBorrowerId = formData.get("borrower_id") as string;
  const documentGuarantorId = formData.get("guarantor_id") as string;
  const documentEntityId = formData.get("entity_id") as string;
  const documentPropertyId = formData.get("property_id") as string;
  const documentCategory = formData.get("category") as string;
  const documentIsRequired = formData.get("is_required") === "true";
  const documentStatus = formData.get("status") as string;
  const documentFileUrl = formData.get("file_url") as string;
  const documentFileSize = Number.parseInt(formData.get("file_size") as string);
  const documentFileType = formData.get("file_type") as string;
  const documentFilePath = formData.get("file_path") as string;

  if (
    !documentName ||
    !documentDealId ||
    !documentBorrowerId ||
    !documentGuarantorId ||
    !documentEntityId ||
    !documentPropertyId ||
    !documentCategory ||
    !documentIsRequired ||
    !documentStatus ||
    !documentFileUrl ||
    !documentFileSize ||
    !documentFileType
  ) {
    throw new Error("Missing required fields");
  }

  try {
    const supabase = await getSupabaseClient();

    // Generate a document ID
    const documentId = `DOC-${Math.floor(100000 + Math.random() * 900000)}`;

    // Insert document record
    const { error } = await supabase.from("document_files").insert({
      id: documentId,
      name: documentName,
      deal_id: documentDealId,
      borrower_id: documentBorrowerId,
      guarantor_id: documentGuarantorId,
      entity_id: documentEntityId,
      property_id: documentPropertyId,
      category: documentCategory,
      is_required: documentIsRequired,
      status: documentStatus,
      file_type: documentFileType,
      file_size: documentFileSize,
      file_url: documentFileUrl,
      file_path: documentFilePath,
      uploaded_by: userId,
      upload_date: new Date().toISOString(),
    });

    if (error) {
      throw new Error(error.message);
    }

    revalidatePath("/dashboard/documents");
    return { success: true, documentId };
  } catch (error) {
    console.error("Error uploading document:", error);
    throw error;
  }
}

export async function deleteDocument(id: string) {
  const { userId } = await auth();
  if (!userId) {
    throw new Error("Unauthorized");
  }

  try {
    const supabase = await getSupabaseClient();

    // First get the document to check ownership and get file path
    const { data: document, error: fetchError } = await supabase
      .from("document_files")
      .select("*")
      .eq("id", id)
      .eq("uploaded_by", userId)
      .single();

    if (fetchError) {
      throw new Error(fetchError.message);
    }

    if (!document) {
      throw new Error("Document not found");
    }

    // Delete the file from storage if we have a path
    if (document.file_path) {
      const { error: storageError } = await supabase.storage
        .from("document_files")
        .remove([document.file_path]);

      if (storageError) {
        console.error("Error deleting file from storage:", storageError);
        // Continue anyway to delete the database record
      }
    }

    // Delete the document record
    const { error: deleteError } = await supabase
      .from("document_files")
      .delete()
      .eq("id", id);

    if (deleteError) {
      throw new Error(deleteError.message);
    }

    revalidatePath("/dashboard/documents");
    return { success: true };
  } catch (error) {
    console.error("Error deleting document:", error);
    throw error;
  }
}
