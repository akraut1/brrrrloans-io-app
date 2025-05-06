import { NextResponse } from "next/server";
import { getSupabaseClient } from "@/lib/supabase-server";
import { auth } from "@clerk/nextjs/server";

export async function GET(request: Request) {
  try {
    const { userId } = await auth();
    if (!userId) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const supabase = await getSupabaseClient();
    const url = new URL(request.url);
    const searchParams = url.searchParams;
    const status = searchParams.get("status");
    const type = searchParams.get("type");
    const search = searchParams.get("search");
    const period = searchParams.get("period") || "all"; // time period filter

    // Get distributions for this investor
    let query = supabase
      .from("bs_investor_distribution_details")
      .select(
        `
        *,
        bs_investor_distribution_payments!inner(contact_id),
        deal:deal_id(name)
      `
      )
      .eq("bs_investor_distribution_payments.contact_id", userId);

    // Apply time period filter
    if (period !== "all") {
      const now = new Date();
      const startDate = new Date();

      if (period === "3m") {
        startDate.setMonth(now.getMonth() - 3);
      } else if (period === "6m") {
        startDate.setMonth(now.getMonth() - 6);
      } else if (period === "1y") {
        startDate.setFullYear(now.getFullYear() - 1);
      }

      query = query.gte("distribution_date", startDate.toISOString());
    }

    // Apply other filters
    if (status) {
      query = query.eq("status", status);
    }

    if (type) {
      query = query.eq("distribution_type", type);
    }

    if (search) {
      query = query.or(`id.ilike.%${search}%,deal.name.ilike.%${search}%`);
    }

    // Order by date descending (newest first)
    query = query.order("distribution_date", { ascending: false });

    const { data, error } = await query;

    if (error) {
      console.error("Error fetching distributions:", error);
      return NextResponse.json({ error: error.message }, { status: 500 });
    }

    return NextResponse.json(data || []);
  } catch (error) {
    console.error("Unexpected error:", error);
    return NextResponse.json(
      { error: "An unexpected error occurred" },
      { status: 500 }
    );
  }
}
