"use client";

import { createClient, type SupabaseClient } from "@supabase/supabase-js";
import type { Database } from "@/types/supabase";

// Type-safe environment variables for client usage
const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL as string;
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY as string;

/**
 * Creates a client-side Supabase client.
 * This is safe to use in client components.
 */
export function createSupabaseClient(): SupabaseClient<Database> {
  return createClient<Database>(supabaseUrl, supabaseAnonKey, {
    auth: {
      persistSession: false,
      autoRefreshToken: false,
    },
  });
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
