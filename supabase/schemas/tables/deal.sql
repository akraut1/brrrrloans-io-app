-- Table: public.deal
CREATE TABLE public.deal (
  id bigint GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  deal_name text NULL,
  deal_stage_1 public.deal_stage_1 NULL,
  deal_stage_2 public.deal_stage_2 NULL,
  deal_type public.loan_type_1 NULL,
  deal_disposition_1 public.deal_disposition_1 NULL,
  company_id bigint NULL,
  property_id bigint NULL,
  broker_id bigint NULL,
  broker_company_id bigint NULL,
  loan_amount_initial numeric NULL,
  loan_amount_total numeric NULL,
  note_rate numeric NULL,
  note_date date NULL,
  loan_term public.loan_term_months NULL,
  io_period integer NULL,
  construction_holdback numeric NULL,
  cost_of_capital numeric NULL,
  payoff_mtg1_amount numeric NULL,
  purchase_price numeric NULL,
  date_of_purchase date NULL,
  funding_date date NULL,
  loan_buyer_contact_id bigint NULL,
  loan_buyer_company_id bigint NULL,
  closing_agent_contact_id bigint NULL,
  escrow_contact_id bigint NULL,
  escrow_company_id bigint NULL,
  insurance_carrier_contact_id bigint NULL,
  insurance_carrier_company_id bigint NULL,
  title_company_contact_id bigint NULL,
  title_company_id bigint NULL,
  primary_guarantor_id bigint NULL,
  second_guarantor_id bigint NULL,
  third_guarantor_id bigint NULL,
  fourth_guarantor_id bigint NULL,
  appraisal_poc_contact_id bigint NULL,
  account_executive_id bigint NULL,
  loan_opener_id bigint NULL,
  loan_processor_id bigint NULL,
  lead_source_type public.lead_source NULL,
  lead_source_name text NULL,
  ltv_asis numeric NULL,
  ltv_after_repair numeric NULL,
  mid_fico integer NULL,
  recently_renovated public.yes_no NULL,
  renovation_completed date NULL,
  renovation_cost numeric NULL,
  project_type public.project_type NULL,
  vesting_type public.vesting_type NULL,
  recourse_type text NULL,
  ppp_structure_1 public.ppp_structure_1 NULL,
  ppp_term public.ppp_term NULL,
  pricing_file_path text NULL,
  pricing_file_url text NULL,
  pricing_is_locked boolean NOT NULL DEFAULT false,
  created_at timestamp with time zone NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
  updated_at timestamp with time zone NULL DEFAULT (now() AT TIME ZONE 'utc'::text)
); 