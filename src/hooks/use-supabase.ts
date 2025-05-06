"use client";

import { useSession } from "@clerk/nextjs";
import { useEffect, useMemo } from "react";
import { createClerkSupabaseClient } from "@/lib/supabase";

/**
 * Hook to get a Supabase client configured with the current user's
 * Clerk session token. This matches the pattern from:
 * https://github.com/clerk/clerk-supabase-nextjs
 */
export function useSupabase() {
  const { session } = useSession();
  const supabase = useMemo(() => createClerkSupabaseClient(), []);

  useEffect(() => {
    async function setupToken() {
      if (session) {
        const token = await session.getToken({ template: "supabase" });
        if (token) {
          supabase.auth.setSession({
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
