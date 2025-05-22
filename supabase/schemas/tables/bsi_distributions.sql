-- Table: public.bsi_distributions
CREATE TABLE public.bsi_distributions (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  created_at timestamp with time zone NULL DEFAULT now(),
  deal_id bigint NULL,
  instrument_id bigint NULL,
  investor_id bigint NULL,
  statement_id uuid NOT NULL,
  capital_contribution numeric NOT NULL,
  deposit_amount numeric NOT NULL,
  interest_amount numeric NOT NULL,
  principal_amount numeric NOT NULL,
  rate_of_return_pct numeric NOT NULL,
  servicing_fee numeric NULL,
  wire_fee numeric NULL,
  upb_close numeric NULL,
  notes text NULL,
  clerk_id text NULL,
  clerk_organization_id text NULL,
  updated_at timestamp with time zone NULL,
  CONSTRAINT bsi_distributions_pkey PRIMARY KEY (id)
); 