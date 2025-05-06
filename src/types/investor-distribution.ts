export interface InvestorDistribution {
  id: string;
  created_at: string;
  distribution_date: string;
  total_payment_amount: string;
  status: "Pending" | "Completed" | "Failed";
  investor_id: string;
  deal_id: string;
}
