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

    // Map Clerk userId to contact_id (investor_id) using user_profile
    const { data: profile, error: profileError } = await supabase
      .from("user_profile")
      .select("contact_id")
      .eq("clerk_id", userId)
      .single();

    if (profileError || !profile) {
      return NextResponse.json(
        { error: "User profile not found" },
        { status: 404 }
      );
    }

    const investorId = profile.contact_id;

    if (!investorId) {
      return NextResponse.json(
        { error: "Investor ID not found for this user" },
        { status: 404 }
      );
    }

    const url = new URL(request.url);
    const searchParams = url.searchParams;
    const status = searchParams.get("status");
    const type = searchParams.get("type");
    const search = searchParams.get("search");
    const period = searchParams.get("period") || "all";

    // Query distributions for this investor
    let query = supabase
      .from("bs_investor_distributions")
      .select(
        `
        *,
        deal:deal_id(deal_name)
      `
      )
      .eq("investor_id", investorId);

    // Apply filters
    if (period !== "all") {
      const now = new Date();
      const startDate = new Date();
      if (period === "3m") startDate.setMonth(now.getMonth() - 3);
      else if (period === "6m") startDate.setMonth(now.getMonth() - 6);
      else if (period === "1y") startDate.setFullYear(now.getFullYear() - 1);
      query = query.gte("created_at", startDate.toISOString());
    }
    if (status) query = query.eq("status", status);
    if (type) query = query.eq("distribution_type", type);
    if (search)
      query = query.or(`id.ilike.%${search}%,deal.deal_name.ilike.%${search}%`);

    query = query.order("created_at", { ascending: false });

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
