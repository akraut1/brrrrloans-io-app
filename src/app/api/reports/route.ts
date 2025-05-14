import { NextResponse } from "next/server";
import { getSupabaseClient } from "@/lib/supabase-server";
import { auth } from "@clerk/nextjs/server";

export async function GET(request: Request) {
  const { userId } = await auth();
  if (!userId) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  const url = new URL(request.url);
  const searchParams = url.searchParams;
  const frequency = searchParams.get("frequency");
  const search = searchParams.get("search");

  try {
    // TODO: The 'reports' table does not exist in the Supabase types. Replace with a valid table or add to schema.
    // The following block is commented out until schema alignment:
    // const supabase = await getSupabaseClient();
    // let query = supabase.from("reports").select("*");
    // if (frequency && frequency !== "all") {
    //   query = query.eq("frequency", frequency);
    // }
    // if (search) {
    //   query = query.or(
    //     `name.ilike.%${search}%,id.ilike.%${search}%,description.ilike.%${search}%`
    //   );
    // }
    // query = query.order("last_generated", { ascending: false });
    // const { data, error } = await query;
    // if (error) {
    //   console.error("Error fetching reports:", error);
    //   return NextResponse.json({ error: error.message }, { status: 500 });
    // }
    // return NextResponse.json(data);
    return NextResponse.json(
      {
        error:
          "Not implemented: 'reports' table does not exist in Supabase types. Please align schema.",
      },
      { status: 501 }
    );
  } catch (error) {
    console.error("Unexpected error:", error);
    return NextResponse.json(
      { error: "An unexpected error occurred" },
      { status: 500 }
    );
  }
}
