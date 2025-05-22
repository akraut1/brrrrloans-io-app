import { createClient, type SupabaseClient } from "@supabase/supabase-js";
import type { Database } from "@/types/supabase";

// Type-safe environment variables
const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL as string;
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY as string;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseAnonKey) {
  throw new Error(
    "Missing required environment variables: NEXT_PUBLIC_SUPABASE_URL and/or NEXT_PUBLIC_SUPABASE_ANON_KEY"
  );
}

// Create a Supabase client that uses Clerk session tokens for authentication.
// Use this in client components where you need to manually set the token.

export function createClerkSupabaseClient(): SupabaseClient<Database> {
  return createClient<Database>(supabaseUrl, supabaseAnonKey, {
    auth: {
      persistSession: false,
      autoRefreshToken: false,
    },
  });
}

// Create a Supabase client with service role access.
// This should ONLY be used in trusted server contexts like webhooks.
//
// NOTE: This requires the SUPABASE_SERVICE_ROLE_KEY environment variable.
// If this variable is not set, this function will throw an error.
// For client-side use, use createClerkSupabaseClient instead.

export function createServiceRoleClient(): SupabaseClient<Database> {
  if (!supabaseServiceKey) {
    console.warn("Missing SUPABASE_SERVICE_ROLE_KEY environment variable");
    console.warn(
      "This is only needed for administrative operations like creating buckets or setting up RLS policies"
    );
    console.warn("For client-side use, use createClerkSupabaseClient instead");
    throw new Error("Missing SUPABASE_SERVICE_ROLE_KEY environment variable");
  }

  return createClient<Database>(supabaseUrl, supabaseServiceKey, {
    auth: {
      persistSession: false,
      autoRefreshToken: false,
    },
  });
}

// Supabase Storage - Set up buckets and policies for document storage.
// Note: this should be called once during app initialization.
// Note: This is a simplified version that just checks if the documents bucket exists. It does not try to create the bucket or set up RLS policies (both require service role permissions).
export async function setupStorage(): Promise<void> {
  // Skip during build/SSR
  if (typeof window === "undefined") return;

  try {
    // Use regular client
    const client = createClerkSupabaseClient();

    console.log("Checking if documents bucket exists...");

    // Check if the bucket exists
    try {
      const { data: buckets, error: bucketsError } =
        await client.storage.listBuckets();

      if (bucketsError) {
        console.error("Error listing buckets:", bucketsError);

        if (bucketsError.message.includes("permission denied")) {
          console.warn(
            "You don't have permission to list buckets. Make sure your RLS policies are set up properly."
          );
        }
        return;
      }

      const documentsBucketExists = buckets?.some(
        (bucket) => bucket.name === "documents"
      );

      // Just log whether the bucket exists - no service role operations
      if (documentsBucketExists) {
        console.log("Documents bucket exists");
      } else {
        console.warn("Documents bucket doesn't exist!");
        console.warn(
          "Please create a bucket named 'documents' in your Supabase dashboard:"
        );
        console.warn(`${supabaseUrl}/project/storage/buckets`);
        console.warn(
          "Then set up RLS policies to allow authenticated users to access it."
        );
      }
    } catch (err) {
      console.error("Error checking buckets:", err);
    }
  } catch (error) {
    console.error("Error setting up storage:", error);
  }
}

// Helper function to set the Supabase JWT from Clerk
export async function setSupabaseToken(
  client: SupabaseClient<Database>,
  token: string
): Promise<void> {
  await client.auth.setSession({
    access_token: token,
    refresh_token: "",
  });
}
