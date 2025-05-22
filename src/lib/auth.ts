import { useState, useEffect } from "react";
import { createClientComponentClient } from "@supabase/auth-helpers-nextjs";
import type { Database } from "@/types/supabase";

export async function checkInternalAccess() {
  const supabase = createClientComponentClient<Database>();

  try {
    const { data: profile, error } = await supabase
      .from("auth_user_profiles")
      .select("is_internal_yn, is_active_yn")
      .single();

    if (error) {
      // If we get a permission error, user is not internal
      if (error.code === "PGRST116") {
        return false;
      }
      throw error;
    }

    return profile?.is_internal_yn === true && profile?.is_active_yn === true;
  } catch (error) {
    console.error("Error checking internal access:", error);
    return false;
  }
}

export function useInternalAccess() {
  // React hook to check internal access
  const [isInternal, setIsInternal] = useState<boolean>(false);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    checkInternalAccess()
      .then(setIsInternal)
      .finally(() => setLoading(false));
  }, []);

  return { isInternal, loading };
}
