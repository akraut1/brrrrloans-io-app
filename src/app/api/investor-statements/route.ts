import { createRouteHandlerClient } from "@supabase/auth-helpers-nextjs";
import { cookies } from "next/headers";
import { NextRequest, NextResponse } from "next/server";

export async function GET(request: NextRequest) {
  try {
    // Parse the request URL to get query parameters
    const url = new URL(request.url);
    const investorId = url.searchParams.get("investorId");
    const orgId = url.searchParams.get("orgId");

    const supabase = createRouteHandlerClient({ cookies });

    // Check if user is authenticated
    const {
      data: { user },
    } = await supabase.auth.getUser();

    if (!user) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    // Get user profile to check if they're a balance sheet investor or admin
    const { data: authUserProfiles } = await supabase
      .from("auth_user_profiles")
      .select("role")
      .eq("id", user.id)
      .single();

    // Query the database for investor statements
    // RLS will automatically filter statements based on user permissions
    let query = supabase.from("bs_investor_statements").select("*");

    // If investorId is provided, filter by it
    if (investorId) {
      query = query.eq("investor_id", investorId);
    }

    // If orgId is provided and user is either admin or balance sheet investor,
    // include statements for that organization
    if (
      (orgId && authUserProfiles?.role === "admin") ||
      authUserProfiles?.role === "balance_sheet_investor"
    ) {
      // If we're also filtering by investorId, use an OR condition
      if (investorId) {
        query = query.or(`investor_id.eq.${investorId},org_id.eq.${orgId}`);
      } else {
        query = query.eq("org_id", orgId);
      }
    }

    // Check if user is part of any organizations and include those statements as well
    // (Only if they're a balance sheet investor)
    if (authUserProfiles?.role === "balance_sheet_investor" && !orgId) {
      const { data: userOrgs } = await supabase
        .from("user_clerk_org_members")
        .select("org_id")
        .eq("user_id", user.id);

      if (userOrgs && userOrgs.length > 0) {
        const orgIds = userOrgs.map((org) => org.org_id);

        // If we're already filtering by investorId, use an OR condition
        if (investorId) {
          query = query.or(
            `investor_id.eq.${investorId},org_id.in.(${orgIds.join(",")})`
          );
        } else {
          query = query.in("org_id", orgIds);
        }
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
