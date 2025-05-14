"use client";

import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";
import type { Tables } from "@/types/supabase";

type Distribution = Tables<"bs_investor_distributions">;

interface UseDistributionsOptions {
  status?: string;
  type?: string;
  search?: string;
  period?: string;
}

export function useDistributions(options: UseDistributionsOptions = {}) {
  const [distributions, setDistributions] = useState<Distribution[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<Error | null>(null);
  const router = useRouter();

  useEffect(() => {
    async function fetchDistributions() {
      setLoading(true);
      setError(null);

      try {
        // Build query params
        const params = new URLSearchParams();
        if (options.status) params.append("status", options.status);
        if (options.type) params.append("type", options.type);
        if (options.search) params.append("search", options.search);
        if (options.period) params.append("period", options.period);

        const response = await fetch(`/api/distributions?${params.toString()}`);

        if (!response.ok) {
          if (response.status === 401) {
            // Unauthorized, redirect to login
            router.push("/sign-in");
            return;
          }
          throw new Error(`Error ${response.status}: ${response.statusText}`);
        }

        const data = await response.json();
        setDistributions(data);
      } catch (err) {
        console.error("Failed to fetch distributions:", err);
        setError(err instanceof Error ? err : new Error(String(err)));
      } finally {
        setLoading(false);
      }
    }

    fetchDistributions();
  }, [options.status, options.type, options.search, options.period, router]);

  return { distributions, loading, error };
}
