import { NextResponse } from "next/server";
import { getSupabaseClient } from "@/lib/supabase-server";
import { auth } from "@clerk/nextjs/server";
import type { Tables } from "@/types/supabase";

export async function GET(request: Request) {
  try {
    const { userId } = await auth();
    if (!userId) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    console.log("Clerk user ID at runtime:", userId);

    const supabase = await getSupabaseClient();
    const url = new URL(request.url);
    const searchParams = url.searchParams;
    const status = searchParams.get("status") ?? "";
    const type = searchParams.get("type") ?? "";
    const search = searchParams.get("search") ?? "";

    // 1. Find the user in auth_user_profile
    const { data: userProfile, error: userProfileError } = await supabase
      .from("auth_user_profile")
      .select("email")
      .eq("clerk_id", userId)
      .single();

    console.log("User profile lookup result:", {
      userProfile,
      userProfileError,
      userId,
    });

    if (userProfileError || !userProfile) {
      return NextResponse.json(
        { error: "User profile not found" },
        { status: 404 }
      );
    }

    // 2. Find the contact_id in the contact table using the user's email
    const { data: contact, error: contactError } = await supabase
      .from("contact")
      .select("id")
      .eq("email_address", userProfile.email ?? "")
      .single();

    console.log("Contact lookup result:", {
      contact,
      contactError,
      userEmail: userProfile.email,
    });

    if (contactError || !contact) {
      return NextResponse.json({ error: "Contact not found" }, { status: 404 });
    }

    // 3. Query bsi_deals using the correct contact_id
    let query = supabase
      .from("bsi_deals")
      .select(
        `
        *,
        deal!bsi_deals_deal_id_fkey(*)
      `
      )
      .eq("contact_id", Number(contact.id ?? 0));

    // Apply filters if provided (note: these may need adjustment based on actual deal table structure)
    // if (status) {
    //   query = query.eq("deal.deal_disposition_1", status);
    // }

    // if (type) {
    //   query = query.eq("deal.deal_type", type);
    // }

    // if (search) {
    //   query = query.or(
    //     `deal.deal_name.ilike.%${search}%,deal.id.ilike.%${search}%`
    //   );
    // }

    const { data, error } = await query;

    if (error) {
      console.error("Error fetching deals:", error);
      return NextResponse.json({ error: error.message }, { status: 500 });
    }

    // After fetching all user_profile rows:
    const { data: allClerkIds } = await supabase
      .from("auth_user_profile")
      .select("clerk_id");

    console.log("All clerk_ids in DB:", allClerkIds);

    // The returned data is: Array<{ ...bsi_deals fields..., deal: Tables<"deal"> }>
    return NextResponse.json(
      (data || []) as (Tables<"bsi_deals"> & {
        deal: Tables<"deal">;
      })[]
    );
  } catch (error) {
    console.error("Unexpected error:", error);
    return NextResponse.json(
      { error: "An unexpected error occurred" },
      { status: 500 }
    );
  }
}
