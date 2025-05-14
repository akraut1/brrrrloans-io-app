"use server";

import { auth } from "@clerk/nextjs/server";
import { revalidatePath } from "next/cache";
import { getSupabaseClient } from "@/lib/supabase-server";
import type { Enums } from "@/types/supabase";

export async function uploadDocument(formData: FormData) {
  const { userId } = await auth();
  if (!userId) {
    throw new Error("Unauthorized");
  }

  const documentName = formData.get("name");
  const documentDealId = formData.get("deal_id");
  const documentBorrowerId = formData.get("borrower_id");
  const documentGuarantorId = formData.get("guarantor_id");
  const documentEntityId = formData.get("entity_id");
  const documentPropertyId = formData.get("property_id");
  const documentCategory = formData.get("category");
  const documentIsRequired = formData.get("is_required") === "true";
  const documentStatus = formData.get("status");
  const documentFileUrl = formData.get("file_url");
  const documentFileSizeRaw = formData.get("file_size");
  const documentFileType = formData.get("file_type");
  const documentFilePath = formData.get("file_path");

  if (
    typeof documentName !== "string" ||
    typeof documentDealId !== "string" ||
    typeof documentBorrowerId !== "string" ||
    typeof documentGuarantorId !== "string" ||
    typeof documentEntityId !== "string" ||
    typeof documentPropertyId !== "string" ||
    typeof documentCategory !== "string" ||
    typeof documentStatus !== "string" ||
    typeof documentFileUrl !== "string" ||
    typeof documentFileSizeRaw !== "string" ||
    typeof documentFileType !== "string"
  ) {
    throw new Error("Missing required fields");
  }
  const documentFileSize = Number.parseInt(documentFileSizeRaw);

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
    const allowedCategories = [
      "application",
      "appraisal",
      "assets",
      "closing",
      "credit_and_background",
      "construction",
      "environmental",
      "experience",
      "id",
      "insurance",
      "pricing",
      "property",
      "seasoning",
      "servicing",
      "title",
      "entity",
    ];
    const categoryValue =
      typeof documentCategory === "string" &&
      allowedCategories.includes(documentCategory)
        ? (documentCategory as Enums<"document_category">)
        : undefined;
    const { error } = await supabase.from("document_files").insert({
      category: categoryValue,
      file_type:
        typeof documentFileType === "string" ? documentFileType : undefined,
      file_size:
        typeof documentFileSize === "number" ? documentFileSize : undefined,
      file_url:
        typeof documentFileUrl === "string" ? documentFileUrl : undefined,
      uploaded_by: typeof userId === "string" ? userId : undefined,
      uploaded_at: new Date().toISOString(),
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
      .eq("id", Number(id))
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
      .eq("id", Number(id));

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
