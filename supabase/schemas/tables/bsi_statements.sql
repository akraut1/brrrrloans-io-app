-- Table: public.bsi_statements
CREATE TABLE public.bsi_statements (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  investor_id bigint NULL,
  statement_date date NOT NULL,
  statement_period_start date NOT NULL,
  statement_period_end date NOT NULL,
  total_upb_open numeric NOT NULL,
  total_upb_close numeric NOT NULL,
  total_interest numeric NOT NULL,
  total_principal numeric NULL,
  total_fees numeric NOT NULL,
  clerk_id text NULL,
  clerk_organization_id text NULL,
  file_path text NULL,
  file_name text NULL,
  file_type text NULL,
  file_size bigint NULL,
  file_url text NULL,
  uploaded_at timestamp with time zone NULL,
  CONSTRAINT bsi_statements_pkey PRIMARY KEY (id),
  CONSTRAINT bsi_statements_investor_id_fkey FOREIGN KEY (investor_id) REFERENCES contact (id) ON DELETE RESTRICT
);
ALTER TABLE public.bsi_statements ENABLE ROW LEVEL SECURITY;
-- Add RLS policies here as needed 