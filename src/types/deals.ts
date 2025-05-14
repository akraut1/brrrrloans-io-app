export type DealDisposition = "active" | "dead" | "on_hold";
export type DealStage1 = "lead" | "scenario" | "deal";
export type DealStage2 =
  | "loan_setup"
  | "processing_1"
  | "appraisal_review"
  | "processing_2"
  | "qc_1"
  | "underwriting"
  | "conditionally_approved"
  | "qc_2"
  | "clear_to_close"
  | "closed_funded";
export type DealType = "rtl" | "dscr";
export type LoanTypeRtl = "bridge" | "bridge_plus_rehab";
export type ProjectType =
  | "fix_and_flip"
  | "ground_up"
  | "rental"
  | "stabilized_bridge";
export type TransactionType =
  | "purchase"
  | "delayed_purchase"
  | "refinance_cash_out"
  | "refinance_rate_term";
export type LoanTerm =
  | "6"
  | "12"
  | "15"
  | "18"
  | "24"
  | "36"
  | "48"
  | "60"
  | "72"
  | "84"
  | "96"
  | "108"
  | "120"
  | "300"
  | "360";
export type LeadSource =
  | "biggerpockets"
  | "broker"
  | "brrrr.com_chat"
  | "brrrr.com_form_submission"
  | "direct_mail_marketing"
  | "email_marketing"
  | "event_conference_tradeshow"
  | "existing_client"
  | "podcast"
  | "search_engine"
  | "referral"
  | "social_media"
  | "other"
  | "reia";
export type LoanStructureDscr =
  | "30_yr_fixed"
  | "5/1_arm"
  | "7/1_arm"
  | "10/1_arm_io"
  | "5/6_arm"
  | "10/6_arm";
export type PppStructure1 = "declining" | "fixed" | "minimum interest";
export type PppTerm =
  | "12"
  | "24"
  | "36"
  | "48"
  | "60"
  | "72"
  | "84"
  | "96"
  | "108"
  | "120";
export type VestingType = "entity" | "individual";

// Full Deal interface
export interface Deal {
  id: string;
  deal_name: string | null;
  vesting_type: VestingType | null;
  guarantor_count: number | null;
  lead_source_type: LeadSource | null;
  property_id: string | null;
  company_id: string | null;
  created_at: string | null;
  updated_at: string | null;
  note_date: string | null;
  mid_fico: number | null;
  pricing_is_locked: boolean;
  broker_id: string | null;
  lead_source_name: string | null;
  loan_number: string | null;
  declaration_1_lawsuits: boolean | null;
  declaration_2_bankruptcy: boolean | null;
  declaration_3_felony: boolean | null;
  declaration_5_license: boolean | null;
  declaration_1_lawsuits_explanation: string | null;
  declaration_2_bankruptcy_explanation: string | null;
  declaration_3_felony_explanation: string | null;
  recourse_type: string | null;
  transaction_type: TransactionType | null;
  payoff_mtg1_amount: string | null;
  loan_structure_dscr: LoanStructureDscr | null;
  guarantor_fico_score: number | null;
  title_company_contact_id: string | null;
  title_company_id: string | null;
  insurance_carrier_contact_id: string | null;
  closing_agent_contact_id: string | null;
  appraisal_poc_contact_id: string | null;
  insurance_carrier_company_id: string | null;
  cash_out_purpose: string | null;
  target_closing_date: string | null;
  date_of_purchase: string | null;
  loan_amount_total: string | null;
  construction_holdback: string | null;
  loan_amount_initial: string | null;
  loan_term: LoanTerm | null;
  title_file_number: string | null;
  deal_type: DealType | null;
  project_type: ProjectType | null;
  deal_stage_1: DealStage1 | null;
  deal_stage_2: DealStage2 | null;
  deal_disposition_1: DealDisposition | null;
  loan_type_rtl: LoanTypeRtl | null;
  renovation_cost: string | null;
  renovation_completed: string | null;
  recently_renovated: string | null;
  purchase_price: string | null;
  account_executive_id: string | null;
  funding_date: string | null;
  loan_sale_date: string | null;
  pricing_file_path: string | null;
  pricing_file_url: string | null;
  second_guarantor_id: string | null;
  third_guarantor_id: string | null;
  fourth_guarantor_id: string | null;
  primary_guarantor_id: string | null;
  loan_buyer_contact_id: string | null;
  loan_buyer_company_id: string | null;
  loan_processor_id: string | null;
  loan_opener_id: string | null;
  note_rate: string | null;
  cost_of_capital: string | null;
  broker_company_id: string | null;
  escrow_company_id: string | null;
  escrow_contact_id: string | null;
  ltv_asis: string | null;
  ltv_after_repair: string | null;
  io_period: string | null;
  ppp_structure_1: PppStructure1 | null;
  ppp_term: PppTerm | null;
}
