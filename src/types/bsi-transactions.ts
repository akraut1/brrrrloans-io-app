export interface BsiTransaction {
  id: string; // bigint, primary key (Supabase returns as string)
  investor_id: string | null; // bigint, nullable
  transaction_amount: string | null; // numeric(15,2), nullable
  transaction_date: string; // timestamp with time zone, not null
  transaction_method: string | null; // enum, nullable
  transaction_status: string | null; // enum, nullable
  reference_number: string | null; // text, nullable
  reference_type: string | null; // enum, nullable
  notes: string | null; // text, nullable
  created_at: string | null; // timestamp with time zone, nullable
  updated_at: string | null; // timestamp with time zone, nullable
  deal_id: string | null; // bigint, nullable
  ledger_entry_type: string; // enum, not null
  instrument_id: string | null; // bigint, nullable
}
