"use server";

import { getSupabaseClient } from "@/lib/supabase";
import { auth } from "@clerk/nextjs/server";
import { revalidatePath } from "next/cache";

export async function createDeal(formData: FormData) {
  const { userId } = auth();
  if (!userId) {
    throw new Error("Unauthorized");
  }

  const name = formData.get("name") as string;
  const type = formData.get("type") as string;
  const amount = formData.get("amount") as string;
  const location = formData.get("location") as string;
  const description = formData.get("description") as string;
  const roi = formData.get("roi") as string;
  const startDate = formData.get("startDate") as string;
  const status = (formData.get("status") as string) || "Active";

  if (!name || !type || !amount || !location || !roi || !startDate) {
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
      id: dealId,
      name,
      type,
      amount: cleanAmount,
      location,
      description,
      roi,
      start_date: startDate,
      status,
      created_by: userId,
      created_at: new Date().toISOString(),
    });

    if (error) {
      throw new Error(error.message);
    }

    // Add the current user as a contact for this deal (assuming they're an admin/owner)
    const { error: contactError } = await supabase
      .from("deal_contacts")
      .insert({
        deal_id: dealId,
        contact_id: userId,
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
  const { userId } = auth();
  if (!userId) {
    throw new Error("Unauthorized");
  }

  const id = formData.get("id") as string;
  const name = formData.get("name") as string;
  const type = formData.get("type") as string;
  const amount = formData.get("amount") as string;
  const location = formData.get("location") as string;
  const description = formData.get("description") as string;
  const roi = formData.get("roi") as string;
  const startDate = formData.get("startDate") as string;
  const status = formData.get("status") as string;

  if (
    !id ||
    !name ||
    !type ||
    !amount ||
    !location ||
    !roi ||
    !startDate ||
    !status
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
        name,
        type,
        amount: cleanAmount,
        location,
        description,
        roi,
        start_date: startDate,
        status,
        updated_at: new Date().toISOString(),
      })
      .eq("id", id);

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
  const { userId } = auth();
  if (!userId) {
    throw new Error("Unauthorized");
  }

  try {
    const supabase = await getSupabaseClient();

    // Check if the user has permission to delete this deal
    const { data: dealContact, error: checkError } = await supabase
      .from("deal_contacts")
      .select("*")
      .eq("deal_id", id)
      .eq("contact_id", userId)
      .eq("role", "Owner")
      .single();

    if (checkError || !dealContact) {
      throw new Error("You don't have permission to delete this deal");
    }

    // Delete the deal
    const { error } = await supabase.from("deal").delete().eq("id", id);

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
