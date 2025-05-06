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

/**
 * Creates a Supabase client that uses Clerk session tokens for authentication.
 * Use this in client components where you need to manually set the token.
 */
export function createClerkSupabaseClient(): SupabaseClient<Database> {
  return createClient<Database>(supabaseUrl, supabaseAnonKey, {
    auth: {
      persistSession: false,
      autoRefreshToken: false,
    },
  });
}

/**
 * Creates a Supabase client with service role access.
 * This should ONLY be used in trusted server contexts like webhooks.
 */
export function createServiceRoleClient(): SupabaseClient<Database> {
  if (!supabaseServiceKey) {
    throw new Error("Missing SUPABASE_SERVICE_ROLE_KEY environment variable");
  }

  return createClient<Database>(supabaseUrl, supabaseServiceKey, {
    auth: {
      persistSession: false,
      autoRefreshToken: false,
    },
  });
}

/**
 * Sets up storage bucket and policies for document storage.
 * This should be called once during app initialization.
 */
export async function setupStorage(): Promise<void> {
  // Skip during build/SSR
  if (typeof window === "undefined") return;

  const client = createClerkSupabaseClient();

  try {
    // Check if the bucket exists
    const { data: buckets, error: bucketsError } =
      await client.storage.listBuckets();

    if (bucketsError) {
      console.error("Error listing buckets:", bucketsError);
      return;
    }

    const documentsBucketExists = buckets?.some(
      (bucket) => bucket.name === "documents"
    );

    // Create the bucket if it doesn't exist
    if (!documentsBucketExists) {
      const { error: createError } = await client.storage.createBucket(
        "documents",
        {
          public: false,
          fileSizeLimit: 52428800, // 50MB in bytes
        }
      );

      if (createError) {
        console.error("Error creating documents bucket:", createError);
        return;
      }

      console.log("Documents bucket created successfully");

      // Set up storage policies for the documents bucket
      const { error: policyError } = await client.rpc("create_storage_policy", {
        bucket_name: "documents",
        policy_name: "User Access Policy",
        definition:
          "((bucket_id = 'documents'::text) AND (auth.uid()::text = (storage.foldername(name))[1]))",
      });

      if (policyError) {
        console.error("Error setting up storage policy:", policyError);
      }
    }
  } catch (error) {
    console.error("Error setting up storage:", error);
  }
}

/**
 * Helper function to set the Supabase JWT from Clerk
 */
export async function setSupabaseToken(
  client: SupabaseClient<Database>,
  token: string
): Promise<void> {
  await client.auth.setSession({
    access_token: token,
    refresh_token: "",
  });
}
