import { NextResponse } from "next/server";
import { getSupabaseClient } from "@/lib/supabase-server";
import { auth } from "@clerk/nextjs/server";

export async function GET(request: Request) {
  const { userId } = auth();
  if (!userId) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  const url = new URL(request.url);
  const searchParams = url.searchParams;
  const frequency = searchParams.get("frequency");
  const search = searchParams.get("search");

  try {
    // Get reports available to this user
    let query = getSupabaseClient.from("reports").select("*");

    // Apply filters
    if (frequency && frequency !== "all") {
      query = query.eq("frequency", frequency);
    }

    if (search) {
      query = query.or(
        `name.ilike.%${search}%,id.ilike.%${search}%,description.ilike.%${search}%`
      );
    }

    // Order by last generated date descending (newest first)
    query = query.order("last_generated", { ascending: false });

    const { data, error } = await query;

    if (error) {
      console.error("Error fetching reports:", error);
      return NextResponse.json({ error: error.message }, { status: 500 });
    }

    return NextResponse.json(data);
  } catch (error) {
    console.error("Unexpected error:", error);
    return NextResponse.json(
      { error: "An unexpected error occurred" },
      { status: 500 }
    );
  }
}
