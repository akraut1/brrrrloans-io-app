import { NextResponse } from "next/server";

export async function GET() {
  return NextResponse.json({
    totalOutstandingBalance: 100000,
    totalDistributionsPaid: 50000,
    averageROI: 10,
    nextDistributionDate: "2024-01-01",
    nextDistributionAmount: 1000,
    monthlyData: [
      { month: "January", year: 2024, amount: 1000 },
      { month: "February", year: 2024, amount: 2000 },
      { month: "March", year: 2024, amount: 3000 },
      { month: "April", year: 2024, amount: 4000 },
      { month: "May", year: 2024, amount: 5000 },
      { month: "June", year: 2024, amount: 6000 },
    ],
  });
}
