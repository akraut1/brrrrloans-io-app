export interface BsiStatement {
  id: string; // uuid, primary key
  created_at: string; // timestamp with time zone, not null
  investor_id: string | null; // bigint, nullable
  statement_date: string; // date, not null (ISO format)
  statement_period_start: string; // date, not null (ISO format)
  statement_period_end: string; // date, not null (ISO format)
  total_upb_open: string; // numeric, not null
  total_upb_close: string; // numeric, not null
  total_interest: string; // numeric, not null
  total_principal: string | null; // numeric, nullable
}
