"use server";

import { getSupabaseClient } from "@/lib/supabase-server";
import { auth } from "@clerk/nextjs/server";
import { revalidatePath } from "next/cache";

export async function createDeal(formData: FormData) {
  const { userId } = await auth();
  if (!userId) {
    throw new Error("Unauthorized");
  }

  const name = formData.get("name");
  const type = formData.get("type");
  const amount = formData.get("amount");
  const location = formData.get("location");
  const description = formData.get("description");
  const roi = formData.get("roi");
  const startDate = formData.get("startDate");
  const status = formData.get("status") ?? "Active";

  if (
    typeof name !== "string" ||
    typeof type !== "string" ||
    typeof amount !== "string" ||
    typeof location !== "string" ||
    typeof roi !== "string" ||
    typeof startDate !== "string"
  ) {
    throw new Error("Missing required fields");
  }

  try {
    const supabase = await getSupabaseClient();

    // Generate a deal ID
    const dealId = `DEAL-${Math.floor(100000 + Math.random() * 900000)}`;

    // Parse amount to remove currency symbol and commas
    const cleanAmount = amount.replace(/[$,]/g, "");

    // Insert deal record
    const { error } = await supabase.from("deal").insert({
      deal_name: name,
      type,
      amount: cleanAmount,
      location,
      description,
      roi,
      start_date: startDate,
      status,
      created_at: new Date().toISOString(),
    });

    if (error) {
      throw new Error(error.message);
    }

    // Add the current user as a contact for this deal (assuming they're an admin/owner)
    const { error: contactError } = await supabase.from("deal_roles").insert({
      deal_id: Number(dealId),
      contact_id: Number(userId),
      role: "Owner",
      created_at: new Date().toISOString(),
    });

    if (contactError) {
      console.error("Error adding contact to deal:", contactError);
      // Continue anyway as the deal was created
    }

    revalidatePath("/dashboard/deals");
    return { success: true, dealId };
  } catch (error) {
    console.error("Error creating deal:", error);
    throw error;
  }
}

export async function updateDeal(formData: FormData) {
  const { userId } = await auth();
  if (!userId) {
    throw new Error("Unauthorized");
  }

  const id = formData.get("id");
  const name = formData.get("name");
  const type = formData.get("type");
  const amount = formData.get("amount");
  const location = formData.get("location");
  const description = formData.get("description");
  const roi = formData.get("roi");
  const startDate = formData.get("startDate");
  const status = formData.get("status");

  if (
    typeof id !== "string" ||
    typeof name !== "string" ||
    typeof type !== "string" ||
    typeof amount !== "string" ||
    typeof location !== "string" ||
    typeof roi !== "string" ||
    typeof startDate !== "string" ||
    typeof status !== "string"
  ) {
    throw new Error("Missing required fields");
  }

  try {
    const supabase = await getSupabaseClient();

    // Parse amount to remove currency symbol and commas
    const cleanAmount = amount.replace(/[$,]/g, "");

    // Update deal record
    const { error } = await supabase
      .from("deal")
      .update({
        deal_name: name,
        type,
        amount: cleanAmount,
        location,
        description,
        roi,
        start_date: startDate,
        status,
        updated_at: new Date().toISOString(),
      })
      .eq("id", Number(id));

    if (error) {
      throw new Error(error.message);
    }

    revalidatePath("/dashboard/deals");
    return { success: true };
  } catch (error) {
    console.error("Error updating deal:", error);
    throw error;
  }
}

export async function deleteDeal(id: string) {
  const { userId } = await auth();
  if (!userId) {
    throw new Error("Unauthorized");
  }

  try {
    const supabase = await getSupabaseClient();

    // Check if the user has permission to delete this deal
    const { data: dealContact, error: checkError } = await supabase
      .from("deal_roles")
      .select("*")
      .eq("deal_id", Number(id))
      .eq("contact_id", Number(userId))
      .eq("role", "Owner")
      .single();

    if (checkError || !dealContact) {
      throw new Error("You don't have permission to delete this deal");
    }

    // Delete the deal
    const { error } = await supabase.from("deal").delete().eq("id", Number(id));

    if (error) {
      throw new Error(error.message);
    }

    revalidatePath("/dashboard/deals");
    return { success: true };
  } catch (error) {
    console.error("Error deleting deal:", error);
    throw error;
  }
}
