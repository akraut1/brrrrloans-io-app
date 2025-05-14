export interface BsInvestorTransactionsReference {
  id: string; // bigserial (bigint), primary key, Supabase returns as string
  transaction_id: string; // bigint, not null, Supabase returns as string
  reference_type: string; // enum (reference_type_enum), not null
  reference_value: string; // text, not null
}
