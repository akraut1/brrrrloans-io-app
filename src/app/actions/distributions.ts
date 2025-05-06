"use server"

import { supabase } from "@/lib/supabase"
import { auth } from "@clerk/nextjs/server"
import { revalidatePath } from "next/cache"

export async function createDistribution(formData: FormData) {
  const { userId } = auth()
  if (!userId) {
    throw new Error("Unauthorized")
  }

  const dealId = formData.get("dealId") as string
  const distributionType = formData.get("distributionType") as string
  const totalAmount = formData.get("totalAmount") as string
  const distributionDate = formData.get("distributionDate") as string
  const status = (formData.get("status") as string) || "Scheduled"
  const notes = formData.get("notes") as string

  // Get the investor payments data from the form
  // This would be a JSON string containing an array of investor payment objects
  const investorPaymentsJson = formData.get("investorPayments") as string

  if (!dealId || !distributionType || !totalAmount || !distributionDate || !investorPaymentsJson) {
    throw new Error("Missing required fields")
  }

  try {
    // Parse the investor payments
    const investorPayments = JSON.parse(investorPaymentsJson)

    // Generate a distribution ID
    const distributionId = `DIST-${Math.floor(100000 + Math.random() * 900000)}`

    // Parse amount to remove currency symbol and commas
    const cleanAmount = totalAmount.replace(/[$,]/g, "")

    // Begin a transaction
    const { error: transactionError } = await supabase.rpc("create_distribution", {
      p_distribution_id: distributionId,
      p_deal_id: dealId,
      p_distribution_type: distributionType,
      p_total_amount: cleanAmount,
      p_distribution_date: distributionDate,
      p_status: status,
      p_notes: notes,
      p_created_by: userId,
      p_investor_payments: investorPayments,
    })

    if (transactionError) {
      throw new Error(transactionError.message)
    }

    revalidatePath("/dashboard/distributions")
    return { success: true, distributionId }
  } catch (error) {
    console.error("Error creating distribution:", error)
    throw error
  }
}

export async function updateDistributionStatus(id: string, status: string) {
  const { userId } = auth()
  if (!userId) {
    throw new Error("Unauthorized")
  }

  try {
    // Update distribution status
    const { error } = await supabase
      .from("bs_investor_distributions")
      .update({
        status,
        updated_at: new Date().toISOString(),
        updated_by: userId,
      })
      .eq("id", id)

    if (error) {
      throw new Error(error.message)
    }

    revalidatePath("/dashboard/distributions")
    return { success: true }
  } catch (error) {
    console.error("Error updating distribution status:", error)
    throw error
  }
}

export async function deleteDistribution(id: string) {
  const { userId } = auth()
  if (!userId) {
    throw new Error("Unauthorized")
  }

  try {
    // Check if the distribution is in a state that allows deletion
    const { data: distribution, error: checkError } = await supabase
      .from("bs_investor_distributions")
      .select("status")
      .eq("id", id)
      .single()

    if (checkError) {
      throw new Error(checkError.message)
    }

    if (distribution.status !== "Scheduled") {
      throw new Error("Only scheduled distributions can be deleted")
    }

    // Delete the distribution payments first
    const { error: paymentsError } = await supabase
      .from("bs_investor_distribution_payments")
      .delete()
      .eq("distribution_id", id)

    if (paymentsError) {
      throw new Error(paymentsError.message)
    }

    // Delete the distribution
    const { error } = await supabase.from("bs_investor_distributions").delete().eq("id", id)

    if (error) {
      throw new Error(error.message)
    }

    revalidatePath("/dashboard/distributions")
    return { success: true }
  } catch (error) {
    console.error("Error deleting distribution:", error)
    throw error
  }
}
