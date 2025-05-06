export interface InvestorDeal {
  id: string;
  created_at: string;
  status: "Active" | "Pending" | "Closed";
  investor_id: string;
  deal_id: string;
  investment_amount: string;
  ownership_percentage: number;
}
