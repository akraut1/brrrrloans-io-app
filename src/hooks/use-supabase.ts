"use client";

import { useSession } from "@clerk/nextjs";
import { useEffect, useMemo } from "react";
import { createClient } from "@supabase/supabase-js";
import type { Database } from "@/types/supabase";

// Type-safe environment variables
const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL as string;
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY as string;

/**
 * Hook to get a Supabase client configured with the current user's
 * Clerk session token. This matches the pattern from:
 * https://github.com/clerk/clerk-supabase-nextjs
 */
export function useSupabase() {
  const { session } = useSession();
  
  const supabase = useMemo(() => {
    return createClient<Database>(supabaseUrl, supabaseAnonKey, {
      auth: {
        persistSession: false,
        autoRefreshToken: false,
      },
    });
  }, []);

  useEffect(() => {
    async function setupToken() {
      if (session) {
        const token = await session.getToken({ template: "supabase" });
        if (token) {
          await supabase.auth.setSession({
            access_token: token,
            refresh_token: "",
          });
        }
      }
    }
    setupToken();
  }, [session, supabase]);

  return supabase;
}
