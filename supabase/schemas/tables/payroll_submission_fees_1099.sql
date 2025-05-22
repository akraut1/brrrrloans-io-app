-- Table: public.payroll_submission_fees_1099
CREATE TABLE public.payroll_submission_fees_1099 (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  payroll_submission_id bigint NULL,
  broker_id bigint NULL,
  expense_1099_broker_fee_pct numeric NULL,
  expense_1099_broker_fee_usd numeric NULL,
  created_at timestamp with time zone NOT NULL DEFAULT now(),
  updated_at timestamp with time zone NULL,
  CONSTRAINT payroll_submission_fees_1099_pkey PRIMARY KEY (id)
); 