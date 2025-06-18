import { NextRequest, NextResponse } from "next/server";
import { getSupabaseClient } from "@/lib/supabase-server";
import { auth } from "@clerk/nextjs/server";

export async function GET(request: NextRequest) {
  try {
    // Parse the request URL to get query parameters
    const url = new URL(request.url);
    const investorId = url.searchParams.get("investorId");
    const orgId = url.searchParams.get("orgId");

    // Use Clerk authentication
    const { userId } = await auth();
    if (!userId) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    // Get Clerk-integrated Supabase client
    const supabase = await getSupabaseClient();

    // Get user profile to check if they're a balance sheet investor or admin
    const { data: authUserProfile, error: profileError } = await supabase
      .from("auth_user_profile")
      .select("clerk_role, email")
      .eq("clerk_id", userId)
      .single();

    if (profileError || !authUserProfile) {
      return NextResponse.json(
        { error: "User profile not found" },
        { status: 404 }
      );
    }

    // Find the contact_id for this user
    const { data: contact, error: contactError } = await supabase
      .from("contact")
      .select("id")
      .eq("email_address", authUserProfile.email)
      .single();

    if (contactError || !contact) {
      return NextResponse.json(
        { error: "Contact not found for user" },
        { status: 404 }
      );
    }

    // Query the database for investor statements
    // RLS will automatically filter statements based on user permissions
    let query = supabase.from("bs_investor_statements").select("*");

    // If investorId is provided, filter by it
    if (investorId) {
      const parsedInvestorId = parseInt(investorId, 10);
      if (isNaN(parsedInvestorId)) {
        return NextResponse.json(
          { error: "Invalid investor ID" },
          { status: 400 }
        );
      }
      query = query.eq("investor_id", parsedInvestorId);
    } else {
      // If no specific investor ID, show statements for the current user's contact
      query = query.eq("investor_id", contact.id);
    }

    // Admin users can access more data
    if (authUserProfile.clerk_role === "admin") {
      // Admins can access all statements if no specific filters are provided
      if (!investorId) {
        query = supabase.from("bs_investor_statements").select("*");
      }
    }

    // Order by date
    query = query.order("statement_date", { ascending: false });

    const { data, error } = await query;

    if (error) {
      console.error("Error fetching investor statements:", error);
      return NextResponse.json(
        { error: "Failed to fetch investor statements" },
        { status: 500 }
      );
    }

    return NextResponse.json({ statements: data });
  } catch (error) {
    console.error("Error in investor statements API:", error);
    return NextResponse.json(
      { error: "Internal server error" },
      { status: 500 }
    );
  }
}
