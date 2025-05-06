import { NextResponse } from "next/server";
import { getSupabaseClient } from "@/lib/supabase-server";
import { auth } from "@clerk/nextjs/server";

export async function GET(request: Request) {
  try {
    const { userId } = await auth();
    if (!userId) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const supabase = await getSupabaseClient();

    // Get total outstanding balance (sum of all active investments)
    const { data: balanceData, error: balanceError } = await supabase
      .from("bs_investor_contributions")
      .select("contribution_amount")
      .eq("contact_id", userId)
      .eq("contribution_status", "Received")
      .eq("active", true);

    if (balanceError) {
      console.error("Error fetching balance:", balanceError);
      return NextResponse.json(
        { error: balanceError.message },
        { status: 500 }
      );
    }

    const totalOutstandingBalance =
      balanceData?.reduce(
        (sum, item) => sum + (Number.parseFloat(item.contribution_amount) || 0),
        0
      ) || 0;

    // Get total distributions paid
    const { data: distributionsData, error: distributionsError } =
      await supabase
        .from("bs_investor_distributions")
        .select(
          `
        total_payment_amount,
        distribution_date,
        bs_investor_distribution_payments!inner(contact_id)
      `
        )
        .eq("bs_investor_distribution_payments.contact_id", userId);

    if (distributionsError) {
      console.error("Error fetching distributions:", distributionsError);
      return NextResponse.json(
        { error: distributionsError.message },
        { status: 500 }
      );
    }

    const totalDistributionsPaid =
      distributionsData?.reduce(
        (sum, item) =>
          sum + (Number.parseFloat(item.total_payment_amount) || 0),
        0
      ) || 0;

    // Get monthly distribution data for charts
    const monthlyData = getMonthlyDistributionData(distributionsData || []);

    // Get next scheduled distribution
    const { data: nextDistribution, error: nextDistributionError } =
      await supabase
        .from("bs_investor_distributions")
        .select(
          `
        total_payment_amount,
        distribution_date,
        bs_investor_distribution_payments!inner(contact_id)
      `
        )
        .eq("bs_investor_distribution_payments.contact_id", userId)
        .eq("status", "Scheduled")
        .order("distribution_date", { ascending: true })
        .limit(1)
        .single();

    if (nextDistributionError && nextDistributionError.code !== "PGRST116") {
      // PGRST116 is "no rows returned" which is fine - just means no scheduled distributions
      console.error("Error fetching next distribution:", nextDistributionError);
      // Continue anyway, we'll just return null for nextDistributionDate
    }

    // Calculate average ROI
    const averageROI = calculateAverageROI(
      totalDistributionsPaid,
      totalOutstandingBalance
    );

    return NextResponse.json({
      totalOutstandingBalance,
      totalDistributionsPaid,
      averageROI,
      nextDistributionDate: nextDistribution?.distribution_date || null,
      nextDistributionAmount: nextDistribution?.total_payment_amount || 0,
      monthlyData,
    });
  } catch (error) {
    console.error("Unexpected error:", error);
    return NextResponse.json(
      { error: "An unexpected error occurred" },
      { status: 500 }
    );
  }
}

// Helper function to organize distribution data by month
function getMonthlyDistributionData(distributions) {
  const monthlyData = {};

  distributions.forEach((dist) => {
    const date = new Date(dist.distribution_date);
    const monthYear = `${date.getFullYear()}-${String(
      date.getMonth() + 1
    ).padStart(2, "0")}`;

    if (!monthlyData[monthYear]) {
      monthlyData[monthYear] = {
        month: new Date(
          date.getFullYear(),
          date.getMonth(),
          1
        ).toLocaleDateString("en-US", { month: "short" }),
        year: date.getFullYear(),
        amount: 0,
      };
    }

    monthlyData[monthYear].amount +=
      Number.parseFloat(dist.total_payment_amount) || 0;
  });

  // Convert to array and sort by date
  return Object.values(monthlyData).sort((a, b) => {
    if (a.year !== b.year) return a.year - b.year;
    return (
      new Date(`${a.month} 1, 2000`).getMonth() -
      new Date(`${b.month} 1, 2000`).getMonth()
    );
  });
}

// Helper function to calculate average ROI
function calculateAverageROI(totalEarnings, totalInvestment) {
  if (!totalInvestment) return "0.00%";

  // This is a simplified calculation - in reality you'd want to account for time
  const roi = (totalEarnings / totalInvestment) * 100;
  return roi.toFixed(2) + "%";
}
