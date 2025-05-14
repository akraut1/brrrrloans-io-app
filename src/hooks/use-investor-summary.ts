"use client";

import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";

interface InvestorSummary {
  totalOutstandingBalance: number;
  totalDistributionsPaid: number;
  averageROI: string;
  nextDistributionDate: string | null;
  nextDistributionAmount: number;
  monthlyData: Array<{
    month: string;
    year: number;
    amount: number;
  }>;
}

export function useInvestorSummary() {
  const [summary, setSummary] = useState<InvestorSummary | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<Error | null>(null);
  const router = useRouter();

  useEffect(() => {
    async function fetchSummary() {
      setLoading(true);
      setError(null);

      try {
        const response = await fetch("/api/investor-summary");

        if (!response.ok) {
          if (response.status === 401) {
            // Unauthorized, redirect to login
            router.push("/sign-in");
            return;
          }
          throw new Error(`Error ${response.status}: ${response.statusText}`);
        }

        const data = await response.json();
        setSummary(data);
      } catch (err) {
        console.error("Failed to fetch investor summary:", err);
        setError(err instanceof Error ? err : new Error(String(err)));
      } finally {
        setLoading(false);
      }
    }

    fetchSummary();
  }, [router]);

  return { summary, loading, error };
}
