export interface BsInvestorDistribution {
  id: string; // uuid, primary key
  deal_id: string | null; // bigint, nullable
  rate_of_return_pct: string; // numeric(5,4)
  interest_amount: string; // numeric(15,2)
  servicing_fee: string; // numeric(15,2)
  wire_fee: string; // numeric(15,2)
  deposit_amount: string; // numeric(15,2)
  notes: string | null; // text, nullable
  created_at: string | null; // timestamp with time zone, nullable
  updated_at: string | null; // timestamp with time zone, nullable
  investor_id: string | null; // bigint, nullable
  capital_contribution: string; // numeric
  loan_amount_snapshot: string; // numeric
  upb_close: string | null; // numeric, nullable
  statement_id: string; // uuid, not null
  principal_amount: string; // numeric
  instrument_id: string | null; // bigint, nullable
}
