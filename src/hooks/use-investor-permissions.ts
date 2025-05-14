import { useEffect, useState } from "react";
import { createClientComponentClient } from "@supabase/auth-helpers-nextjs";
import type { Database } from "@/types/supabase";

interface InvestorPermissions {
  canViewDeal: (dealId: string) => Promise<boolean>;
  canViewDocument: (documentId: string) => Promise<boolean>;
  canViewContribution: (contributionId: string) => Promise<boolean>;
  canViewDistribution: (distributionId: string) => Promise<boolean>;
  isLoading: boolean;
}

export function useInvestorPermissions(): InvestorPermissions {
  const [isLoading, setIsLoading] = useState(true);
  const supabase = createClientComponentClient<Database>();

  // Cache results to avoid repeated DB calls
  const permissionCache = new Map<string, boolean>();

  const canViewDeal = async (dealId: string): Promise<boolean> => {
    const cacheKey = `deal:${dealId}`;
    if (permissionCache.has(cacheKey)) {
      return permissionCache.get(cacheKey)!;
    }

    const { data, error } = await supabase
      .from("bs_investor_deals")
      .select("deal_id")
      .eq("deal_id", Number(dealId))
      .single();

    const hasAccess = !error;
    permissionCache.set(cacheKey, hasAccess);
    return hasAccess;
  };

  const canViewDocument = async (documentId: string): Promise<boolean> => {
    const cacheKey = `document:${documentId}`;
    if (permissionCache.has(cacheKey)) {
      return permissionCache.get(cacheKey)!;
    }

    const idNum = Number(documentId);
    if (Number.isNaN(idNum)) {
      permissionCache.set(cacheKey, false);
      return false;
    }

    const { data, error } = await supabase
      .from("document_files")
      .select("id")
      .eq("id", idNum)
      .single();

    const hasAccess = !error;
    permissionCache.set(cacheKey, hasAccess);
    return hasAccess;
  };

  const canViewContribution = async (
    contributionId: string
  ): Promise<boolean> => {
    const cacheKey = `contribution:${contributionId}`;
    if (permissionCache.has(cacheKey)) {
      return permissionCache.get(cacheKey)!;
    }

    const { data, error } = await supabase
      .from("bs_investor_transactions")
      .select("id, ledger_entry_type")
      .eq("id", Number(contributionId))
      .eq("ledger_entry_type", "contribution")
      .single();

    const hasAccess = !error && data?.ledger_entry_type === "contribution";
    permissionCache.set(cacheKey, hasAccess);
    return hasAccess;
  };

  const canViewDistribution = async (
    distributionId: string
  ): Promise<boolean> => {
    const cacheKey = `distribution:${distributionId}`;
    if (permissionCache.has(cacheKey)) {
      return permissionCache.get(cacheKey)!;
    }

    const { data, error } = await supabase
      .from("bs_investor_transactions")
      .select("id, ledger_entry_type")
      .eq("id", Number(distributionId))
      .eq("ledger_entry_type", "interest")
      .single();

    const hasAccess = !error && data?.ledger_entry_type === "interest";
    permissionCache.set(cacheKey, hasAccess);
    return hasAccess;
  };

  useEffect(() => {
    setIsLoading(false);
    return () => {
      permissionCache.clear();
    };
  }, []);

  return {
    canViewDeal,
    canViewDocument,
    canViewContribution,
    canViewDistribution,
    isLoading,
  };
}
