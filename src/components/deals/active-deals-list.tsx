"use client";

import { useState, useEffect } from "react";
import { createClientComponentClient } from "@supabase/auth-helpers-nextjs";
import { withInvestorPermission } from "@/components/auth/with-investor-permission";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { useRouter } from "next/navigation";
import type { Database } from "@/types/supabase";

interface Deal {
  id: string;
  name: string;
  status: string;
  investment_amount: string;
  investment_date: string;
  last_distribution_date: string | null;
  last_distribution_amount: string | null;
}

function UnprotectedActiveDealsList() {
  const [deals, setDeals] = useState<Deal[]>([]);
  const [loading, setLoading] = useState(true);
  const router = useRouter();
  const supabase = createClientComponentClient<Database>();

  useEffect(() => {
    async function fetchDeals() {
      const { data, error } = await supabase
        .from("bs_investor_deals")
        .select(
          `
          deal_id,
          investment_amount,
          investment_date,
          deal:deal_id (
            id,
            name,
            status
          ),
          distributions:bs_investor_distributions (
            distribution_date,
            total_payment_amount
          )
        `
        )
        .eq("status", "Active")
        .order("investment_date", { ascending: false });

      if (!error && data) {
        const formattedDeals = data.map((item) => {
          // Sort distributions by date to get the latest
          const sortedDistributions = item.distributions?.sort(
            (a, b) =>
              new Date(b.distribution_date).getTime() -
              new Date(a.distribution_date).getTime()
          );

          return {
            id: item.deal?.id || "",
            name: item.deal?.name || "",
            status: item.deal?.status || "",
            investment_amount: item.investment_amount,
            investment_date: item.investment_date,
            last_distribution_date:
              sortedDistributions?.[0]?.distribution_date || null,
            last_distribution_amount:
              sortedDistributions?.[0]?.total_payment_amount || null,
          };
        });

        setDeals(formattedDeals);
      }
      setLoading(false);
    }

    fetchDeals();
  }, []);

  const formatCurrency = (value: string | null) => {
    if (!value) return "-";
    return new Intl.NumberFormat("en-US", {
      style: "currency",
      currency: "USD",
      minimumFractionDigits: 0,
      maximumFractionDigits: 0,
    }).format(Number(value));
  };

  const formatDate = (date: string | null) => {
    if (!date) return "-";
    return new Date(date).toLocaleDateString();
  };

  if (loading) {
    return <div>Loading active deals...</div>;
  }

  return (
    <Card>
      <CardHeader>
        <CardTitle>Active Deals</CardTitle>
      </CardHeader>
      <CardContent>
        <Table>
          <TableHeader>
            <TableRow>
              <TableHead>Deal Name</TableHead>
              <TableHead>Investment</TableHead>
              <TableHead>Investment Date</TableHead>
              <TableHead>Last Distribution</TableHead>
              <TableHead>Last Distribution Date</TableHead>
              <TableHead>Status</TableHead>
              <TableHead>Actions</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {deals.map((deal) => (
              <TableRow key={deal.id}>
                <TableCell className="font-medium">{deal.name}</TableCell>
                <TableCell>{formatCurrency(deal.investment_amount)}</TableCell>
                <TableCell>{formatDate(deal.investment_date)}</TableCell>
                <TableCell>
                  {formatCurrency(deal.last_distribution_amount)}
                </TableCell>
                <TableCell>{formatDate(deal.last_distribution_date)}</TableCell>
                <TableCell>
                  <Badge variant="outline">{deal.status}</Badge>
                </TableCell>
                <TableCell>
                  <Button
                    variant="ghost"
                    size="sm"
                    onClick={() => router.push(`/dashboard/deals/${deal.id}`)}
                  >
                    View Details
                  </Button>
                </TableCell>
              </TableRow>
            ))}
            {deals.length === 0 && (
              <TableRow>
                <TableCell colSpan={7} className="text-center">
                  No active deals found
                </TableCell>
              </TableRow>
            )}
          </TableBody>
        </Table>
      </CardContent>
    </Card>
  );
}

// Create a permission-protected version of ActiveDealsList
export const ProtectedActiveDealsList = withInvestorPermission(
  UnprotectedActiveDealsList
);

// Usage example:
export function ActiveDealsListWrapper() {
  return (
    <ProtectedActiveDealsList
      resourceType="deal"
      resourceId="all" // Special case for viewing all deals
      fallback={
        <Card>
          <CardHeader>
            <CardTitle>Active Deals</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-center text-muted-foreground">
              You don't have permission to view active deals.
            </div>
          </CardContent>
        </Card>
      }
    />
  );
}
