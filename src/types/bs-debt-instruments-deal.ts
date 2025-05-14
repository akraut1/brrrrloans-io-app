export interface BsDebtInstrumentsDeal {
  id: string; // bigint, primary key, Supabase returns as string
  instrument_id: string; // bigint, not null, Supabase returns as string
  deal_id: string; // bigint, not null, Supabase returns as string
}
