DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'amortization_type') THEN CREATE TYPE "public"."amortization_type" AS ENUM ('fixed_rate', 'adjustable_rate'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'appraisal_order_status') THEN CREATE TYPE "public"."appraisal_order_status" AS ENUM ('accepted_by_vendor', 'action_required', 'appraiser_waiting_for_contract', 'appraiser_waiting_for_lease', 'appraiser_waiting_for_questionnaire', 'assigned_to_vendor', 'awaiting_confirmation_for_appointment', 'awaiting_fee_approval_from_client', 'awaiting_info_from_client', 'awaiting_trip_fee_approval_to_proceed', 'cancelled', 'completed', 'declined_by_vendor', 'file_in_review', 'in_progress', 'inspected', 'inspection_scheduled', 'left_message_with_contact', 'on_hold', 'order_Is_due_today', 'payment_pending', 'please_submit_report_order_past_due', 'reconsideration_requested', 'reconsideration_requested_urgent', 'report_accepted', 'report_accepted_awaiting_payment', 'revision_requested', 'revision_requested_urgent', 'unassigned', 'unassigned_awaiting_bids'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'appraisal_order_type') THEN CREATE TYPE "public"."appraisal_order_type" AS ENUM ('commercial', 'residential'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'citizenship') THEN CREATE TYPE "public"."citizenship" AS ENUM ('U.S. Citizen', 'Permanent Resident', 'Non-Permanent Resident', 'Foreign National'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'clerk_role') THEN CREATE TYPE "public"."clerk_role" AS ENUM ('admin', 'member'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'company_role') THEN CREATE TYPE "public"."company_role" AS ENUM ('Borrowing Entity', 'Broker', 'Insurance', 'Legal', 'Title', 'Appraisal', 'Appraisal Management Company', 'Lender', 'Loan Buyer', 'Balance Sheet Investor', 'Environmental', 'Escrow', 'Entity Member (Layer)'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'condo_type') THEN CREATE TYPE "public"."condo_type" AS ENUM ('warrantable', 'non_warrantable'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'constant_types') THEN CREATE TYPE "public"."constant_types" AS ENUM ('Text', 'Numeric', 'Boolean'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'contact_type') THEN CREATE TYPE "public"."contact_type" AS ENUM ('Appraisal Administration', 'Appraisal Management Company', 'Appraiser', 'Borrower', 'Borrower Assistant', 'Broker', 'Broker Loan Processor', 'General Contractor', 'Entity Member', 'Escrow', 'Insurance', 'Balance Sheet Investor', 'Lender', 'Point of Contact', 'Referring Party', 'Title', 'Transaction Coordinator', 'Loan Buyer'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'continents') THEN CREATE TYPE "public"."continents" AS ENUM ('africa', 'antarctica', 'asia', 'europe', 'oceania', 'north_america', 'south_america'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'country_enum') THEN CREATE TYPE "public"."country_enum" AS ENUM ('United States', 'Canada', 'Mexico', 'United Kingdom', 'Australia', 'Germany', 'France', 'Italy', 'Spain', 'Japan', 'China', 'India', 'Brazil', 'Russia', 'South Africa', 'Other'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'credit_check_status') THEN CREATE TYPE "public"."credit_check_status" AS ENUM ('Payment Needed', 'Paid', 'Approved', 'Denied', 'Frozen', 'Under Review'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'deal_disposition_1') THEN CREATE TYPE "public"."deal_disposition_1" AS ENUM ('active', 'dead', 'on_hold'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'deal_stage_1') THEN CREATE TYPE "public"."deal_stage_1" AS ENUM ('lead', 'scenario', 'deal'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'deal_stage_2') THEN CREATE TYPE "public"."deal_stage_2" AS ENUM ('loan_setup', 'processing_1', 'appraisal_review', 'processing_2', 'qc_1', 'underwriting', 'conditionally_approved', 'qc_2', 'clear_to_close', 'closed_and_funded'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'deal_status_primary') THEN CREATE TYPE "public"."deal_status_primary" AS ENUM ('Scenario', 'Loan Setup', 'Pre-Qual Review (PQR)', 'Processing I', 'Appraisal Review', 'Processing II', 'Pre-Submission Review (PSR)', 'Underwriting', 'Conditionally Approved', 'Clear to Close', 'Closed & Funded'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'deal_status_primary__old_version_to_be_dropped') THEN CREATE TYPE "public"."deal_status_primary__old_version_to_be_dropped" AS ENUM ('Prequal', 'Scenario', 'Active', 'Complete', 'Dead/Archived'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'debt_instrument_type') THEN CREATE TYPE "public"."debt_instrument_type" AS ENUM ('mortgage_note', 'bridge_loan', 'construction_loan', 'rehab_loan', 'senior_debt', 'convertible_note', 'mortgage_pool', 'asset_backed_security', 'other'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'document_category') THEN CREATE TYPE "public"."document_category" AS ENUM ('application', 'appraisal', 'assets', 'closing', 'credit_and_background', 'construction', 'environmental', 'experience', 'id', 'insurance', 'pricing', 'property', 'seasoning', 'servicing', 'title', 'entity'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'document_role') THEN CREATE TYPE "public"."document_role" AS ENUM ('Loan Officer', 'Loan Opener', 'Processor', 'Broker', 'Borrower', 'Borrower/Broker', 'Processor/Broker'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'document_status') THEN CREATE TYPE "public"."document_status" AS ENUM ('approved', 'pending_review', 'pending_submission', 'pending_exception', 'rejected_items_needed', 'rejected_revisions_needed', 'rejected_signature_needed'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'entity_type') THEN CREATE TYPE "public"."entity_type" AS ENUM ('corp', 'general_partnership', 'limited_liability_company', 'limited_liability_partnership', 'limited_partnership', 's_corp', 'sole_proprietorship'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'fee_type') THEN CREATE TYPE "public"."fee_type" AS ENUM ('lender_fee', 'broker_fee', 'appraisal_fee', 'title_fee', 'property_tax_-_city/town', 'property_tax_-_county', 'property_tax_-_school', 'lender_holdback', 'lender_reserve', 'insurance _premium', 'credit_and_background_fee', 'judgment', 'lien', 'recording_and_transfer_fee', 'transfer_tax', 'lender_escrow'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'lead_source') THEN CREATE TYPE "public"."lead_source" AS ENUM ('biggerpockets', 'broker', 'brrrr.com_chat', 'brrrr.com_form_submission', 'direct_mail_marketing', 'email_marketing', 'event_conference_tradeshow', 'existing_client', 'podcast', 'search_engine', 'referral', 'social_media', 'other', 'reia'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'lease_length') THEN CREATE TYPE "public"."lease_length" AS ENUM ('N/A', 'STR', 'Unoccupied', '12', '24', '36'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'ledger_entry_type') THEN CREATE TYPE "public"."ledger_entry_type" AS ENUM ('contribution', 'redemption', 'interest', 'fee'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'loan_accrual_type') THEN CREATE TYPE "public"."loan_accrual_type" AS ENUM ('30/360', '30/365', 'Actual 360', 'Actual 365'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'loan_amortization') THEN CREATE TYPE "public"."loan_amortization" AS ENUM ('interest_only', '300', '360'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'loan_program') THEN CREATE TYPE "public"."loan_program" AS ENUM ('BPL Program A', 'BPL Program B'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'loan_structure_dscr') THEN CREATE TYPE "public"."loan_structure_dscr" AS ENUM ('30_yr_fixed', '5/1_arm', '7/1_arm', '10/1_arm_io', '5/6_arm', '10/6_arm'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'loan_term_months') THEN CREATE TYPE "public"."loan_term_months" AS ENUM ('6', '12', '15', '18', '24', '36', '48', '60', '72', '84', '96', '108', '120', '300', '360'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'loan_type_1') THEN CREATE TYPE "public"."loan_type_1" AS ENUM ('dscr', 'rtl'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'loan_type_2') THEN CREATE TYPE "public"."loan_type_2" AS ENUM ('bridge', 'bridge_plus_rehab'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'marital_status') THEN CREATE TYPE "public"."marital_status" AS ENUM ('Married', 'Separated', 'Unmarried'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'milestone_status') THEN CREATE TYPE "public"."milestone_status" AS ENUM ('to_do', 'in_progress', 'completed'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'ppp_structure') THEN CREATE TYPE "public"."ppp_structure" AS ENUM ('Declining', 'Fixed 5%', 'Fixed 4%', 'Fixed 3%', 'Fixed 2%', 'Fixed 1%', 'Interest', 'Minimum Interest'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'ppp_structure_1') THEN CREATE TYPE "public"."ppp_structure_1" AS ENUM ('declining', 'fixed', 'minimum_interest'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'ppp_term') THEN CREATE TYPE "public"."ppp_term" AS ENUM ('0', '12', '24', '36', '48', '60', '72', '84', '96', '108', '120'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'professional_license') THEN CREATE TYPE "public"."professional_license" AS ENUM ('Appraiser', 'Certified Public Accountant (CPA)', 'General Contractor', 'Lender', 'Mortgage (NMLS)', 'Real Estate Broker', 'Property Manager'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'project_status') THEN CREATE TYPE "public"."project_status" AS ENUM ('Sold', 'Held', 'In Progress'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'project_type') THEN CREATE TYPE "public"."project_type" AS ENUM ('fix_and_flip', 'ground_up', 'rental', 'stabilized_bridge'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'property_appraisal_status') THEN CREATE TYPE "public"."property_appraisal_status" AS ENUM ('Payment Needed', 'Paid', 'Ordered', 'Received', 'Revision Needed', 'Revision Requested', 'Completed'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'property_lease_term_status') THEN CREATE TYPE "public"."property_lease_term_status" AS ENUM ('active', 'expired', 'month_to_month'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'property_occupancy') THEN CREATE TYPE "public"."property_occupancy" AS ENUM ('Vacant', 'Tenant Occupied', 'Owner Occupied'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'property_type') THEN CREATE TYPE "public"."property_type" AS ENUM ('Single Family', 'Condominium', 'Condominium Warrantable', 'Condominium Non-Warrantable', 'Multifamily 2-4', 'Multifamily 5-10', 'Townhome/PUD', 'Multifamily 11+', 'Mixed Use 2-4', 'Mixed Use 5-10', 'Mixed Use 11+', 'Other'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'residence_ownership') THEN CREATE TYPE "public"."residence_ownership" AS ENUM ('Own', 'Rent'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'task_status') THEN CREATE TYPE "public"."task_status" AS ENUM ('not_started', 'in_progress', 'completed'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'transaction_method') THEN CREATE TYPE "public"."transaction_method" AS ENUM ('ach', 'billpay', 'cash', 'check', 'credit_card', 'cryptocurrency', 'debit_card', 'internal', 'rtp', 'wire', 'other'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'transaction_reference_type') THEN CREATE TYPE "public"."transaction_reference_type" AS ENUM ('federal_reference_number', 'imad', 'omad'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'transaction_status') THEN CREATE TYPE "public"."transaction_status" AS ENUM ('canceled', 'completed', 'failed', 'initiated', 'on_hold', 'owed', 'pending', 'processing', 'refunded', 'returned', 'scheduled'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'transaction_type') THEN CREATE TYPE "public"."transaction_type" AS ENUM ('purchase', 'delayed_purchase', 'refinance_rate_term', 'refinance_cash_out'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'true_false') THEN CREATE TYPE "public"."true_false" AS ENUM ('true', 'false'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'us_states') THEN CREATE TYPE "public"."us_states" AS ENUM ('AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'PR', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'us_states_long') THEN CREATE TYPE "public"."us_states_long" AS ENUM ('alabama', 'alaska', 'arizona', 'arkansas', 'california', 'colorado', 'connecticut', 'delaware', 'district_of_columbia', 'florida', 'georgia', 'hawaii', 'idaho', 'illinois', 'indiana', 'iowa', 'kansas', 'kentucky', 'louisiana', 'maine', 'maryland', 'massachusetts', 'michigan', 'minnesota', 'mississippi', 'missouri', 'montana', 'nebraska', 'nevada', 'new_hampshire', 'new_jersey', 'new_mexico', 'new_york', 'north_carolina', 'north_dakota', 'ohio', 'oklahoma', 'oregon', 'pennsylvania', 'rhode_island', 'south_carolina', 'south_dakota', 'tennessee', 'texas', 'utah', 'vermont', 'virginia', 'washington', 'west_virginia', 'wisconsin', 'wyoming'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'user_role_internal') THEN CREATE TYPE "public"."user_role_internal" AS ENUM ('admin', 'account_executive', 'loan_processor', 'balance_sheet_investor', 'loan_opener'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'vesting_type') THEN CREATE TYPE "public"."vesting_type" AS ENUM ('entity', 'Individual'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'warrantability') THEN CREATE TYPE "public"."warrantability" AS ENUM ('warrantable', 'non-warrantable'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'yes_no') THEN CREATE TYPE "public"."yes_no" AS ENUM ('yes', 'no'); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'ltv_scores') THEN CREATE TYPE "public"."ltv_scores" AS ("ltv_1" numeric, "ltv_2" numeric, "ltv_3" numeric, "ltv_4" numeric, "ltv_5" numeric, "ltv_6" numeric, "ltv_7" numeric); END IF; END$$;
DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'max_ltv_scores') THEN CREATE TYPE "public"."max_ltv_scores" AS ("purchase_ltv" numeric, "delayed_purchase_ltv" numeric, "refinance_rt_ltv" numeric, "refinance_co_ltv" numeric); END IF; END$$;

create sequence if not exists "public"."transaction_references_id_seq";

CREATE TABLE IF NOT EXISTS "public"."appraisal" (
    "id" bigint generated by default as identity not null,
    "property_id" bigint,
    "deal_id" bigint,
    "co_appraisal" bigint,
    "co_amc" bigint,
    "appraiser_id" bigint,
    "order_type" appraisal_order_type,
    "order_status" appraisal_order_status,
    "date_report_effective" date,
    "date_report_expiration" date,
    "document_id" bigint,
    "created_at" timestamp with time zone not null default now(),
    "date_amc_vendor_accept" timestamp with time zone,
    "date_amc_vendor_assign" timestamp with time zone,
    "date_inspection_completed" date,
    "date_inspection_scheduled" date,
    "date_report_ordered" date,
    "date_report_received" date,
    "file_number" text,
    "file_number_amc" text,
    "updated_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "value_conclusion_as_is" numeric,
    "value_conclusion_as_repaired" numeric,
    "value_conclusion_fair_market_rent" numeric
);


alter table "public"."appraisal" enable row level security;

create table if not exists "public"."borrower" (
    "id" bigint generated by default as identity not null,
    "primary_residence_address_street" text,
    "primary_residence_address_suite_apt" text,
    "primary_residence_address_city" text,
    "primary_residence_address_state" us_states,
    "primary_residence_address_postal_code" text,
    "primary_residence_address_country" text,
    "primary_residence_occupancy_start_date" date,
    "primary_residence_ownership" residence_ownership,
    "previous_residence_address_street" text,
    "previous_residence_address_suite_apt" text,
    "previous_residence_address_city" text,
    "previous_residence_address_state" us_states,
    "previous_residence_address_postal_code" text,
    "previous_residence_address_country" text,
    "mailing_address_is_primary_residence" boolean,
    "mailing_address_street" text,
    "mailing_address_suite_apt" text,
    "mailing_address_po_box" text,
    "mailing_address_city" text,
    "mailing_address_state" us_states,
    "mailing_address_postal_code" text,
    "mailing_address_country" text,
    "date_of_birth" date,
    "social_security_number" text,
    "citizenship" citizenship,
    "marital_status" marital_status,
    "fico_score_mid_estimate" smallint,
    "fico_score_mid_actual" smallint,
    "fico_report_date_pulled" date,
    "exp_ground_ups_sold" smallint default 0,
    "exp_flips_sold" smallint default 0,
    "exp_rentals_owned" smallint default 0,
    "exp_professional_license" professional_license,
    "created_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "updated_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "mortgage_debt" numeric,
    "first_time_home_buyer" yes_no,
    "fico_report_score_equifax" smallint,
    "fico_report_score_experian" smallint,
    "fico_report_score_transunion" smallint,
    "primary_residence_address_state_long" us_states_long,
    "previous_residence_address_state_long" us_states_long,
    "mailing_address_state_long" us_states_long,
    "has_experience" yes_no,
    "credit_check" credit_check_status,
    "first_name" text,
    "middle_name" text,
    "last_name" text,
    "email_address" text,
    "cell_phone" text,
    "home_phone" text,
    "office_phone" text,
    "primary_residence_address_county" text,
    "previous_residence_occupancy_start_date" date,
    "previous_residence_occupancy_end_date" date,
    "fico_report_date_expiration" date generated always as ((fico_report_date_pulled + 91)) stored,
    "name" text generated always as (((first_name || ' '::text) || last_name)) stored
);


alter table "public"."borrower" enable row level security;

create table if not exists "public"."bs_debt_instruments" (
    "id" bigint generated by default as identity not null,
    "instrument_type" debt_instrument_type not null,
    "name" text not null,
    "target_yield_pct" numeric,
    "created_at" timestamp with time zone not null default now()
);


alter table "public"."bs_debt_instruments" enable row level security;

create table if not exists "public"."bs_debt_instruments_deals" (
    "id" bigint generated by default as identity not null,
    "instrument_id" bigint not null,
    "deal_id" bigint not null
);


alter table "public"."bs_debt_instruments_deals" enable row level security;

create table if not exists "public"."bsi_deals" (
    "deal_id" bigint not null,
    "contact_id" bigint not null,
    "contact_types_id" bigint not null
);


alter table "public"."bsi_deals" enable row level security;

create table if not exists "public"."bsi_distributions" (
    "id" bigint not null,
    "deal_id" bigint,
    "rate_of_return_pct" numeric(5,4) not null,
    "interest_amount" numeric(15,2) not null,
    "servicing_fee" numeric(15,2) not null default 0.00,
    "wire_fee" numeric(15,2) not null default 0.00,
    "deposit_amount" numeric(15,2) not null,
    "notes" text,
    "created_at" timestamp with time zone default now(),
    "updated_at" timestamp with time zone default now(),
    "investor_id" bigint,
    "capital_contribution" numeric not null,
    "loan_amount_snapshot" numeric not null,
    "upb_close" numeric,
    "statement_id" uuid not null,
    "principal_amount" numeric not null,
    "instrument_id" bigint,
    "clerk_id" text,
    "clerk_organization_id" text
);


alter table "public"."bsi_distributions" enable row level security;

create table if not exists "public"."bsi_statements" (
    "id" bigint not null,
    "created_at" timestamp with time zone not null default now(),
    "investor_id" bigint,
    "statement_date" date not null,
    "statement_period_start" date not null,
    "statement_period_end" date not null,
    "total_upb_open" numeric not null,
    "total_upb_close" numeric not null,
    "total_interest" numeric not null,
    "total_principal" numeric,
    "total_fees" numeric not null,
    "clerk_id" text,
    "clerk_organization_id" text
);


alter table "public"."bsi_statements" enable row level security;

create table if not exists "public"."bsi_transactions" (
    "id" bigint generated by default as identity not null,
    "investor_id" bigint,
    "transaction_amount" numeric(15,2),
    "transaction_date" timestamp with time zone not null default now(),
    "transaction_method" transaction_method,
    "transaction_status" transaction_status,
    "reference_number" text,
    "reference_type" transaction_reference_type,
    "notes" text,
    "created_at" timestamp with time zone default now(),
    "updated_at" timestamp with time zone default now(),
    "deal_id" bigint,
    "ledger_entry_type" ledger_entry_type not null default 'contribution'::ledger_entry_type,
    "instrument_id" bigint,
    "clerk_id" text,
    "clerk_organization_id" text
);


alter table "public"."bsi_transactions" enable row level security;

create table if not exists "public"."bsi_transactions_references" (
    "id" bigint not null,
    "transaction_id" bigint not null,
    "reference_type" transaction_reference_type not null,
    "reference_value" text not null
);


alter table "public"."bsi_transactions_references" enable row level security;

create table if not exists "public"."cba_requests" (
    "id" bigint generated by default as identity not null,
    "submitted_at" timestamp with time zone not null default now(),
    "completed_at" timestamp with time zone,
    "deal_id" bigint,
    "uw_prequal_result_credit" bigint,
    "uw_prequal_result_background" bigint,
    "submitted_by" bigint not null
);


alter table "public"."cba_requests" enable row level security;

create table if not exists "public"."cba_requests_guarantors" (
    "created_at" timestamp with time zone not null default now(),
    "cba_request_id" bigint not null,
    "guarantor_id" bigint not null
);


alter table "public"."cba_requests_guarantors" enable row level security;

create table if not exists "public"."company" (
    "co_id" bigint generated by default as identity not null,
    "co_name" text,
    "co_ein" text,
    "co_website" text,
    "co_ppb_address_street" text,
    "co_ppb_address_suite_apt" text,
    "co_ppb_address_city" text,
    "co_ppb_address_postal_code" text,
    "co_ppb_address_country" country_enum default 'United States'::country_enum,
    "co_phone" text,
    "co_fax" text,
    "co_logo" text,
    "co_role" company_role,
    "co_ppb_address_state" us_states,
    "created_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "updated_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "co_date_established" date,
    "co_state_of_formation" us_states,
    "co_bank_of_business_account" text,
    "co_bank_account_balance" numeric,
    "co_entity_type" entity_type,
    "co_ppb_address_state_long" us_states_long,
    "co_state_of_formation_long" us_states_long,
    "primary_guarantor_id" bigint
);


alter table "public"."company" enable row level security;

create table if not exists "public"."company_contact" (
    "id" bigint generated by default as identity not null,
    "co_id" bigint,
    "contact_id" bigint,
    "deal_id" bigint
);


alter table "public"."company_contact" enable row level security;

create table if not exists "public"."company_member" (
    "member_id" bigint generated by default as identity not null,
    "member_company_id" bigint,
    "member_ownership_percentage" double precision,
    "member_created_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "member_updated_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "member_title" text,
    "member_borrower_id" bigint,
    "member_name_first" text,
    "member_name_last" text,
    "member_type" vesting_type,
    "member_owning_company_id" bigint,
    "member_is_guarantor" yes_no
);


alter table "public"."company_member" enable row level security;

create table if not exists "public"."company_roles" (
    "id" bigint generated by default as identity not null,
    "co_id" bigint not null,
    "role_id" bigint not null,
    "deal_id" bigint
);


alter table "public"."company_roles" enable row level security;

create table if not exists "public"."company_roles_defined" (
    "id" bigint generated by default as identity not null,
    "co_role" company_role not null,
    "description" text,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "deal_id" bigint
);


alter table "public"."company_roles_defined" enable row level security;

create table if not exists "public"."constants" (
    "id" bigint generated by default as identity not null,
    "name" text,
    "description" text,
    "type" constant_types,
    "active" boolean,
    "text_value" text,
    "numeric_value" numeric,
    "yes_no_value" yes_no,
    "created_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "updated_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text)
);


alter table "public"."constants" enable row level security;

create table if not exists "public"."contact" (
    "id" bigint generated by default as identity not null,
    "first_name" text,
    "last_name" text,
    "email_address" text,
    "cell_phone" text,
    "home_phone" text,
    "office_phone" text,
    "portal_access" boolean default false,
    "company_id" bigint,
    "contact_type" contact_type,
    "profile_picture" text,
    "created_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "updated_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "name" text generated always as (((first_name || ' '::text) || last_name)) stored,
    "contact_types" contact_type[],
    "middle_name" text,
    "user_id" bigint
);


alter table "public"."contact" enable row level security;

create table if not exists "public"."contact_types" (
    "id" bigint generated by default as identity not null,
    "name" text
);


alter table "public"."contact_types" enable row level security;

create table if not exists "public"."contact_types_jt" (
    "id" bigint generated by default as identity not null,
    "contact_id" bigint,
    "contact_types_id" bigint
);


alter table "public"."contact_types_jt" enable row level security;

create table if not exists "public"."countries" (
    "id" bigint generated by default as identity not null,
    "name" text,
    "iso2" text not null,
    "iso3" text,
    "local_name" text,
    "continent" continents
);


alter table "public"."countries" enable row level security;

create table if not exists "public"."custom_loan_fees" (
    "id" bigint generated by default as identity not null,
    "deal_id" bigint not null,
    "fee_category" fee_type,
    "fee_description" text,
    "fee_amount" numeric,
    "created_at" timestamp with time zone not null default now()
);


alter table "public"."custom_loan_fees" enable row level security;

create table if not exists "public"."deal" (
    "id" bigint generated by default as identity not null,
    "deal_name" text,
    "company_id" bigint,
    "deal_type" loan_type_1,
    "loan_term" loan_term_months,
    "vesting_type" vesting_type,
    "purchase_price" numeric,
    "loan_amount_total" numeric,
    "guarantor_count" smallint default '1'::smallint,
    "transaction_type" transaction_type,
    "target_closing_date" date,
    "primary_guarantor_id" bigint,
    "second_guarantor_id" bigint,
    "third_guarantor_id" bigint,
    "fourth_guarantor_id" bigint,
    "property_id" bigint,
    "loan_opener_id" uuid,
    "loan_processor_id" uuid,
    "account_executive_id" uuid,
    "lead_source_type" lead_source,
    "project_type" project_type,
    "mid_fico" smallint default '0'::smallint,
    "broker_id" bigint,
    "broker_company_id" bigint,
    "date_of_purchase" date,
    "payoff_mtg1_amount" numeric,
    "cash_out_purpose" text,
    "construction_holdback" numeric,
    "title_company_id" bigint,
    "title_company_contact_id" bigint,
    "escrow_company_id" bigint,
    "escrow_contact_id" bigint,
    "insurance_carrier_company_id" bigint,
    "insurance_carrier_contact_id" bigint,
    "closing_agent_contact_id" bigint,
    "appraisal_poc_contact_id" bigint,
    "loan_buyer_company_id" bigint,
    "loan_buyer_contact_id" bigint,
    "guarantor_fico_score" smallint,
    "deal_stage_1" deal_stage_1,
    "deal_stage_2" deal_stage_2,
    "created_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "updated_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "lead_source_name" text,
    "clerk_id" text,
    "clerk_organization_id" text,
    "cost_of_capital" numeric,
    "deal_disposition_1" deal_disposition_1,
    "declaration_1_lawsuits" boolean,
    "declaration_1_lawsuits_explanation" text,
    "declaration_2_bankruptcy" boolean,
    "declaration_2_bankruptcy_explanation" text,
    "declaration_3_felony" boolean default false,
    "declaration_3_felony_explanation" text,
    "declaration_5_license" boolean default false,
    "funding_date" date,
    "io_period" numeric,
    "loan_amount_initial" numeric,
    "loan_number" text,
    "loan_sale_date" date,
    "loan_structure_dscr" loan_structure_dscr,
    "loan_type_rtl" loan_type_2,
    "ltv_after_repair" numeric,
    "ltv_asis" numeric,
    "note_date" date,
    "note_rate" numeric,
    "ppp_structure_1" ppp_structure_1,
    "ppp_term" ppp_term,
    "pricing_file_path" text,
    "pricing_file_url" text,
    "pricing_is_locked" boolean not null default false,
    "recently_renovated" yes_no,
    "recourse_type" text default 'full_recourse'::text,
    "renovation_completed" date,
    "renovation_cost" numeric,
    "title_file_number" text
);


alter table "public"."deal" enable row level security;

create table if not exists "public"."deal_appraisals" (
    "id" bigint generated by default as identity not null,
    "deal_id" bigint,
    "appraisal_id" bigint,
    "property_Id" bigint
);


alter table "public"."deal_appraisals" enable row level security;

create table if not exists "public"."deal_property" (
    "id" bigint generated by default as identity not null,
    "deal_id" bigint not null,
    "property_id" bigint not null
);


alter table "public"."deal_property" enable row level security;

create table if not exists "public"."deal_roles" (
    "id" bigint generated by default as identity not null,
    "deal_id" bigint,
    "contact_id" bigint,
    "contact_types_id" bigint
);


alter table "public"."deal_roles" enable row level security;

create table if not exists "public"."document_files" (
    "id" bigint generated by default as identity not null,
    "name" text,
    "category" document_category,
    "status" document_status,
    "role" text,
    "borrower_id" bigint,
    "guarantor_id" bigint,
    "property_id" bigint,
    "deal_id" bigint,
    "entity_id" bigint,
    "file_path" text,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "file_url" text,
    "file_name" text,
    "effective_date" date,
    "expiration_date" date,
    "file_size" bigint,
    "file_type" text,
    "is_required" boolean,
    "private_notes" text,
    "public_notes" text,
    "uploaded_at" timestamp with time zone,
    "uploaded_by" text
);


alter table "public"."document_files" enable row level security;

create table if not exists "public"."document_roles" (
    "id" bigint generated by default as identity not null,
    "role_name" text not null
);


alter table "public"."document_roles" enable row level security;

create table if not exists "public"."document_roles_assigned" (
    "document_id" bigint not null,
    "role_id" bigint not null
);


alter table "public"."document_roles_assigned" enable row level security;

create table if not exists "public"."fee" (
    "id" bigint generated by default as identity not null,
    "category" text not null,
    "program" loan_program,
    "fee_amount_bps" numeric not null,
    "created_at" timestamp with time zone not null default now()
);


alter table "public"."fee" enable row level security;

create table if not exists "public"."guarantor" (
    "guarantor_id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "borrower_id" bigint,
    "deal_id" bigint,
    "first_name" text,
    "middle_name" text,
    "last_name" text,
    "name" text generated always as (((first_name || ' '::text) || last_name)) stored,
    "email_address" text,
    "cell_phone" text,
    "home_phone" text,
    "office_phone" text,
    "primary_residence_address_street" text,
    "primary_residence_address_suite_apt" text,
    "primary_residence_address_city" text,
    "primary_residence_address_state" us_states,
    "primary_residence_address_state_long" us_states_long,
    "primary_residence_address_postal_code" text,
    "primary_residence_address_country" text,
    "primary_residence_occupancy_start_date" date,
    "primary_residence_ownership" residence_ownership,
    "previous_residence_address_street" text,
    "previous_residence_address_suite_apt" text,
    "previous_residence_address_city" text,
    "previous_residence_address_state" us_states,
    "previous_residence_address_state_long" us_states_long,
    "previous_residence_address_postal_code" text,
    "previous_residence_address_country" text,
    "mailing_address_is_primary_residence" boolean,
    "mailing_address_street" text,
    "mailing_address_suite_apt" text,
    "mailing_address_po_box" text,
    "mailing_address_city" text,
    "mailing_address_state" us_states,
    "mailing_address_state_long" us_states_long,
    "mailing_address_postal_code" text,
    "mailing_address_country" text,
    "date_of_birth" date,
    "social_security_number" text,
    "citizenship" citizenship,
    "marital_status" marital_status,
    "mortgage_debt" numeric,
    "fico_score_mid_estimate" smallint,
    "fico_score_mid_actual" smallint,
    "fico_report_date_pulled" date,
    "fico_report_date_expiration" date generated always as ((fico_report_date_pulled + 91)) stored,
    "fico_report_score_equifax" smallint,
    "fico_report_score_experian" smallint,
    "fico_report_score_transunion" smallint,
    "first_time_home_buyer" yes_no,
    "exp_ground_ups_sold" smallint default 0,
    "exp_flips_sold" smallint default 0,
    "exp_rentals_owned" smallint default 0,
    "exp_professional_license" professional_license,
    "has_experience" yes_no,
    "credit_check" credit_check_status
);


alter table "public"."guarantor" enable row level security;

create table if not exists "public"."loan_application" (
    "id" bigint generated by default as identity not null,
    "submission" jsonb,
    "status" text,
    "application_deal_id" bigint,
    "created_at" timestamp with time zone not null default now(),
    "error_message" text,
    "reprocess" boolean default false
);


alter table "public"."loan_application" enable row level security;

create table if not exists "public"."loan_price" (
    "id" bigint generated by default as identity not null,
    "program" loan_program,
    "rate" numeric,
    "created_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text),
    "deal_id" bigint,
    "buydown" numeric,
    "dscr" numeric,
    "loan_price" numeric,
    "pitia" numeric default '0'::numeric,
    "row_index" smallint,
    "term_sheet_link" text,
    "updated_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text)
);


alter table "public"."loan_price" enable row level security;

create table if not exists "public"."loan_price_saved" (
    "id" bigint generated by default as identity not null,
    "program" loan_program,
    "rate" numeric,
    "created_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text),
    "deal_id" bigint,
    "buydown" numeric,
    "dscr" numeric,
    "loan_price" numeric,
    "pitia" numeric,
    "row_index" smallint,
    "term_sheet_link" text,
    "updated_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "loan_price_id" bigint
);


alter table "public"."loan_price_saved" enable row level security;

create table if not exists "public"."loan_program_a" (
    "id" bigint generated by default as identity not null,
    "loan_price" numeric,
    "final_rate" numeric,
    "pitia" numeric,
    "dscr" numeric,
    "origination" numeric,
    "deal_id" bigint,
    "created_at" timestamp with time zone default now(),
    "updated_at" timestamp with time zone default now(),
    "pass" boolean
);


alter table "public"."loan_program_a" enable row level security;

create table if not exists "public"."loan_program_b" (
    "id" bigint generated by default as identity not null,
    "loan_price" numeric,
    "final_rate" numeric,
    "pitia" numeric,
    "dscr" numeric,
    "origination" numeric,
    "deal_id" bigint,
    "created_at" timestamp with time zone default now(),
    "updated_at" timestamp with time zone default now(),
    "pass" boolean
);


alter table "public"."loan_program_b" enable row level security;

create table if not exists "public"."ltv_band" (
    "id" bigint generated by default as identity not null,
    "name" text not null,
    "ltv_min" numeric not null,
    "ltv_max" numeric not null,
    "notes" text,
    "created_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text),
    "updated_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text)
);


alter table "public"."ltv_band" enable row level security;

create table if not exists "public"."max_ltv" (
    "id" bigint generated by default as identity not null,
    "fico_min" smallint,
    "fico_max" smallint,
    "citizenship" citizenship,
    "loan_amount_min" numeric,
    "loan_amount_max" numeric,
    "short_term_rental" yes_no,
    "property_type" property_type,
    "purchase_ltv" numeric,
    "delayed_purchase_ltv" numeric,
    "refinance_rt_ltv" numeric,
    "refinance_co_ltv" numeric,
    "updated_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "created_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text),
    "program" loan_program not null
);


alter table "public"."max_ltv" enable row level security;

create table if not exists "public"."milestone_templates" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "milestone_name" text not null,
    "milestone_order" numeric,
    "status" milestone_status,
    "types_applied_to" text,
    "subject_property_state" us_states,
    "vesting_type" vesting_type,
    "email_template_subject" text,
    "email_template_body" text
);


alter table "public"."milestone_templates" enable row level security;

create table if not exists "public"."milestones" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "deal_id" bigint not null,
    "milestone_order" numeric,
    "status" milestone_status,
    "date_reached" date,
    "date_completed" date,
    "milestone_template_id" bigint,
    "email_subject" text,
    "email_body" text,
    "email_sent" boolean,
    "date_email_sent" date
);


alter table "public"."milestones" enable row level security;

create table if not exists "public"."payroll_submission" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone default now(),
    "income_bpc_usd" numeric,
    "income_bpc_pct" numeric,
    "income_lpc_usd" numeric,
    "income_lpc_pct" numeric,
    "income_lpc_trailing_yn" boolean,
    "income_lpc_trailing_usd" numeric,
    "income_lpc_trailing_pct" numeric,
    "income_lpc_promo_usd" numeric,
    "expense_ace_corp_return_usd" numeric default 0.00,
    "expense_ace_corp_override_usd" numeric default 0.00,
    "expense_misc_ppcc_usd" numeric default 0.00,
    "income_net_usd" numeric,
    "comp_ae_formula_output_usd" numeric,
    "comp_ae_formula_output_pct" numeric,
    "comp_ae_final_usd" numeric,
    "comp_lp_formula_output_usd" numeric,
    "comp_lp_formula_output_pct" numeric,
    "comp_lp_final_usd" numeric,
    "income_bpc_received_yn" boolean,
    "income_bpc_received_datetime" timestamp with time zone,
    "deal_id" bigint
);


alter table "public"."payroll_submission" enable row level security;

create table if not exists "public"."payroll_submission_fees_1099" (
    "id" uuid not null default gen_random_uuid(),
    "payroll_submission_id" bigint,
    "broker_id" bigint,
    "expense_1099_broker_fee_usd" numeric,
    "expense_1099_broker_fee_pct" numeric,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone
);


alter table "public"."payroll_submission_fees_1099" enable row level security;

create table if not exists "public"."property" (
    "id" bigint generated by default as identity not null,
    "address_street" text,
    "address_suite_apt" text,
    "address_city" text,
    "address_state_long" us_states_long,
    "address_state" us_states,
    "address_postal_code" text,
    "address_county" text,
    "address_country" text default 'United States'::text,
    "property_type" property_type,
    "units" smallint,
    "short_term_rental" yes_no,
    "warrantability" warrantability,
    "address" text,
    "purchase_price" numeric,
    "occupancy" property_occupancy,
    "value_aiv_estimate" numeric,
    "value_arv_estimate" numeric,
    "flood_zone" yes_no,
    "hoa_name" text,
    "income_monthly_gross_rent" numeric,
    "income_monthly_fair_market_rent" numeric,
    "expense_annual_property_tax" numeric,
    "expense_annual_insurance_hoi" numeric,
    "expense_annual_insurance_flood" numeric,
    "expense_annual_management" numeric,
    "expense_annual_association_hoa" numeric,
    "created_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "updated_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "year_built" bigint,
    "hoa_contact" bigint,
    "bathrooms_aiv" numeric,
    "bathrooms_arv" numeric,
    "bedrooms_aiv" numeric,
    "bedrooms_arv" numeric,
    "declining_market" yes_no,
    "hoa_contact_email" text,
    "hoa_contact_person" text,
    "hoa_contact_phone" text,
    "inspection" yes_no,
    "latitude" numeric,
    "longitude" numeric,
    "photo_url" text,
    "purchase_date" date,
    "recently_renovated" yes_no,
    "rehab_completed_post_acquisition" numeric,
    "renovation_completed" date,
    "renovation_cost" numeric,
    "rural" yes_no,
    "sale_date" date,
    "sale_price" numeric,
    "sq_footage_gla_aiv" bigint,
    "sq_footage_gla_arv" bigint,
    "sq_footage_lot_aiv" bigint,
    "sq_footage_lot_arv" bigint,
    "value_aiv_appraised" numeric,
    "value_arv_appraised" numeric
);


alter table "public"."property" enable row level security;

create table if not exists "public"."property_income" (
    "id" bigint generated by default as identity not null,
    "unit" text,
    "property_id" bigint not null,
    "lease_length" lease_length,
    "lease_rent" numeric,
    "market_rent_fmr" numeric,
    "created_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "updated_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "tenant_occupied" yes_no,
    "lease_term_begin" date,
    "lease_term_end" date,
    "tenant_name" text,
    "lease_term_status" property_lease_term_status
);


alter table "public"."property_income" enable row level security;

create table if not exists "public"."property_reapi" (
    "id" bigint generated by default as identity not null,
    "data_property_type" text,
    "pi_year_built" bigint,
    "pi_gla_sqft_asis" bigint,
    "address_street" text,
    "address_unit" text,
    "address_city" text,
    "address_state" us_states,
    "address_zip5" text,
    "pi_units_count_asis" numeric,
    "tax_amount_annual" numeric,
    "pi_hoa_fees_annual" numeric,
    "created_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "updated_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "address_full" text,
    "data_value_asis_est" numeric,
    "lot_size_sqft_asis" bigint,
    "value_arv_estimate" numeric,
    "pi_hoa_warrantability" text,
    "pi_latitude" numeric,
    "pi_longitude" numeric,
    "address_county" text,
    "pi_hoa_name" text,
    "data_occupancy_oo_yn" text,
    "pi_demo_fmr_1br" numeric,
    "pi_demo_fmr_2br" numeric,
    "data_last_sale_price" numeric,
    "property_id" bigint,
    "address_zip4" text,
    "address_house" text,
    "address_street_type" text,
    "address_unit_type" text,
    "address_predirection" text,
    "address_jurisdiction" text,
    "pi_basement_sqft" numeric,
    "pi_basement_sqft_finished" numeric,
    "pi_basement_type" text,
    "pi_rooms_bathrooms_asis" numeric,
    "pi_rooms_bedrooms_asis" numeric,
    "pi_rooms_bathrooms_partial_asis" numeric,
    "pi_rooms_count_asis" numeric,
    "pi_buildings_count_asis" numeric,
    "pi_construction_method" text,
    "pi_garage_type" text,
    "pi_garage_sqft_asis" bigint,
    "data_last_sale_date" date,
    "data_preforeclosure_yn" text,
    "data_private_lender_yn" text,
    "data_occupancy_vacant_yn" text,
    "data_reapi_last_update" timestamp with time zone,
    "data_property_type_MFH2to4" text,
    "data_property_type_MFH5plus" text,
    "data_freeclear_yn" text,
    "data_owner_mortgage_balance_est" numeric,
    "data_owner_mortgage_payment_est" numeric,
    "data_owner_equity$_est" numeric,
    "data_owner_equity%_est" numeric,
    "data_flood_zone_yn" text,
    "data_flood_zone_description" text,
    "data_flood_zone_type" text,
    "data_owner_mortgage_arm_yn" text,
    "data_owner_is_entity_yn" text,
    "data_owner_is_bank_yn" text,
    "data_owner_mortgage_maturitydate" date,
    "data_mls_last_sale_date" date,
    "data_mls_active" text,
    "data_mls_last_status_date" date,
    "data_mls_status" text,
    "data_open_mortgage_balance_est" numeric,
    "data_mls_daysonmarket" bigint,
    "data_mls_cancelled" text,
    "data_mls_failed" text,
    "data_mls_failed_date" date,
    "data_mls_listing_date" date,
    "data_mls_listing_price" numeric,
    "data_mls_listing_price_sqft" numeric,
    "data_mls_pending" text,
    "data_mls_sold" text,
    "data_property_type_mobilehome_yn" text,
    "data_mls_total_updates" double precision,
    "data_mls_type" text,
    "reapi_id" bigint not null,
    "lot_apn" text,
    "lot_apn_unformatted" text,
    "lot_census_block" text,
    "lot_census_block_group" text,
    "lot_census_tract" text,
    "lot_landuse" text,
    "lot_legal_description" text,
    "lot_legal_section" text,
    "lot_size_acres_asis" numeric,
    "lot_legal_lot_number" text,
    "lot_property_use" text,
    "lot_subdivision" text,
    "lot_zoning" text,
    "lot_legal_block_number" text,
    "tax_year" bigint,
    "data_owner_inherited_yn" text,
    "data_owner_investorbuyer_yn" text,
    "data_mls_sold_price" numeric,
    "data_lien_yn" text,
    "data_taxlien_yn" text,
    "data_auction_info" text,
    "pi_demo_fmr_efficiency" numeric,
    "pi_demo_fmr_4br" numeric,
    "pi_demo_fmr_3br" numeric,
    "pi_demo_fmr_year" double precision,
    "data_reapi_loaded_at" timestamp with time zone,
    "pi_demo_suggested_rent" numeric,
    "pi_demo_hud_area_code" text,
    "pi_demo_hud_area_name" text,
    "pi_demo_hud_median_income" numeric,
    "api_response" jsonb
);


alter table "public"."property_reapi" enable row level security;

create table if not exists "public"."rate_adjustment" (
    "id" bigint generated by default as identity not null,
    "program" loan_program,
    "fico_min" smallint,
    "fico_max" smallint,
    "property_type" property_type,
    "short_term_rental" yes_no,
    "state" us_states,
    "prepay_penalty" ppp_structure,
    "citizenship" citizenship,
    "loan_structure" loan_structure_dscr,
    "transaction_type" transaction_type,
    "uw_exception" yes_no,
    "loan_amount_upb_min" numeric,
    "loan_amount_upb_max" numeric,
    "dscr_min" numeric,
    "dscr_max" numeric,
    "ltv_1" numeric default '0'::numeric,
    "ltv_2" numeric default '0'::numeric,
    "ltv_3" numeric default '0'::numeric,
    "ltv_4" numeric default '0'::numeric,
    "ltv_5" numeric default '0'::numeric,
    "ltv_6" numeric default '0'::numeric,
    "ltv_7" numeric default '0'::numeric,
    "created_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "updated_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text)
);


alter table "public"."rate_adjustment" enable row level security;

create table if not exists "public"."select_uw_outcomes" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "label" text not null default ''::text,
    "description" text default ''::text
);


alter table "public"."select_uw_outcomes" enable row level security;

create table if not exists "public"."task_templates" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "task_name" text,
    "task_description" text,
    "task_order" numeric,
    "status" task_status,
    "date_reached" date,
    "due_date" date,
    "date_completed" date,
    "assigned_to" bigint,
    "types_applied_to" text,
    "milestone_template_id" bigint,
    "days_until_due" numeric,
    "task_action" text
);


alter table "public"."task_templates" enable row level security;

create table if not exists "public"."tasks" (
    "id" bigint generated by default as identity not null,
    "deal_id" bigint,
    "task_name" character varying not null default ''::character varying,
    "task_description" text,
    "assigned_to" uuid,
    "status" task_status,
    "created_at" timestamp with time zone not null default now(),
    "task_order" numeric,
    "milestone_id" bigint,
    "due_date" date,
    "days_until_due" numeric,
    "task_action" text,
    "date_completed" date,
    "date_reached" date,
    "task_complete" boolean
);

alter table "public"."tasks" enable row level security;

create table if not exists "public"."auth_clerk_orgs" (
    "id" bigint generated by default as identity not null,
    "clerk_organization_id" text not null,
    "clerk_organization_name" text not null,
    "clerk_organization_slug" text not null,
    "created_by_clerk_id" text not null,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone default now()
);

alter table "public"."auth_clerk_orgs" enable row level security;

create table if not exists "public"."auth_clerk_orgs_members" (
    "id" bigint generated by default as identity not null,
    "user_id" bigint,
    "clerk_id" text not null,
    "clerk_organization_fkey" bigint,
    "clerk_role" clerk_role default 'member'::clerk_role,
    "created_at" timestamp with time zone not null default now(),
    "clerk_organization_id" text not null
);

alter table "public"."auth_clerk_orgs_members" enable row level security;

create table if not exists "public"."auth_user_profiles" (
    "id" bigint generated by default as identity not null,
    "contact_id" bigint,
    "updated_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "role" user_role_internal,
    "is_active_yn" boolean default true,
    "deactivation_date" date,
    "invitation_date" date,
    "activated_date" date,
    "is_internal_yn" boolean not null default false,
    "email" character varying(255),
    "office_phone" text,
    "clerk_id" text,
    "username" text,
    "first_name" text,
    "last_name" text,
    "cell_phone" text,
    "office_phone_extension" text,
    "is_locked" boolean default false,
    "is_banned" boolean default false,
    "last_active_at" timestamp with time zone,
    "last_sign_in_at" timestamp with time zone,
    "legal_accepted_at" timestamp with time zone,
    "email_verified" boolean default false,
    "email_verified_at" timestamp with time zone,
    "create_organization_enabled" boolean default false,
    "delete_self_enabled" boolean default false,
    "has_image" boolean default false,
    "image_url" text,
    "full_name" text generated always as (TRIM(BOTH FROM ((COALESCE(first_name, ''::text) || ' '::text) || COALESCE(last_name, ''::text)))) stored,
    "avatar_url" text,
    "website" text
);


alter table "public"."auth_user_profiles" enable row level security;

alter sequence "public"."transaction_references_id_seq" owned by "public"."bsi_transactions_references"."id";

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_class WHERE relname = 'Documents_pkey'
  ) THEN
    CREATE UNIQUE INDEX "Documents_pkey" ON public.document_files USING btree (id);
  END IF;
END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'Tasks_id_key') THEN CREATE UNIQUE INDEX "Tasks_id_key" ON public.tasks USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'Tasks_pkey') THEN CREATE UNIQUE INDEX "Tasks_pkey" ON public.tasks USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'appraisal_pkey') THEN CREATE UNIQUE INDEX appraisal_pkey ON public.appraisal USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'borrower_profile_pkey') THEN CREATE UNIQUE INDEX borrower_profile_pkey ON public.borrower USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'bs_debt_instruments_deals_pkey') THEN CREATE UNIQUE INDEX bs_debt_instruments_deals_pkey ON public.bs_debt_instruments_deals USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'bsi_deals_pkey') THEN CREATE UNIQUE INDEX bsi_deals_pkey ON public.bsi_deals USING btree (deal_id, contact_id, contact_types_id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'bsi_distribution_payments_pkey') THEN CREATE UNIQUE INDEX bsi_distribution_payments_pkey ON public.bsi_transactions USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'bsi_distributions_pkey') THEN CREATE UNIQUE INDEX bsi_distributions_pkey ON public.bsi_distributions USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'bsi_statements_pkey') THEN CREATE UNIQUE INDEX bsi_statements_pkey ON public.bsi_statements USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'cba_submission_credit_id_key') THEN CREATE UNIQUE INDEX cba_submission_credit_id_key ON public.cba_requests USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'cba_submission_credit_pkey') THEN CREATE UNIQUE INDEX cba_submission_credit_pkey ON public.cba_requests USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'cba_submissions_guarantors_pkey') THEN CREATE UNIQUE INDEX cba_submissions_guarantors_pkey ON public.cba_requests_guarantors USING btree (cba_request_id, guarantor_id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'company_contact_pkey') THEN CREATE UNIQUE INDEX company_contact_pkey ON public.company_contact USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'company_member_pkey') THEN CREATE UNIQUE INDEX company_member_pkey ON public.company_member USING btree (member_id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'company_pkey') THEN CREATE UNIQUE INDEX company_pkey ON public.company USING btree (co_id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'company_role_name_key') THEN CREATE UNIQUE INDEX company_role_name_key ON public.company_roles_defined USING btree (co_role); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'company_role_pkey') THEN CREATE UNIQUE INDEX company_role_pkey ON public.company_roles_defined USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'company_roles_pkey') THEN CREATE UNIQUE INDEX company_roles_pkey ON public.company_roles USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'constants_name_key') THEN CREATE UNIQUE INDEX constants_name_key ON public.constants USING btree (name); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'constants_pkey') THEN CREATE UNIQUE INDEX constants_pkey ON public.constants USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'contact_contact_types_pkey') THEN CREATE UNIQUE INDEX contact_contact_types_pkey ON public.contact_types_jt USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'contact_pkey') THEN CREATE UNIQUE INDEX contact_pkey ON public.contact USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'contact_types_jt_id_key') THEN CREATE UNIQUE INDEX contact_types_jt_id_key ON public.contact_types_jt USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'contact_types_pkey') THEN CREATE UNIQUE INDEX contact_types_pkey ON public.contact_types USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'countries_pkey') THEN CREATE UNIQUE INDEX countries_pkey ON public.countries USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'custom_loan_fees_pkey') THEN CREATE UNIQUE INDEX custom_loan_fees_pkey ON public.custom_loan_fees USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'deal_appraisals_pkey') THEN CREATE UNIQUE INDEX deal_appraisals_pkey ON public.deal_appraisals USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'deal_pkey') THEN CREATE UNIQUE INDEX deal_pkey ON public.deal USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'deal_program_row_index_constraint') THEN CREATE UNIQUE INDEX deal_program_row_index_constraint ON public.loan_price USING btree (deal_id, program, row_index); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'deal_property_pkey') THEN CREATE UNIQUE INDEX deal_property_pkey ON public.deal_property USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'deal_roles_pkey') THEN CREATE UNIQUE INDEX deal_roles_pkey ON public.deal_roles USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'debt_instruments_pkey') THEN CREATE UNIQUE INDEX debt_instruments_pkey ON public.bs_debt_instruments USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'document_files_pkey') THEN CREATE UNIQUE INDEX document_files_pkey ON public.document_files USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'document_roles_assigned_pkey') THEN CREATE UNIQUE INDEX document_roles_assigned_pkey ON public.document_roles_assigned USING btree (document_id, role_id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'document_roles_pkey') THEN CREATE UNIQUE INDEX document_roles_pkey ON public.document_roles USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'document_roles_role_name_key') THEN CREATE UNIQUE INDEX document_roles_role_name_key ON public.document_roles USING btree (role_name); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'fee_pkey') THEN CREATE UNIQUE INDEX fee_pkey ON public.fee USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'guarantor_pkey') THEN CREATE UNIQUE INDEX guarantor_pkey ON public.guarantor USING btree (guarantor_id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'loan_application_pkey') THEN CREATE UNIQUE INDEX loan_application_pkey ON public.loan_application USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'loan_price_pkey') THEN CREATE UNIQUE INDEX loan_price_pkey ON public.loan_price USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'loan_price_saved_pkey') THEN CREATE UNIQUE INDEX loan_price_saved_pkey ON public.loan_price_saved USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'loan_program_a_deal_id_key') THEN CREATE UNIQUE INDEX loan_program_a_deal_id_key ON public.loan_program_a USING btree (deal_id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'loan_program_a_pkey') THEN CREATE UNIQUE INDEX loan_program_a_pkey ON public.loan_program_a USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'loan_program_b_deal_id_key') THEN CREATE UNIQUE INDEX loan_program_b_deal_id_key ON public.loan_program_b USING btree (deal_id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'loan_program_b_pkey') THEN CREATE UNIQUE INDEX loan_program_b_pkey ON public.loan_program_b USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'ltv_band_name_key') THEN CREATE UNIQUE INDEX ltv_band_name_key ON public.ltv_band USING btree (name); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'ltv_band_pkey') THEN CREATE UNIQUE INDEX ltv_band_pkey ON public.ltv_band USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'max_ltv_pkey') THEN CREATE UNIQUE INDEX max_ltv_pkey ON public.max_ltv USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'milestone_templates_pkey') THEN CREATE UNIQUE INDEX milestone_templates_pkey ON public.milestone_templates USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'milestones_pkey') THEN CREATE UNIQUE INDEX milestones_pkey ON public.milestones USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'payroll_submission_fees_1099_pkey') THEN CREATE UNIQUE INDEX payroll_submission_fees_1099_pkey ON public.payroll_submission_fees_1099 USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'payroll_submission_pkey') THEN CREATE UNIQUE INDEX payroll_submission_pkey ON public.payroll_submission USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'auth_user_profiles_pkey') THEN CREATE UNIQUE INDEX auth_user_profiles_pkey ON public.auth_user_profiles USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'auth_user_profiles_username_key') THEN CREATE UNIQUE INDEX auth_user_profiles_username_key ON public.auth_user_profiles USING btree (username); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'property_data_reapi_pkey') THEN CREATE UNIQUE INDEX property_data_reapi_pkey ON public.property_reapi USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'property_income_pkey') THEN CREATE UNIQUE INDEX property_income_pkey ON public.property_income USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'property_pkey') THEN CREATE UNIQUE INDEX property_pkey ON public.property USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'property_reapi_id_key') THEN CREATE UNIQUE INDEX property_reapi_id_key ON public.property_reapi USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'rate_adjustment_pkey') THEN CREATE UNIQUE INDEX rate_adjustment_pkey ON public.rate_adjustment USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'task_templates_pkey') THEN CREATE UNIQUE INDEX task_templates_pkey ON public.task_templates USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'transaction_references_pkey') THEN CREATE UNIQUE INDEX transaction_references_pkey ON public.bs_investor_transactions_references USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'unique_company_contact') THEN CREATE UNIQUE INDEX unique_company_contact ON public.company_contact USING btree (co_id, contact_id, deal_id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'unique_company_role_deal') THEN CREATE UNIQUE INDEX unique_company_role_deal ON public.company_roles USING btree (co_id, role_id, deal_id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'unique_deal_appraisal') THEN CREATE UNIQUE INDEX unique_deal_appraisal ON public.deal_appraisals USING btree (deal_id, appraisal_id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'auth_clerk_orgs_clerk_organization_id_key') THEN CREATE UNIQUE INDEX auth_clerk_orgs_clerk_organization_id_key ON public.auth_clerk_orgs USING btree (clerk_organization_id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'auth_clerk_orgs_pkey') THEN CREATE UNIQUE INDEX auth_clerk_orgs_pkey ON public.auth_clerk_orgs USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'auth_clerk_orgs_slug_key') THEN CREATE UNIQUE INDEX auth_clerk_orgs_slug_key ON public.auth_clerk_orgs USING btree (clerk_organization_slug); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'auth_clerk_orgs_members_pkey') THEN CREATE UNIQUE INDEX auth_clerk_orgs_members_pkey ON public.auth_clerk_orgs_members USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'auth_user_profiles_clerk_id_key') THEN CREATE UNIQUE INDEX auth_user_profiles_clerk_id_key ON public.auth_user_profiles USING btree (clerk_id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'uw_result_id_key') THEN CREATE UNIQUE INDEX uw_result_id_key ON public.select_uw_outcomes USING btree (id); END IF; END$$;

DO $$ BEGIN IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'uw_result_pkey') THEN CREATE UNIQUE INDEX uw_result_pkey ON public.select_uw_outcomes USING btree (id); END IF; END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'appraisal_pkey'
  ) THEN
    ALTER TABLE "public"."appraisal" ADD CONSTRAINT "appraisal_pkey" PRIMARY KEY USING INDEX "appraisal_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'borrower_profile_pkey'
  ) THEN
    ALTER TABLE "public"."borrower" ADD CONSTRAINT "borrower_profile_pkey" PRIMARY KEY USING INDEX "borrower_profile_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'debt_instruments_pkey'
  ) THEN
    ALTER TABLE "public"."bs_debt_instruments" ADD CONSTRAINT "debt_instruments_pkey" PRIMARY KEY USING INDEX "debt_instruments_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'bs_debt_instruments_deals_pkey'
  ) THEN
    ALTER TABLE "public"."bs_debt_instruments_deals" ADD CONSTRAINT "bs_debt_instruments_deals_pkey" PRIMARY KEY USING INDEX "bs_debt_instruments_deals_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'bsi_deals_pkey'
  ) THEN
    ALTER TABLE "public"."bsi_deals" ADD CONSTRAINT "bsi_deals_pkey" PRIMARY KEY USING INDEX "bsi_deals_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'bsi_distributions_pkey'
  ) THEN
    ALTER TABLE "public"."bsi_distributions" ADD CONSTRAINT "bsi_distributions_pkey" PRIMARY KEY USING INDEX "bsi_distributions_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'bsi_statements_pkey'
  ) THEN
    ALTER TABLE "public"."bsi_statements" ADD CONSTRAINT "bsi_statements_pkey" PRIMARY KEY USING INDEX "bsi_statements_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'cba_submission_credit_pkey'
  ) THEN
    ALTER TABLE "public"."cba_requests" ADD CONSTRAINT "cba_submission_credit_pkey" PRIMARY KEY USING INDEX "cba_submission_credit_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'cba_submissions_guarantors_pkey'
  ) THEN
    ALTER TABLE "public"."cba_requests_guarantors" ADD CONSTRAINT "cba_submissions_guarantors_pkey" PRIMARY KEY USING INDEX "cba_submissions_guarantors_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'company_pkey'
  ) THEN
    ALTER TABLE "public"."company" ADD CONSTRAINT "company_pkey" PRIMARY KEY USING INDEX "company_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'company_contact_pkey'
  ) THEN
    ALTER TABLE "public"."company_contact" ADD CONSTRAINT "company_contact_pkey" PRIMARY KEY USING INDEX "company_contact_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'company_member_pkey'
  ) THEN
    ALTER TABLE "public"."company_member" ADD CONSTRAINT "company_member_pkey" PRIMARY KEY USING INDEX "company_member_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'company_roles_pkey'
  ) THEN
    ALTER TABLE "public"."company_roles" ADD CONSTRAINT "company_roles_pkey" PRIMARY KEY USING INDEX "company_roles_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'company_role_pkey'
  ) THEN
    ALTER TABLE "public"."company_roles_defined" ADD CONSTRAINT "company_role_pkey" PRIMARY KEY USING INDEX "company_role_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'constants_pkey'
  ) THEN
    ALTER TABLE "public"."constants" ADD CONSTRAINT "constants_pkey" PRIMARY KEY USING INDEX "constants_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'contact_pkey'
  ) THEN
    ALTER TABLE "public"."contact" ADD CONSTRAINT "contact_pkey" PRIMARY KEY USING INDEX "contact_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'contact_types_pkey'
  ) THEN
    ALTER TABLE "public"."contact_types" ADD CONSTRAINT "contact_types_pkey" PRIMARY KEY USING INDEX "contact_types_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'contact_contact_types_pkey'
  ) THEN
    ALTER TABLE "public"."contact_types_jt" ADD CONSTRAINT "contact_contact_types_pkey" PRIMARY KEY USING INDEX "contact_contact_types_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'countries_pkey'
  ) THEN
    ALTER TABLE "public"."countries" ADD CONSTRAINT "countries_pkey" PRIMARY KEY USING INDEX "countries_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'custom_loan_fees_pkey'
  ) THEN
    ALTER TABLE "public"."custom_loan_fees" ADD CONSTRAINT "custom_loan_fees_pkey" PRIMARY KEY USING INDEX "custom_loan_fees_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'deal_pkey'
  ) THEN
    ALTER TABLE "public"."deal" ADD CONSTRAINT "deal_pkey" PRIMARY KEY USING INDEX "deal_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'deal_appraisals_pkey'
  ) THEN
    ALTER TABLE "public"."deal_appraisals" ADD CONSTRAINT "deal_appraisals_pkey" PRIMARY KEY USING INDEX "deal_appraisals_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'deal_property_pkey'
  ) THEN
    ALTER TABLE "public"."deal_property" ADD CONSTRAINT "deal_property_pkey" PRIMARY KEY USING INDEX "deal_property_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'deal_roles_pkey'
  ) THEN
    ALTER TABLE "public"."deal_roles" ADD CONSTRAINT "deal_roles_pkey" PRIMARY KEY USING INDEX "deal_roles_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'document_roles_pkey'
  ) THEN
    ALTER TABLE "public"."document_roles" ADD CONSTRAINT "document_roles_pkey" PRIMARY KEY USING INDEX "document_roles_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'document_roles_assigned_pkey'
  ) THEN
    ALTER TABLE "public"."document_roles_assigned" ADD CONSTRAINT "document_roles_assigned_pkey" PRIMARY KEY USING INDEX "document_roles_assigned_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'fee_pkey'
  ) THEN
    ALTER TABLE "public"."fee" ADD CONSTRAINT "fee_pkey" PRIMARY KEY USING INDEX "fee_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'guarantor_pkey'
  ) THEN
    ALTER TABLE "public"."guarantor" ADD CONSTRAINT "guarantor_pkey" PRIMARY KEY USING INDEX "guarantor_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'loan_application_pkey'
  ) THEN
    ALTER TABLE "public"."loan_application" ADD CONSTRAINT "loan_application_pkey" PRIMARY KEY USING INDEX "loan_application_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'loan_price_pkey'
  ) THEN
    ALTER TABLE "public"."loan_price" ADD CONSTRAINT "loan_price_pkey" PRIMARY KEY USING INDEX "loan_price_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'loan_price_saved_pkey'
  ) THEN
    ALTER TABLE "public"."loan_price_saved" ADD CONSTRAINT "loan_price_saved_pkey" PRIMARY KEY USING INDEX "loan_price_saved_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'loan_program_a_pkey'
  ) THEN
    ALTER TABLE "public"."loan_program_a" ADD CONSTRAINT "loan_program_a_pkey" PRIMARY KEY USING INDEX "loan_program_a_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'loan_program_b_pkey'
  ) THEN
    ALTER TABLE "public"."loan_program_b" ADD CONSTRAINT "loan_program_b_pkey" PRIMARY KEY USING INDEX "loan_program_b_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'ltv_band_pkey'
  ) THEN
    ALTER TABLE "public"."ltv_band" ADD CONSTRAINT "ltv_band_pkey" PRIMARY KEY USING INDEX "ltv_band_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'max_ltv_pkey'
  ) THEN
    ALTER TABLE "public"."max_ltv" ADD CONSTRAINT "max_ltv_pkey" PRIMARY KEY USING INDEX "max_ltv_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'milestone_templates_pkey'
  ) THEN
    ALTER TABLE "public"."milestone_templates" ADD CONSTRAINT "milestone_templates_pkey" PRIMARY KEY USING INDEX "milestone_templates_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'milestones_pkey'
  ) THEN
    ALTER TABLE "public"."milestones" ADD CONSTRAINT "milestones_pkey" PRIMARY KEY USING INDEX "milestones_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'payroll_submission_pkey'
  ) THEN
    ALTER TABLE "public"."payroll_submission" ADD CONSTRAINT "payroll_submission_pkey" PRIMARY KEY USING INDEX "payroll_submission_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'payroll_submission_fees_1099_pkey'
  ) THEN
    ALTER TABLE "public"."payroll_submission_fees_1099" ADD CONSTRAINT "payroll_submission_fees_1099_pkey" PRIMARY KEY USING INDEX "payroll_submission_fees_1099_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'property_pkey'
  ) THEN
    ALTER TABLE "public"."property" ADD CONSTRAINT "property_pkey" PRIMARY KEY USING INDEX "property_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'property_income_pkey'
  ) THEN
    ALTER TABLE "public"."property_income" ADD CONSTRAINT "property_income_pkey" PRIMARY KEY USING INDEX "property_income_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'property_data_reapi_pkey'
  ) THEN
    ALTER TABLE "public"."property_reapi" ADD CONSTRAINT "property_data_reapi_pkey" PRIMARY KEY USING INDEX "property_data_reapi_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'rate_adjustment_pkey'
  ) THEN
    ALTER TABLE "public"."rate_adjustment" ADD CONSTRAINT "rate_adjustment_pkey" PRIMARY KEY USING INDEX "rate_adjustment_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'uw_result_pkey'
  ) THEN
    ALTER TABLE "public"."select_uw_outcomes" ADD CONSTRAINT "uw_result_pkey" PRIMARY KEY USING INDEX "uw_result_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'task_templates_pkey'
  ) THEN
    ALTER TABLE "public"."task_templates" ADD CONSTRAINT "task_templates_pkey" PRIMARY KEY USING INDEX "task_templates_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'Tasks_pkey'
  ) THEN
    ALTER TABLE "public"."tasks" ADD CONSTRAINT "Tasks_pkey" PRIMARY KEY USING INDEX "Tasks_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'auth_clerk_orgs_pkey'
  ) THEN
    ALTER TABLE "public"."auth_clerk_orgs" ADD CONSTRAINT "auth_clerk_orgs_pkey" PRIMARY KEY USING INDEX "auth_clerk_orgs_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'auth_clerk_orgs_members_pkey'
  ) THEN
    ALTER TABLE "public"."auth_clerk_orgs_members" ADD CONSTRAINT "auth_clerk_orgs_members_pkey" PRIMARY KEY USING INDEX "auth_clerk_orgs_members_pkey";
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'auth_user_profiles_pkey'
  ) THEN
    ALTER TABLE "public"."auth_user_profiles" ADD CONSTRAINT "auth_user_profiles_pkey" PRIMARY KEY USING INDEX "auth_user_profiles_pkey";
  END IF;
END$$;

set check_function_bodies = off;


CREATE OR REPLACE FUNCTION public.format_address(po_box text, street text, apt_suite text, city text, state text, postal_code text, country text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
DECLARE
    formatted_address text;
BEGIN
    -- Initialize an array to hold address components
    formatted_address := TRIM(BOTH ', ' FROM
        array_to_string(
            ARRAY_REMOVE(
                ARRAY[
                    NULLIF(street, ''),
                    NULLIF(apt_suite, ''),
                    NULLIF(city, ''),
                    CASE
                        WHEN COALESCE(state, '') <> '' AND COALESCE(postal_code, '') <> '' THEN
                            state || ' ' || postal_code
                        WHEN COALESCE(state, '') <> '' THEN
                            state
                        WHEN COALESCE(postal_code, '') <> '' THEN
                            postal_code
                        ELSE
                            NULL
                    END,
                    NULLIF(country, ''),
                    CASE 
                        WHEN COALESCE(po_box, '') <> '' THEN
                            'PO Box ' || po_box 
                        ELSE 
                            NULL 
                    END
                ],
                NULL
            ),
            ', '
        )
    );

    -- Return the formatted address
    RETURN formatted_address;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.format_deal_name(property_id bigint)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
DECLARE
    formatted_name text;
BEGIN
    SELECT 
        CONCAT_WS(', ', 
            p.address_street, 
            p.address_suite_apt, 
            p.address_city || ', ' || p.address_state || ' ' || p.address_postal_code
        )
    INTO formatted_name
    FROM public.property p
    WHERE p.id = property_id;

    RETURN formatted_name;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.get_jsonb_array_element(array_value jsonb, index integer)
 RETURNS text
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
BEGIN
    RETURN (
        with elements as (
          with x as (
            select jsonb_array_elements_text(array_value) AS element) 
            select x.element, row_number() over() as element_index from x
          ) 
        select elements.element from elements where elements.element_index = index);
END;
$function$
;

CREATE OR REPLACE FUNCTION public.get_numeric_constant(constant_name text)
 RETURNS numeric
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
    result numeric;
BEGIN
    -- Retrieve the constant record based on the given name
    SELECT numeric_value INTO result
    FROM public.constants
    WHERE name = constant_name;

    -- Check if the constant record exists
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Constant with name % not found', constant_name;
    END IF;

    return result;
END;
$function$
;


CREATE OR REPLACE FUNCTION public.get_state_code(state_name text)
 RETURNS us_states
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$BEGIN
    state_name := LOWER(state_name); -- Convert input to lowercase
    CASE state_name
        WHEN 'alabama' THEN RETURN 'AL';
        WHEN 'alaska' THEN RETURN 'AK';
        WHEN 'arizona' THEN RETURN 'AZ';
        WHEN 'arkansas' THEN RETURN 'AR';
        WHEN 'california' THEN RETURN 'CA';
        WHEN 'colorado' THEN RETURN 'CO';
        WHEN 'connecticut' THEN RETURN 'CT';
        WHEN 'delaware' THEN RETURN 'DE';
        WHEN 'florida' THEN RETURN 'FL';
        WHEN 'georgia' THEN RETURN 'GA';
        WHEN 'hawaii' THEN RETURN 'HI';
        WHEN 'idaho' THEN RETURN 'ID';
        WHEN 'illinois' THEN RETURN 'IL';
        WHEN 'indiana' THEN RETURN 'IN';
        WHEN 'iowa' THEN RETURN 'IA';
        WHEN 'kansas' THEN RETURN 'KS';
        WHEN 'kentucky' THEN RETURN 'KY';
        WHEN 'louisiana' THEN RETURN 'LA';
        WHEN 'maine' THEN RETURN 'ME';
        WHEN 'maryland' THEN RETURN 'MD';
        WHEN 'massachusetts' THEN RETURN 'MA';
        WHEN 'michigan' THEN RETURN 'MI';
        WHEN 'minnesota' THEN RETURN 'MN';
        WHEN 'mississippi' THEN RETURN 'MS';
        WHEN 'missouri' THEN RETURN 'MO';
        WHEN 'montana' THEN RETURN 'MT';
        WHEN 'nebraska' THEN RETURN 'NE';
        WHEN 'nevada' THEN RETURN 'NV';
        WHEN 'new_hampshire' THEN RETURN 'NH';
        WHEN 'new_jersey' THEN RETURN 'NJ';
        WHEN 'new_mexico' THEN RETURN 'NM';
        WHEN 'new_york' THEN RETURN 'NY';
        WHEN 'north_carolina' THEN RETURN 'NC';
        WHEN 'north_dakota' THEN RETURN 'ND';
        WHEN 'ohio' THEN RETURN 'OH';
        WHEN 'oklahoma' THEN RETURN 'OK';
        WHEN 'oregon' THEN RETURN 'OR';
        WHEN 'pennsylvania' THEN RETURN 'PA';
        WHEN 'rhode_island' THEN RETURN 'RI';
        WHEN 'south_carolina' THEN RETURN 'SC';
        WHEN 'south_dakota' THEN RETURN 'SD';
        WHEN 'tennessee' THEN RETURN 'TN';
        WHEN 'texas' THEN RETURN 'TX';
        WHEN 'utah' THEN RETURN 'UT';
        WHEN 'vermont' THEN RETURN 'VT';
        WHEN 'virginia' THEN RETURN 'VA';
        WHEN 'washington' THEN RETURN 'WA';
        WHEN 'west_virginia' THEN RETURN 'WV';
        WHEN 'wisconsin' THEN RETURN 'WI';
        WHEN 'wyoming' THEN RETURN 'WY';
        ELSE RETURN NULL;
    END CASE;
END;$function$
;

CREATE OR REPLACE FUNCTION public.get_text_constant(constant_name text)
 RETURNS text
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
    result text;
BEGIN
    -- Retrieve the constant record based on the given name
    SELECT text_value INTO result
    FROM public.constants
    WHERE name = constant_name;

    -- Check if the constant record exists
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Constant with name % not found', constant_name;
    END IF;

    return result;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.get_yesno_constant(constant_name text)
 RETURNS yes_no
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
    result yes_no;
BEGIN
    -- Retrieve the constant record based on the given name
    SELECT yes_no_value INTO result
    FROM public.constants
    WHERE name = constant_name;

    -- Check if the constant record exists
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Constant with name % not found', constant_name;
    END IF;

    return result;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.handle_new_deal()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$declare 
  program_a_id int8;
  program_b_id int8;
begin

  insert into loan_program_a (loan_amount)
  values (0)
  returning id into program_a_id;

  insert into loan_program_b (loan_amount)
  values (0)
  returning id into program_b_id;

  NEW.program_a_id := program_a_id;
  NEW.program_b_id := program_b_id;
  return NEW;
end;$function$
;

CREATE OR REPLACE FUNCTION public.handle_new_loan_application()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
  guarantor_count int;
  company_member_count int;
  company_member_borrower_id int;
  company_member_company_id int;
  company_member_guarantor_index text;
  counter int;
  new_deal_id bigint;
  new_company_id bigint;
  new_primary_borrower_id bigint;
  new_second_borrower_id bigint;
  new_third_borrower_id bigint;
  new_fourth_borrower_id bigint;
  new_primary_guarantor_id bigint;
  new_second_guarantor_id bigint;
  new_third_guarantor_id bigint;
  new_fourth_guarantor_id bigint;
  new_property_id bigint;
  submission_data JSONB;
BEGIN
  submission_data := NEW.submission::JSONB;
  BEGIN
  -- Create the property
    new_property_id := create_property_from_submission(submission_data);

  -- Create the deal
    new_deal_id := create_deal_from_submission(submission_data, new_property_id);

  -- Create the borrowers and set them as guarantors on the deal
    guarantor_count := CAST(NULLIF(submission_data->>'numberGuarantors', '') AS numeric);
    IF guarantor_count > 0 THEN
      new_primary_borrower_id = create_submission_borrower(
        submission_data->>'primaryGuarantorFirstName',
        submission_data->>'primaryGuarantorMiddleName',
        submission_data->>'primaryGuarantorLastName',
        submission_data->>'primaryGuarantorEmail',
        submission_data->>'primaryGuarantorCellPhone',
        submission_data->>'primaryGuarantorAlternatePhone',
        CAST(NULLIF(submission_data->>'primaryGuarantorCitizenship', '') AS citizenship),
        submission_data->>'primaryGuarantorSSN',
        TO_DATE(submission_data->>'primaryGuarantorDateOfBirth', 'YYYY-MM-DD'),
        submission_data->>'primaryGuarantorAddress',
        submission_data->>'primaryGuarantorAddressLine2',
        submission_data->>'primaryGuarantorCity',
        CAST(NULLIF(submission_data->>'primaryGuarantorState', '') AS us_states_long),
        submission_data->>'primaryGuarantorPostalCode',
        submission_data->>'primaryGuarantorCounty',
        submission_data->>'primaryGuarantorCountry',
        CAST(NULLIF(submission_data->>'primaryGuarantorFICO', '') as numeric),
        CAST(NULLIF(submission_data->>'primaryGuarantorRentalsOwned', '') as numeric),
        CAST(NULLIF(submission_data->>'primaryGuarantorFixAndFlip', '') as numeric),
        CAST(NULLIF(submission_data->>'primaryGuarantorGroundUp', '') as numeric),
        CAST(submission_data->>'primaryGuarantorExperienced' as yes_no)
      );

      new_primary_guarantor_id = create_submission_guarantor(new_deal_id, new_primary_borrower_id, 
        submission_data->>'primaryGuarantorFirstName',
        submission_data->>'primaryGuarantorMiddleName',
        submission_data->>'primaryGuarantorLastName',
        submission_data->>'primaryGuarantorEmail',
        submission_data->>'primaryGuarantorCellPhone'
      );
    END IF;

    IF guarantor_count > 1 THEN
      new_second_borrower_id = create_submission_borrower(
        submission_data->>'secondGuarantorFirstName',
        submission_data->>'secondGuarantorMiddleName',
        submission_data->>'secondGuarantorLastName',
        submission_data->>'secondGuarantorEmail',
        submission_data->>'secondGuarantorCellPhone',
        submission_data->>'secondGuarantorAlternatePhone',
        CAST(NULLIF(submission_data->>'secondGuarantorCitizenship', '') AS citizenship),
        submission_data->>'secondGuarantorSSN',
        TO_DATE(submission_data->>'secondGuarantorDateOfBirth', 'YYYY-MM-DD'),
        submission_data->>'secondGuarantorAddress',
        submission_data->>'secondGuarantorAddressLine2',
        submission_data->>'secondGuarantorCity',
        CAST(NULLIF(submission_data->>'secondGuarantorState', '') AS us_states_long),
        submission_data->>'secondGuarantorPostalCode',
        submission_data->>'secondGuarantorCounty',
        submission_data->>'secondGuarantorCountry',
        CAST(NULLIF(submission_data->>'secondGuarantorFICO', '') as numeric),
        CAST(NULLIF(submission_data->>'secondGuarantorRentalsOwned', '') as numeric),
        CAST(NULLIF(submission_data->>'secondGuarantorFixAndFlip', '') as numeric),
        CAST(NULLIF(submission_data->>'secondGuarantorGroundUp', '') as numeric),
        CAST(submission_data->>'secondGuarantorExperienced' as yes_no)
      );

      new_second_guarantor_id = create_submission_guarantor(new_deal_id, new_second_borrower_id, 
        submission_data->>'secondGuarantorFirstName',
        submission_data->>'secondGuarantorMiddleName',
        submission_data->>'secondGuarantorLastName',
        submission_data->>'secondGuarantorEmail',
        submission_data->>'secondGuarantorCellPhone'
      );
    END IF;

    IF guarantor_count > 2 THEN
      new_third_borrower_id = create_submission_borrower(
        submission_data->>'thirdGuarantorFirstName',
        submission_data->>'thirdGuarantorMiddleName',
        submission_data->>'thirdGuarantorLastName',
        submission_data->>'thirdGuarantorEmail',
        submission_data->>'thirdGuarantorCellPhone',
        submission_data->>'thirdGuarantorAlternatePhone',
        CAST(NULLIF(submission_data->>'thirdGuarantorCitizenship', '') AS citizenship),
        submission_data->>'thirdGuarantorSSN',
        TO_DATE(submission_data->>'thirdGuarantorDateOfBirth', 'YYYY-MM-DD'),
        submission_data->>'thirdGuarantorAddress',
        submission_data->>'thirdGuarantorAddressLine2',
        submission_data->>'thirdGuarantorCity',
        CAST(NULLIF(submission_data->>'thirdGuarantorState', '') AS us_states_long),
        submission_data->>'thirdGuarantorPostalCode',
        submission_data->>'thirdGuarantorCounty',
        submission_data->>'thirdGuarantorCountry',
        CAST(NULLIF(submission_data->>'thirdGuarantorFICO', '') as numeric),
        CAST(NULLIF(submission_data->>'thirdGuarantorRentalsOwned', '') as numeric),
        CAST(NULLIF(submission_data->>'thirdGuarantorFixAndFlip', '') as numeric),
        CAST(NULLIF(submission_data->>'thirdGuarantorGroundUp', '') as numeric),
        CAST(submission_data->>'thirdGuarantorExperienced' as yes_no)
      );

      new_third_guarantor_id = create_submission_guarantor(new_deal_id, new_third_borrower_id, 
        submission_data->>'thirdGuarantorFirstName',
        submission_data->>'thirdGuarantorMiddleName',
        submission_data->>'thirdGuarantorLastName',
        submission_data->>'thirdGuarantorEmail',
        submission_data->>'thirdGuarantorCellPhone'
      );
    END IF;

    IF guarantor_count > 3 THEN
      new_fourth_borrower_id = create_submission_borrower(
        submission_data->>'fourthGuarantorFirstName',
        submission_data->>'fourthGuarantorMiddleName',
        submission_data->>'fourthGuarantorLastName',
        submission_data->>'fourthGuarantorEmail',
        submission_data->>'fourthGuarantorCellPhone',
        submission_data->>'fourthGuarantorAlternatePhone',
        CAST(NULLIF(submission_data->>'fourthGuarantorCitizenship', '') AS citizenship),
        submission_data->>'fourthGuarantorSSN',
        TO_DATE(submission_data->>'fourthGuarantorDateOfBirth', 'YYYY-MM-DD'),
        submission_data->>'fourthGuarantorAddress',
        submission_data->>'fourthGuarantorAddressLine2',
        submission_data->>'fourthGuarantorCity',
        CAST(NULLIF(submission_data->>'fourthGuarantorState', '') AS us_states_long),
        submission_data->>'fourthGuarantorPostalCode',
        submission_data->>'fourthGuarantorCounty',
        submission_data->>'fourthGuarantorCountry',
        CAST(NULLIF(submission_data->>'fourthGuarantorFICO', '') as numeric),
        CAST(NULLIF(submission_data->>'fourthGuarantorRentalsOwned', '') as numeric),
        CAST(NULLIF(submission_data->>'fourthGuarantorFixAndFlip', '') as numeric),
        CAST(NULLIF(submission_data->>'fourthGuarantorGroundUp', '') as numeric),
        CAST(submission_data->>'fourthGuarantorExperienced' as yes_no)
      );

      new_fourth_guarantor_id = create_submission_guarantor(new_deal_id, new_fourth_borrower_id, 
        submission_data->>'fourthGuarantorFirstName',
        submission_data->>'fourthGuarantorMiddleName',
        submission_data->>'fourthGuarantorLastName',
        submission_data->>'fourthGuarantorEmail',
        submission_data->>'fourthGuarantorCellPhone'
      );
    END IF;


    IF submission_data->>'vestingEntityType' = 'Entity' THEN
      new_company_id := create_company_from_submission(submission_data);
      company_member_count := submission_data->>'numberCompanyMembers';

      IF new_company_id IS NOT NULL AND company_member_count > 0 THEN 
        counter := 1;

        WHILE counter <= company_member_count LOOP
          
          company_member_company_id := null;
          company_member_borrower_id := null;
          company_member_guarantor_index := null;

          IF get_jsonb_array_element(submission_data->'companyOwnerType', counter) = 'Entity' THEN
          -- get the company member type, if company, create a company and get the id. 
          insert into company (co_name, co_entity_type, co_ein, co_ppb_address_street, co_ppb_address_suite_apt,
            co_ppb_address_city, co_ppb_address_state_long, co_ppb_address_postal_code, co_ppb_address_country, co_role)
            values(
              get_jsonb_array_element(submission_data->'companyOwnerEntityName', counter),
              CAST(get_jsonb_array_element(submission_data->'companyOwnerEntityType', counter) AS entity_type),
              get_jsonb_array_element(submission_data->'companyOwnerEIN', counter),
              get_jsonb_array_element(submission_data->'companyOwnerStreetAddress', counter),
              get_jsonb_array_element(submission_data->'companyOwnerAddressLine2', counter),
              get_jsonb_array_element(submission_data->'companyOwnerCity', counter),
              CAST(get_jsonb_array_element(submission_data->'companyOwnerState', counter) AS us_states_long),
              get_jsonb_array_element(submission_data->'companyOwnerPostalCode', counter),
              CAST(get_jsonb_array_element(submission_data->'companyOwnerCountry', counter) AS country_enum),
              'Borrowing Entity'::company_role
            )
          returning co_id into company_member_company_id;
         
          ELSE
          -- if individual, check if is guarantor. if so get the guarantor number 
            IF get_jsonb_array_element(submission_data->'companyOwnerIsGuarantor', counter) = 'Yes' THEN
              company_member_guarantor_index := split_part(
                get_jsonb_array_element(submission_data->'companyOwnerGuarantorId', counter), ':', 1);
              company_member_borrower_id := CASE company_member_guarantor_index
                                              WHEN '1' THEN new_primary_borrower_id
                                              WHEN '2' THEN new_second_borrower_id
                                              WHEN '3' THEN new_third_borrower_id
                                              WHEN '4' THEN new_fourth_borrower_id
                                              ELSE null
                                            END;
            ELSE
              insert into borrower (first_name, middle_name, last_name, email_address, cell_phone, social_security_number,
                primary_residence_address_street, primary_residence_address_suite_apt, primary_residence_address_city, primary_residence_address_state_long, primary_residence_address_postal_code, primary_residence_address_country)
              values(
                get_jsonb_array_element(submission_data->'companyOwnerFirstName', counter),
                get_jsonb_array_element(submission_data->'companyOwnerMiddleName', counter),
                get_jsonb_array_element(submission_data->'companyOwnerLastName', counter),
                get_jsonb_array_element(submission_data->'companyOwnerEmail', counter),
                get_jsonb_array_element(submission_data->'companyOwnerCellPhone', counter),
                get_jsonb_array_element(submission_data->'companyOwnerTaxId', counter),
                get_jsonb_array_element(submission_data->'companyOwnerStreetAddress', counter),
                get_jsonb_array_element(submission_data->'companyOwnerAddressLine2', counter),
                get_jsonb_array_element(submission_data->'companyOwnerCity', counter),
                CAST(get_jsonb_array_element(submission_data->'companyOwnerState', counter) AS us_states_long),
                get_jsonb_array_element(submission_data->'companyOwnerPostalCode', counter),
                get_jsonb_array_element(submission_data->'companyOwnerCountry', counter)
              )
              returning id into company_member_borrower_id;
            END IF;
          END IF;
          -- create the member with the appropriate ids
          insert into company_member (member_company_id, 
            --member_name, 
            member_ownership_percentage, member_title, 
            member_borrower_id, member_owning_company_id, member_type, member_name_first, member_name_last, member_is_guarantor)
          values(
            new_company_id,
            --get_jsonb_array_element(submission_data->'companyOwnerName', counter),
            CAST(NULLIF(get_jsonb_array_element(submission_data->'companyOwnerOwnership', counter), '') AS double precision)/100,
            get_jsonb_array_element(submission_data->'companyOwnerTitle', counter),
            company_member_borrower_id,
            company_member_company_id,
            CAST(NULLIF(get_jsonb_array_element(submission_data->'companyOwnerType', counter), '') AS vesting_type),
            get_jsonb_array_element(submission_data->'companyOwnerFirstName', counter),
            get_jsonb_array_element(submission_data->'companyOwnerLastName', counter),
            CAST(NULLIF(get_jsonb_array_element(submission_data->'companyOwnerIsGuarantor', counter), '') AS yes_no)
          );
          counter := counter + 1;
        END LOOP;
      END IF;

    END IF;

    -- update the deal with the parties
    UPDATE deal SET
      company_id = new_company_id,
      primary_guarantor_id = new_primary_guarantor_id,
      second_guarantor_id = new_second_guarantor_id,
      third_guarantor_id = new_third_guarantor_id,
      fourth_guarantor_id = new_fourth_guarantor_id
    WHERE id = new_deal_id;
    
    IF new_deal_id IS NOT NULL THEN
      UPDATE loan_application SET 
        application_deal_id = new_deal_id,
        status = 'DEAL CREATED',
        reprocess = false 
      WHERE id = NEW.id;
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
    -- Log the error (optional)
      UPDATE loan_application SET 
        status = 'ERROR',
        reprocess = false , 
        error_message = SQLERRM 
      WHERE id = NEW.id;
      RAISE LOG 'Error processing loan application submission: %', SQLERRM;
  END;
  RETURN NEW;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.handle_new_user()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$begin
  insert into public.user_profile (id, email, first_name, last_name, avatar_url)
  values (new.id, new.email, new.raw_user_meta_data->>'first_name', new.raw_user_meta_data->>'last_name', new.raw_user_meta_data->>'avatar_url');
  return new;
  return new;
end;$function$
;


CREATE OR REPLACE FUNCTION public.handle_user_profile_changes()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$DECLARE contactid bigint;
BEGIN
    --Update deal table:
    --RAISE log 'Running handle_user_profile_changes function with ID: %', NEW.id;
    select id into contactid from contact where user_profile_id = NEW.id;
    UPDATE deal SET guarantor_fico_score = NEW.fico_score_mid_actual, guarantor_citizenship = NEW.citizenship, 
    guarantor_first_time_home_buyer = NEW.first_time_home_buyer, guarantor_mortgage_debt = NEW.mortgage_debt
    where primary_guarantor_id = contactid and deal.locked = false;

RETURN NEW;
END;$function$
;

CREATE OR REPLACE FUNCTION public.ltv(transaction_type transaction_type, as_is_value numeric, purchase_price numeric, loan_amount numeric)
 RETURNS numeric
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
    result NUMERIC;
BEGIN
    result := CASE
        WHEN transaction_type IN ('Refinance Rate/Term', 'Refinance Cash Out') THEN (100 * (loan_amount / as_is_value))
        WHEN purchase_price < as_is_value AND transaction_type IN ('Purchase', 'Delayed Purchase') THEN (100 * (loan_amount / purchase_price))
        WHEN purchase_price >= as_is_value AND transaction_type IN ('Purchase', 'Delayed Purchase') THEN (100 * (loan_amount / as_is_value))
    END;
    RETURN result;
END;
$function$
;


grant delete on table "public"."appraisal" to "anon";

grant insert on table "public"."appraisal" to "anon";

grant references on table "public"."appraisal" to "anon";

grant select on table "public"."appraisal" to "anon";

grant trigger on table "public"."appraisal" to "anon";

grant truncate on table "public"."appraisal" to "anon";

grant update on table "public"."appraisal" to "anon";

grant delete on table "public"."appraisal" to "authenticated";

grant insert on table "public"."appraisal" to "authenticated";

grant references on table "public"."appraisal" to "authenticated";

grant select on table "public"."appraisal" to "authenticated";

grant trigger on table "public"."appraisal" to "authenticated";

grant truncate on table "public"."appraisal" to "authenticated";

grant update on table "public"."appraisal" to "authenticated";

grant delete on table "public"."appraisal" to "service_role";

grant insert on table "public"."appraisal" to "service_role";

grant references on table "public"."appraisal" to "service_role";

grant select on table "public"."appraisal" to "service_role";

grant trigger on table "public"."appraisal" to "service_role";

grant truncate on table "public"."appraisal" to "service_role";

grant update on table "public"."appraisal" to "service_role";

grant delete on table "public"."borrower" to "anon";

grant insert on table "public"."borrower" to "anon";

grant references on table "public"."borrower" to "anon";

grant select on table "public"."borrower" to "anon";

grant trigger on table "public"."borrower" to "anon";

grant truncate on table "public"."borrower" to "anon";

grant update on table "public"."borrower" to "anon";

grant delete on table "public"."borrower" to "authenticated";

grant insert on table "public"."borrower" to "authenticated";

grant references on table "public"."borrower" to "authenticated";

grant select on table "public"."borrower" to "authenticated";

grant trigger on table "public"."borrower" to "authenticated";

grant truncate on table "public"."borrower" to "authenticated";

grant update on table "public"."borrower" to "authenticated";

grant delete on table "public"."borrower" to "service_role";

grant insert on table "public"."borrower" to "service_role";

grant references on table "public"."borrower" to "service_role";

grant select on table "public"."borrower" to "service_role";

grant trigger on table "public"."borrower" to "service_role";

grant truncate on table "public"."borrower" to "service_role";

grant update on table "public"."borrower" to "service_role";

grant delete on table "public"."bs_debt_instruments" to "anon";

grant insert on table "public"."bs_debt_instruments" to "anon";

grant references on table "public"."bs_debt_instruments" to "anon";

grant select on table "public"."bs_debt_instruments" to "anon";

grant trigger on table "public"."bs_debt_instruments" to "anon";

grant truncate on table "public"."bs_debt_instruments" to "anon";

grant update on table "public"."bs_debt_instruments" to "anon";

grant delete on table "public"."bs_debt_instruments" to "authenticated";

grant insert on table "public"."bs_debt_instruments" to "authenticated";

grant references on table "public"."bs_debt_instruments" to "authenticated";

grant select on table "public"."bs_debt_instruments" to "authenticated";

grant trigger on table "public"."bs_debt_instruments" to "authenticated";

grant truncate on table "public"."bs_debt_instruments" to "authenticated";

grant update on table "public"."bs_debt_instruments" to "authenticated";

grant delete on table "public"."bs_debt_instruments" to "service_role";

grant insert on table "public"."bs_debt_instruments" to "service_role";

grant references on table "public"."bs_debt_instruments" to "service_role";

grant select on table "public"."bs_debt_instruments" to "service_role";

grant trigger on table "public"."bs_debt_instruments" to "service_role";

grant truncate on table "public"."bs_debt_instruments" to "service_role";

grant update on table "public"."bs_debt_instruments" to "service_role";

grant delete on table "public"."bs_debt_instruments_deals" to "anon";

grant insert on table "public"."bs_debt_instruments_deals" to "anon";

grant references on table "public"."bs_debt_instruments_deals" to "anon";

grant select on table "public"."bs_debt_instruments_deals" to "anon";

grant trigger on table "public"."bs_debt_instruments_deals" to "anon";

grant truncate on table "public"."bs_debt_instruments_deals" to "anon";

grant update on table "public"."bs_debt_instruments_deals" to "anon";

grant delete on table "public"."bs_debt_instruments_deals" to "authenticated";

grant insert on table "public"."bs_debt_instruments_deals" to "authenticated";

grant references on table "public"."bs_debt_instruments_deals" to "authenticated";

grant select on table "public"."bs_debt_instruments_deals" to "authenticated";

grant trigger on table "public"."bs_debt_instruments_deals" to "authenticated";

grant truncate on table "public"."bs_debt_instruments_deals" to "authenticated";

grant update on table "public"."bs_debt_instruments_deals" to "authenticated";

grant delete on table "public"."bs_debt_instruments_deals" to "service_role";

grant insert on table "public"."bs_debt_instruments_deals" to "service_role";

grant references on table "public"."bs_debt_instruments_deals" to "service_role";

grant select on table "public"."bs_debt_instruments_deals" to "service_role";

grant trigger on table "public"."bs_debt_instruments_deals" to "service_role";

grant truncate on table "public"."bs_debt_instruments_deals" to "service_role";

grant update on table "public"."bs_debt_instruments_deals" to "service_role";

grant delete on table "public"."bsi_deals" to "anon";

grant insert on table "public"."bsi_deals" to "anon";

grant references on table "public"."bsi_deals" to "anon";

grant select on table "public"."bsi_deals" to "anon";

grant trigger on table "public"."bsi_deals" to "anon";

grant truncate on table "public"."bsi_deals" to "anon";

grant update on table "public"."bsi_deals" to "anon";

grant delete on table "public"."bsi_deals" to "authenticated";

grant insert on table "public"."bsi_deals" to "authenticated";

grant references on table "public"."bsi_deals" to "authenticated";

grant select on table "public"."bsi_deals" to "authenticated";

grant trigger on table "public"."bsi_deals" to "authenticated";

grant truncate on table "public"."bsi_deals" to "authenticated";

grant update on table "public"."bsi_deals" to "authenticated";

grant delete on table "public"."bsi_deals" to "service_role";

grant insert on table "public"."bsi_deals" to "service_role";

grant references on table "public"."bsi_deals" to "service_role";

grant select on table "public"."bsi_deals" to "service_role";

grant trigger on table "public"."bsi_deals" to "service_role";

grant truncate on table "public"."bsi_deals" to "service_role";

grant update on table "public"."bsi_deals" to "service_role";

grant delete on table "public"."bsi_distributions" to "anon";

grant insert on table "public"."bsi_distributions" to "anon";

grant references on table "public"."bsi_distributions" to "anon";

grant select on table "public"."bsi_distributions" to "anon";

grant trigger on table "public"."bsi_distributions" to "anon";

grant truncate on table "public"."bsi_distributions" to "anon";

grant update on table "public"."bsi_distributions" to "anon";

grant delete on table "public"."bsi_distributions" to "authenticated";

grant insert on table "public"."bsi_distributions" to "authenticated";

grant references on table "public"."bsi_distributions" to "authenticated";

grant select on table "public"."bsi_distributions" to "authenticated";

grant trigger on table "public"."bsi_distributions" to "authenticated";

grant truncate on table "public"."bsi_distributions" to "authenticated";

grant update on table "public"."bsi_distributions" to "authenticated";

grant delete on table "public"."bsi_distributions" to "service_role";

grant insert on table "public"."bsi_distributions" to "service_role";

grant references on table "public"."bsi_distributions" to "service_role";

grant select on table "public"."bsi_distributions" to "service_role";

grant trigger on table "public"."bsi_distributions" to "service_role";

grant truncate on table "public"."bsi_distributions" to "service_role";

grant update on table "public"."bsi_distributions" to "service_role";

grant delete on table "public"."bsi_statements" to "anon";

grant insert on table "public"."bsi_statements" to "anon";

grant references on table "public"."bsi_statements" to "anon";

grant select on table "public"."bsi_statements" to "anon";

grant trigger on table "public"."bsi_statements" to "anon";

grant truncate on table "public"."bsi_statements" to "anon";

grant update on table "public"."bsi_statements" to "anon";

grant delete on table "public"."bsi_statements" to "authenticated";

grant insert on table "public"."bsi_statements" to "authenticated";

grant references on table "public"."bsi_statements" to "authenticated";

grant select on table "public"."bsi_statements" to "authenticated";

grant trigger on table "public"."bsi_statements" to "authenticated";

grant truncate on table "public"."bsi_statements" to "authenticated";

grant update on table "public"."bsi_statements" to "authenticated";

grant delete on table "public"."bsi_statements" to "service_role";

grant insert on table "public"."bsi_statements" to "service_role";

grant references on table "public"."bsi_statements" to "service_role";

grant select on table "public"."bsi_statements" to "service_role";

grant trigger on table "public"."bsi_statements" to "service_role";

grant truncate on table "public"."bsi_statements" to "service_role";

grant update on table "public"."bsi_statements" to "service_role";

grant delete on table "public"."bsi_transactions" to "anon";

grant insert on table "public"."bsi_transactions" to "anon";

grant references on table "public"."bsi_transactions" to "anon";

grant select on table "public"."bsi_transactions" to "anon";

grant trigger on table "public"."bsi_transactions" to "anon";

grant truncate on table "public"."bsi_transactions" to "anon";

grant update on table "public"."bsi_transactions" to "anon";

grant delete on table "public"."bsi_transactions" to "authenticated";

grant insert on table "public"."bsi_transactions" to "authenticated";

grant references on table "public"."bsi_transactions" to "authenticated";

grant select on table "public"."bsi_transactions" to "authenticated";

grant trigger on table "public"."bsi_transactions" to "authenticated";

grant truncate on table "public"."bsi_transactions" to "authenticated";

grant update on table "public"."bsi_transactions" to "authenticated";

grant delete on table "public"."bsi_transactions" to "service_role";

grant insert on table "public"."bsi_transactions" to "service_role";

grant references on table "public"."bsi_transactions" to "service_role";

grant select on table "public"."bsi_transactions" to "service_role";

grant trigger on table "public"."bsi_transactions" to "service_role";

grant truncate on table "public"."bsi_transactions" to "service_role";

grant update on table "public"."bsi_transactions" to "service_role";

grant delete on table "public"."bsi_transactions_references" to "anon";

grant insert on table "public"."bsi_transactions_references" to "anon";

grant references on table "public"."bsi_transactions_references" to "anon";

grant select on table "public"."bsi_transactions_references" to "anon";

grant trigger on table "public"."bsi_transactions_references" to "anon";

grant truncate on table "public"."bsi_transactions_references" to "anon";

grant update on table "public"."bsi_transactions_references" to "anon";

grant delete on table "public"."bsi_transactions_references" to "authenticated";

grant insert on table "public"."bsi_transactions_references" to "authenticated";

grant references on table "public"."bsi_transactions_references" to "authenticated";

grant select on table "public"."bsi_transactions_references" to "authenticated";

grant trigger on table "public"."bsi_transactions_references" to "authenticated";

grant truncate on table "public"."bsi_transactions_references" to "authenticated";

grant update on table "public"."bsi_transactions_references" to "authenticated";

grant delete on table "public"."bsi_transactions_references" to "service_role";

grant insert on table "public"."bsi_transactions_references" to "service_role";

grant references on table "public"."bsi_transactions_references" to "service_role";

grant select on table "public"."bsi_transactions_references" to "service_role";

grant trigger on table "public"."bsi_transactions_references" to "service_role";

grant truncate on table "public"."bsi_transactions_references" to "service_role";

grant update on table "public"."bsi_transactions_references" to "service_role";

grant delete on table "public"."cba_requests" to "anon";

grant insert on table "public"."cba_requests" to "anon";

grant references on table "public"."cba_requests" to "anon";

grant select on table "public"."cba_requests" to "anon";

grant trigger on table "public"."cba_requests" to "anon";

grant truncate on table "public"."cba_requests" to "anon";

grant update on table "public"."cba_requests" to "anon";

grant delete on table "public"."cba_requests" to "authenticated";

grant insert on table "public"."cba_requests" to "authenticated";

grant references on table "public"."cba_requests" to "authenticated";

grant select on table "public"."cba_requests" to "authenticated";

grant trigger on table "public"."cba_requests" to "authenticated";

grant truncate on table "public"."cba_requests" to "authenticated";

grant update on table "public"."cba_requests" to "authenticated";

grant delete on table "public"."cba_requests" to "service_role";

grant insert on table "public"."cba_requests" to "service_role";

grant references on table "public"."cba_requests" to "service_role";

grant select on table "public"."cba_requests" to "service_role";

grant trigger on table "public"."cba_requests" to "service_role";

grant truncate on table "public"."cba_requests" to "service_role";

grant update on table "public"."cba_requests" to "service_role";

grant delete on table "public"."cba_requests_guarantors" to "anon";

grant insert on table "public"."cba_requests_guarantors" to "anon";

grant references on table "public"."cba_requests_guarantors" to "anon";

grant select on table "public"."cba_requests_guarantors" to "anon";

grant trigger on table "public"."cba_requests_guarantors" to "anon";

grant truncate on table "public"."cba_requests_guarantors" to "anon";

grant update on table "public"."cba_requests_guarantors" to "anon";

grant delete on table "public"."cba_requests_guarantors" to "authenticated";

grant insert on table "public"."cba_requests_guarantors" to "authenticated";

grant references on table "public"."cba_requests_guarantors" to "authenticated";

grant select on table "public"."cba_requests_guarantors" to "authenticated";

grant trigger on table "public"."cba_requests_guarantors" to "authenticated";

grant truncate on table "public"."cba_requests_guarantors" to "authenticated";

grant update on table "public"."cba_requests_guarantors" to "authenticated";

grant delete on table "public"."cba_requests_guarantors" to "service_role";

grant insert on table "public"."cba_requests_guarantors" to "service_role";

grant references on table "public"."cba_requests_guarantors" to "service_role";

grant select on table "public"."cba_requests_guarantors" to "service_role";

grant trigger on table "public"."cba_requests_guarantors" to "service_role";

grant truncate on table "public"."cba_requests_guarantors" to "service_role";

grant update on table "public"."cba_requests_guarantors" to "service_role";

grant delete on table "public"."company" to "anon";

grant insert on table "public"."company" to "anon";

grant references on table "public"."company" to "anon";

grant select on table "public"."company" to "anon";

grant trigger on table "public"."company" to "anon";

grant truncate on table "public"."company" to "anon";

grant update on table "public"."company" to "anon";

grant delete on table "public"."company" to "authenticated";

grant insert on table "public"."company" to "authenticated";

grant references on table "public"."company" to "authenticated";

grant select on table "public"."company" to "authenticated";

grant trigger on table "public"."company" to "authenticated";

grant truncate on table "public"."company" to "authenticated";

grant update on table "public"."company" to "authenticated";

grant delete on table "public"."company" to "service_role";

grant insert on table "public"."company" to "service_role";

grant references on table "public"."company" to "service_role";

grant select on table "public"."company" to "service_role";

grant trigger on table "public"."company" to "service_role";

grant truncate on table "public"."company" to "service_role";

grant update on table "public"."company" to "service_role";

grant delete on table "public"."company_contact" to "anon";

grant insert on table "public"."company_contact" to "anon";

grant references on table "public"."company_contact" to "anon";

grant select on table "public"."company_contact" to "anon";

grant trigger on table "public"."company_contact" to "anon";

grant truncate on table "public"."company_contact" to "anon";

grant update on table "public"."company_contact" to "anon";

grant delete on table "public"."company_contact" to "authenticated";

grant insert on table "public"."company_contact" to "authenticated";

grant references on table "public"."company_contact" to "authenticated";

grant select on table "public"."company_contact" to "authenticated";

grant trigger on table "public"."company_contact" to "authenticated";

grant truncate on table "public"."company_contact" to "authenticated";

grant update on table "public"."company_contact" to "authenticated";

grant delete on table "public"."company_contact" to "service_role";

grant insert on table "public"."company_contact" to "service_role";

grant references on table "public"."company_contact" to "service_role";

grant select on table "public"."company_contact" to "service_role";

grant trigger on table "public"."company_contact" to "service_role";

grant truncate on table "public"."company_contact" to "service_role";

grant update on table "public"."company_contact" to "service_role";

grant delete on table "public"."company_member" to "anon";

grant insert on table "public"."company_member" to "anon";

grant references on table "public"."company_member" to "anon";

grant select on table "public"."company_member" to "anon";

grant trigger on table "public"."company_member" to "anon";

grant truncate on table "public"."company_member" to "anon";

grant update on table "public"."company_member" to "anon";

grant delete on table "public"."company_member" to "authenticated";

grant insert on table "public"."company_member" to "authenticated";

grant references on table "public"."company_member" to "authenticated";

grant select on table "public"."company_member" to "authenticated";

grant trigger on table "public"."company_member" to "authenticated";

grant truncate on table "public"."company_member" to "authenticated";

grant update on table "public"."company_member" to "authenticated";

grant delete on table "public"."company_member" to "service_role";

grant insert on table "public"."company_member" to "service_role";

grant references on table "public"."company_member" to "service_role";

grant select on table "public"."company_member" to "service_role";

grant trigger on table "public"."company_member" to "service_role";

grant truncate on table "public"."company_member" to "service_role";

grant update on table "public"."company_member" to "service_role";

grant delete on table "public"."company_roles" to "anon";

grant insert on table "public"."company_roles" to "anon";

grant references on table "public"."company_roles" to "anon";

grant select on table "public"."company_roles" to "anon";

grant trigger on table "public"."company_roles" to "anon";

grant truncate on table "public"."company_roles" to "anon";

grant update on table "public"."company_roles" to "anon";

grant delete on table "public"."company_roles" to "authenticated";

grant insert on table "public"."company_roles" to "authenticated";

grant references on table "public"."company_roles" to "authenticated";

grant select on table "public"."company_roles" to "authenticated";

grant trigger on table "public"."company_roles" to "authenticated";

grant truncate on table "public"."company_roles" to "authenticated";

grant update on table "public"."company_roles" to "authenticated";

grant delete on table "public"."company_roles" to "service_role";

grant insert on table "public"."company_roles" to "service_role";

grant references on table "public"."company_roles" to "service_role";

grant select on table "public"."company_roles" to "service_role";

grant trigger on table "public"."company_roles" to "service_role";

grant truncate on table "public"."company_roles" to "service_role";

grant update on table "public"."company_roles" to "service_role";

grant delete on table "public"."company_roles_defined" to "anon";

grant insert on table "public"."company_roles_defined" to "anon";

grant references on table "public"."company_roles_defined" to "anon";

grant select on table "public"."company_roles_defined" to "anon";

grant trigger on table "public"."company_roles_defined" to "anon";

grant truncate on table "public"."company_roles_defined" to "anon";

grant update on table "public"."company_roles_defined" to "anon";

grant delete on table "public"."company_roles_defined" to "authenticated";

grant insert on table "public"."company_roles_defined" to "authenticated";

grant references on table "public"."company_roles_defined" to "authenticated";

grant select on table "public"."company_roles_defined" to "authenticated";

grant trigger on table "public"."company_roles_defined" to "authenticated";

grant truncate on table "public"."company_roles_defined" to "authenticated";

grant update on table "public"."company_roles_defined" to "authenticated";

grant delete on table "public"."company_roles_defined" to "service_role";

grant insert on table "public"."company_roles_defined" to "service_role";

grant references on table "public"."company_roles_defined" to "service_role";

grant select on table "public"."company_roles_defined" to "service_role";

grant trigger on table "public"."company_roles_defined" to "service_role";

grant truncate on table "public"."company_roles_defined" to "service_role";

grant delete on table "public"."constants" to "anon";

grant insert on table "public"."constants" to "anon";

grant references on table "public"."constants" to "anon";

grant select on table "public"."constants" to "anon";

grant trigger on table "public"."constants" to "anon";

grant truncate on table "public"."constants" to "anon";

grant update on table "public"."constants" to "anon";

grant delete on table "public"."constants" to "authenticated";

grant insert on table "public"."constants" to "authenticated";

grant references on table "public"."constants" to "authenticated";

grant select on table "public"."constants" to "authenticated";

grant trigger on table "public"."constants" to "authenticated";

grant truncate on table "public"."constants" to "authenticated";

grant update on table "public"."constants" to "authenticated";

grant delete on table "public"."constants" to "service_role";

grant insert on table "public"."constants" to "service_role";

grant references on table "public"."constants" to "service_role";

grant select on table "public"."constants" to "service_role";

grant trigger on table "public"."constants" to "service_role";

grant truncate on table "public"."constants" to "service_role";

grant update on table "public"."constants" to "service_role";

grant delete on table "public"."contact" to "anon";

grant insert on table "public"."contact" to "anon";

grant references on table "public"."contact" to "anon";

grant select on table "public"."contact" to "anon";

grant trigger on table "public"."contact" to "anon";

grant truncate on table "public"."contact" to "anon";

grant update on table "public"."contact" to "anon";

grant delete on table "public"."contact" to "authenticated";

grant insert on table "public"."contact" to "authenticated";

grant references on table "public"."contact" to "authenticated";

grant select on table "public"."contact" to "authenticated";

grant trigger on table "public"."contact" to "authenticated";

grant truncate on table "public"."contact" to "authenticated";

grant update on table "public"."contact" to "authenticated";

grant delete on table "public"."contact" to "service_role";

grant insert on table "public"."contact" to "service_role";

grant references on table "public"."contact" to "service_role";

grant select on table "public"."contact" to "service_role";

grant trigger on table "public"."contact" to "service_role";

grant truncate on table "public"."contact" to "service_role";

grant update on table "public"."contact" to "service_role";

grant delete on table "public"."contact_types" to "anon";

grant insert on table "public"."contact_types" to "anon";

grant references on table "public"."contact_types" to "anon";

grant select on table "public"."contact_types" to "anon";

grant trigger on table "public"."contact_types" to "anon";

grant truncate on table "public"."contact_types" to "anon";

grant update on table "public"."contact_types" to "anon";

grant delete on table "public"."contact_types" to "authenticated";

grant insert on table "public"."contact_types" to "authenticated";

grant references on table "public"."contact_types" to "authenticated";

grant select on table "public"."contact_types" to "authenticated";

grant trigger on table "public"."contact_types" to "authenticated";

grant truncate on table "public"."contact_types" to "authenticated";

grant update on table "public"."contact_types" to "authenticated";

grant delete on table "public"."contact_types" to "service_role";

grant insert on table "public"."contact_types" to "service_role";

grant references on table "public"."contact_types" to "service_role";

grant select on table "public"."contact_types" to "service_role";

grant trigger on table "public"."contact_types" to "service_role";

grant truncate on table "public"."contact_types" to "service_role";

grant update on table "public"."contact_types" to "service_role";

grant delete on table "public"."contact_types_jt" to "anon";

grant insert on table "public"."contact_types_jt" to "anon";

grant references on table "public"."contact_types_jt" to "anon";

grant select on table "public"."contact_types_jt" to "anon";

grant trigger on table "public"."contact_types_jt" to "anon";

grant truncate on table "public"."contact_types_jt" to "anon";

grant update on table "public"."contact_types_jt" to "anon";

grant delete on table "public"."contact_types_jt" to "authenticated";

grant insert on table "public"."contact_types_jt" to "authenticated";

grant references on table "public"."contact_types_jt" to "authenticated";

grant select on table "public"."contact_types_jt" to "authenticated";

grant trigger on table "public"."contact_types_jt" to "authenticated";

grant truncate on table "public"."contact_types_jt" to "authenticated";

grant update on table "public"."contact_types_jt" to "authenticated";

grant delete on table "public"."contact_types_jt" to "service_role";

grant insert on table "public"."contact_types_jt" to "service_role";

grant references on table "public"."contact_types_jt" to "service_role";

grant select on table "public"."contact_types_jt" to "service_role";

grant trigger on table "public"."contact_types_jt" to "service_role";

grant truncate on table "public"."contact_types_jt" to "service_role";

grant update on table "public"."contact_types_jt" to "service_role";

grant delete on table "public"."countries" to "anon";

grant insert on table "public"."countries" to "anon";

grant references on table "public"."countries" to "anon";

grant select on table "public"."countries" to "anon";

grant trigger on table "public"."countries" to "anon";

grant truncate on table "public"."countries" to "anon";

grant update on table "public"."countries" to "anon";

grant delete on table "public"."countries" to "authenticated";

grant insert on table "public"."countries" to "authenticated";

grant references on table "public"."countries" to "authenticated";

grant select on table "public"."countries" to "authenticated";

grant trigger on table "public"."countries" to "authenticated";

grant truncate on table "public"."countries" to "authenticated";

grant update on table "public"."countries" to "authenticated";

grant delete on table "public"."countries" to "service_role";

grant insert on table "public"."countries" to "service_role";

grant references on table "public"."countries" to "service_role";

grant select on table "public"."countries" to "service_role";

grant trigger on table "public"."countries" to "service_role";

grant truncate on table "public"."countries" to "service_role";

grant delete on table "public"."custom_loan_fees" to "anon";

grant insert on table "public"."custom_loan_fees" to "anon";

grant references on table "public"."custom_loan_fees" to "anon";

grant select on table "public"."custom_loan_fees" to "anon";

grant trigger on table "public"."custom_loan_fees" to "anon";

grant truncate on table "public"."custom_loan_fees" to "anon";

grant update on table "public"."custom_loan_fees" to "anon";

grant delete on table "public"."custom_loan_fees" to "authenticated";

grant insert on table "public"."custom_loan_fees" to "authenticated";

grant references on table "public"."custom_loan_fees" to "authenticated";

grant select on table "public"."custom_loan_fees" to "authenticated";

grant trigger on table "public"."custom_loan_fees" to "authenticated";

grant truncate on table "public"."custom_loan_fees" to "authenticated";

grant update on table "public"."custom_loan_fees" to "authenticated";

grant delete on table "public"."custom_loan_fees" to "service_role";

grant insert on table "public"."custom_loan_fees" to "service_role";

grant references on table "public"."custom_loan_fees" to "service_role";

grant select on table "public"."custom_loan_fees" to "service_role";

grant trigger on table "public"."custom_loan_fees" to "service_role";

grant truncate on table "public"."custom_loan_fees" to "service_role";

grant update on table "public"."custom_loan_fees" to "service_role";

grant delete on table "public"."deal" to "anon";

grant insert on table "public"."deal" to "anon";

grant references on table "public"."deal" to "anon";

grant select on table "public"."deal" to "anon";

grant trigger on table "public"."deal" to "anon";

grant truncate on table "public"."deal" to "anon";

grant update on table "public"."deal" to "anon";

grant delete on table "public"."deal" to "authenticated";

grant insert on table "public"."deal" to "authenticated";

grant references on table "public"."deal" to "authenticated";

grant select on table "public"."deal" to "authenticated";

grant trigger on table "public"."deal" to "authenticated";

grant truncate on table "public"."deal" to "authenticated";

grant update on table "public"."deal" to "authenticated";

grant delete on table "public"."deal" to "service_role";

grant insert on table "public"."deal" to "service_role";

grant references on table "public"."deal" to "service_role";

grant select on table "public"."deal" to "service_role";

grant trigger on table "public"."deal" to "service_role";

grant truncate on table "public"."deal" to "service_role";

grant update on table "public"."deal" to "service_role";

grant delete on table "public"."deal_appraisals" to "anon";

grant insert on table "public"."deal_appraisals" to "anon";

grant references on table "public"."deal_appraisals" to "anon";

grant select on table "public"."deal_appraisals" to "anon";

grant trigger on table "public"."deal_appraisals" to "anon";

grant truncate on table "public"."deal_appraisals" to "anon";

grant update on table "public"."deal_appraisals" to "anon";

grant delete on table "public"."deal_appraisals" to "authenticated";

grant insert on table "public"."deal_appraisals" to "authenticated";

grant references on table "public"."deal_appraisals" to "authenticated";

grant select on table "public"."deal_appraisals" to "authenticated";

grant trigger on table "public"."deal_appraisals" to "authenticated";

grant truncate on table "public"."deal_appraisals" to "authenticated";

grant update on table "public"."deal_appraisals" to "authenticated";

grant delete on table "public"."deal_appraisals" to "service_role";

grant insert on table "public"."deal_appraisals" to "service_role";

grant references on table "public"."deal_appraisals" to "service_role";

grant select on table "public"."deal_appraisals" to "service_role";

grant trigger on table "public"."deal_appraisals" to "service_role";

grant truncate on table "public"."deal_appraisals" to "service_role";

grant update on table "public"."deal_appraisals" to "service_role";

grant delete on table "public"."deal_property" to "anon";

grant insert on table "public"."deal_property" to "anon";

grant references on table "public"."deal_property" to "anon";

grant select on table "public"."deal_property" to "anon";

grant trigger on table "public"."deal_property" to "anon";

grant truncate on table "public"."deal_property" to "anon";

grant update on table "public"."deal_property" to "anon";

grant delete on table "public"."deal_property" to "authenticated";

grant insert on table "public"."deal_property" to "authenticated";

grant references on table "public"."deal_property" to "authenticated";

grant select on table "public"."deal_property" to "authenticated";

grant trigger on table "public"."deal_property" to "authenticated";

grant truncate on table "public"."deal_property" to "authenticated";

grant update on table "public"."deal_property" to "authenticated";

grant delete on table "public"."deal_property" to "service_role";

grant insert on table "public"."deal_property" to "service_role";

grant references on table "public"."deal_property" to "service_role";

grant select on table "public"."deal_property" to "service_role";

grant trigger on table "public"."deal_property" to "service_role";

grant truncate on table "public"."deal_property" to "service_role";

grant update on table "public"."deal_property" to "service_role";

grant delete on table "public"."deal_roles" to "anon";

grant insert on table "public"."deal_roles" to "anon";

grant references on table "public"."deal_roles" to "anon";

grant select on table "public"."deal_roles" to "anon";

grant trigger on table "public"."deal_roles" to "anon";

grant truncate on table "public"."deal_roles" to "anon";

grant update on table "public"."deal_roles" to "anon";

grant delete on table "public"."deal_roles" to "authenticated";

grant insert on table "public"."deal_roles" to "authenticated";

grant references on table "public"."deal_roles" to "authenticated";

grant select on table "public"."deal_roles" to "authenticated";

grant trigger on table "public"."deal_roles" to "authenticated";

grant truncate on table "public"."deal_roles" to "authenticated";

grant update on table "public"."deal_roles" to "authenticated";

grant delete on table "public"."deal_roles" to "service_role";

grant insert on table "public"."deal_roles" to "service_role";

grant references on table "public"."deal_roles" to "service_role";

grant select on table "public"."deal_roles" to "service_role";

grant trigger on table "public"."deal_roles" to "service_role";

grant truncate on table "public"."deal_roles" to "service_role";

grant update on table "public"."deal_roles" to "service_role";

grant delete on table "public"."document_files" to "anon";

grant insert on table "public"."document_files" to "anon";

grant references on table "public"."document_files" to "anon";

grant select on table "public"."document_files" to "anon";

grant trigger on table "public"."document_files" to "anon";

grant truncate on table "public"."document_files" to "anon";

grant update on table "public"."document_files" to "anon";

grant delete on table "public"."document_files" to "authenticated";

grant insert on table "public"."document_files" to "authenticated";

grant references on table "public"."document_files" to "authenticated";

grant select on table "public"."document_files" to "authenticated";

grant trigger on table "public"."document_files" to "authenticated";

grant truncate on table "public"."document_files" to "authenticated";

grant update on table "public"."document_files" to "authenticated";

grant delete on table "public"."document_files" to "service_role";

grant insert on table "public"."document_files" to "service_role";

grant references on table "public"."document_files" to "service_role";

grant select on table "public"."document_files" to "service_role";

grant trigger on table "public"."document_files" to "service_role";

grant truncate on table "public"."document_files" to "service_role";

grant update on table "public"."document_files" to "service_role";

grant delete on table "public"."document_roles" to "anon";

grant insert on table "public"."document_roles" to "anon";

grant references on table "public"."document_roles" to "anon";

grant select on table "public"."document_roles" to "anon";

grant trigger on table "public"."document_roles" to "anon";

grant truncate on table "public"."document_roles" to "anon";

grant update on table "public"."document_roles" to "anon";

grant delete on table "public"."document_roles" to "authenticated";

grant insert on table "public"."document_roles" to "authenticated";

grant references on table "public"."document_roles" to "authenticated";

grant select on table "public"."document_roles" to "authenticated";

grant trigger on table "public"."document_roles" to "authenticated";

grant truncate on table "public"."document_roles" to "authenticated";

grant update on table "public"."document_roles" to "authenticated";

grant delete on table "public"."document_roles" to "service_role";

grant insert on table "public"."document_roles" to "service_role";

grant references on table "public"."document_roles" to "service_role";

grant select on table "public"."document_roles" to "service_role";

grant trigger on table "public"."document_roles" to "service_role";

grant truncate on table "public"."document_roles" to "service_role";

grant update on table "public"."document_roles" to "service_role";

grant delete on table "public"."document_roles_assigned" to "anon";

grant insert on table "public"."document_roles_assigned" to "anon";

grant references on table "public"."document_roles_assigned" to "anon";

grant select on table "public"."document_roles_assigned" to "anon";

grant trigger on table "public"."document_roles_assigned" to "anon";

grant truncate on table "public"."document_roles_assigned" to "anon";

grant update on table "public"."document_roles_assigned" to "anon";

grant delete on table "public"."document_roles_assigned" to "authenticated";

grant insert on table "public"."document_roles_assigned" to "authenticated";

grant references on table "public"."document_roles_assigned" to "authenticated";

grant select on table "public"."document_roles_assigned" to "authenticated";

grant trigger on table "public"."document_roles_assigned" to "authenticated";

grant truncate on table "public"."document_roles_assigned" to "authenticated";

grant update on table "public"."document_roles_assigned" to "authenticated";

grant delete on table "public"."document_roles_assigned" to "service_role";

grant insert on table "public"."document_roles_assigned" to "service_role";

grant references on table "public"."document_roles_assigned" to "service_role";

grant select on table "public"."document_roles_assigned" to "service_role";

grant trigger on table "public"."document_roles_assigned" to "service_role";

grant truncate on table "public"."document_roles_assigned" to "service_role";

grant update on table "public"."document_roles_assigned" to "service_role";

grant delete on table "public"."fee" to "anon";

grant insert on table "public"."fee" to "anon";

grant references on table "public"."fee" to "anon";

grant select on table "public"."fee" to "anon";

grant trigger on table "public"."fee" to "anon";

grant truncate on table "public"."fee" to "anon";

grant update on table "public"."fee" to "anon";

grant delete on table "public"."fee" to "authenticated";

grant insert on table "public"."fee" to "authenticated";

grant references on table "public"."fee" to "authenticated";

grant select on table "public"."fee" to "authenticated";

grant trigger on table "public"."fee" to "authenticated";

grant truncate on table "public"."fee" to "authenticated";

grant update on table "public"."fee" to "authenticated";

grant delete on table "public"."fee" to "service_role";

grant insert on table "public"."fee" to "service_role";

grant references on table "public"."fee" to "service_role";

grant select on table "public"."fee" to "service_role";

grant trigger on table "public"."fee" to "service_role";

grant truncate on table "public"."fee" to "service_role";

grant update on table "public"."fee" to "service_role";

grant delete on table "public"."guarantor" to "anon";

grant insert on table "public"."guarantor" to "anon";

grant references on table "public"."guarantor" to "anon";

grant select on table "public"."guarantor" to "anon";

grant trigger on table "public"."guarantor" to "anon";

grant truncate on table "public"."guarantor" to "anon";

grant update on table "public"."guarantor" to "anon";

grant delete on table "public"."guarantor" to "authenticated";

grant insert on table "public"."guarantor" to "authenticated";

grant references on table "public"."guarantor" to "authenticated";

grant select on table "public"."guarantor" to "authenticated";

grant trigger on table "public"."guarantor" to "authenticated";

grant truncate on table "public"."guarantor" to "authenticated";

grant update on table "public"."guarantor" to "authenticated";

grant delete on table "public"."guarantor" to "service_role";

grant insert on table "public"."guarantor" to "service_role";

grant references on table "public"."guarantor" to "service_role";

grant select on table "public"."guarantor" to "service_role";

grant trigger on table "public"."guarantor" to "service_role";

grant truncate on table "public"."guarantor" to "service_role";

grant update on table "public"."guarantor" to "service_role";

grant delete on table "public"."loan_application" to "anon";

grant insert on table "public"."loan_application" to "anon";

grant references on table "public"."loan_application" to "anon";

grant select on table "public"."loan_application" to "anon";

grant trigger on table "public"."loan_application" to "anon";

grant truncate on table "public"."loan_application" to "anon";

grant update on table "public"."loan_application" to "anon";

grant delete on table "public"."loan_application" to "authenticated";

grant insert on table "public"."loan_application" to "authenticated";

grant references on table "public"."loan_application" to "authenticated";

grant select on table "public"."loan_application" to "authenticated";

grant trigger on table "public"."loan_application" to "authenticated";

grant truncate on table "public"."loan_application" to "authenticated";

grant update on table "public"."loan_application" to "authenticated";

grant delete on table "public"."loan_application" to "service_role";

grant insert on table "public"."loan_application" to "service_role";

grant references on table "public"."loan_application" to "service_role";

grant select on table "public"."loan_application" to "service_role";

grant trigger on table "public"."loan_application" to "service_role";

grant truncate on table "public"."loan_application" to "service_role";

grant update on table "public"."loan_application" to "service_role";

grant delete on table "public"."loan_price" to "anon";

grant insert on table "public"."loan_price" to "anon";

grant references on table "public"."loan_price" to "anon";

grant select on table "public"."loan_price" to "anon";

grant trigger on table "public"."loan_price" to "anon";

grant truncate on table "public"."loan_price" to "anon";

grant update on table "public"."loan_price" to "anon";

grant delete on table "public"."loan_price" to "authenticated";

grant insert on table "public"."loan_price" to "authenticated";

grant references on table "public"."loan_price" to "authenticated";

grant select on table "public"."loan_price" to "authenticated";

grant trigger on table "public"."loan_price" to "authenticated";

grant truncate on table "public"."loan_price" to "authenticated";

grant update on table "public"."loan_price" to "authenticated";

grant delete on table "public"."loan_price" to "service_role";

grant insert on table "public"."loan_price" to "service_role";

grant references on table "public"."loan_price" to "service_role";

grant select on table "public"."loan_price" to "service_role";

grant trigger on table "public"."loan_price" to "service_role";

grant truncate on table "public"."loan_price" to "service_role";

grant update on table "public"."loan_price" to "service_role";

grant delete on table "public"."loan_price_saved" to "anon";

grant insert on table "public"."loan_price_saved" to "anon";

grant references on table "public"."loan_price_saved" to "anon";

grant select on table "public"."loan_price_saved" to "anon";

grant trigger on table "public"."loan_price_saved" to "anon";

grant truncate on table "public"."loan_price_saved" to "anon";

grant update on table "public"."loan_price_saved" to "anon";

grant delete on table "public"."loan_price_saved" to "authenticated";

grant insert on table "public"."loan_price_saved" to "authenticated";

grant references on table "public"."loan_price_saved" to "authenticated";

grant select on table "public"."loan_price_saved" to "authenticated";

grant trigger on table "public"."loan_price_saved" to "authenticated";

grant truncate on table "public"."loan_price_saved" to "authenticated";

grant update on table "public"."loan_price_saved" to "authenticated";

grant delete on table "public"."loan_price_saved" to "service_role";

grant insert on table "public"."loan_price_saved" to "service_role";

grant references on table "public"."loan_price_saved" to "service_role";

grant select on table "public"."loan_price_saved" to "service_role";

grant trigger on table "public"."loan_price_saved" to "service_role";

grant truncate on table "public"."loan_price_saved" to "service_role";

grant update on table "public"."loan_price_saved" to "service_role";

grant delete on table "public"."loan_program_a" to "anon";

grant insert on table "public"."loan_program_a" to "anon";

grant references on table "public"."loan_program_a" to "anon";

grant select on table "public"."loan_program_a" to "anon";

grant trigger on table "public"."loan_program_a" to "anon";

grant truncate on table "public"."loan_program_a" to "anon";

grant update on table "public"."loan_program_a" to "anon";

grant delete on table "public"."loan_program_a" to "authenticated";

grant insert on table "public"."loan_program_a" to "authenticated";

grant references on table "public"."loan_program_a" to "authenticated";

grant select on table "public"."loan_program_a" to "authenticated";

grant trigger on table "public"."loan_program_a" to "authenticated";

grant truncate on table "public"."loan_program_a" to "authenticated";

grant update on table "public"."loan_program_a" to "authenticated";

grant delete on table "public"."loan_program_a" to "service_role";

grant insert on table "public"."loan_program_a" to "service_role";

grant references on table "public"."loan_program_a" to "service_role";

grant select on table "public"."loan_program_a" to "service_role";

grant trigger on table "public"."loan_program_a" to "service_role";

grant truncate on table "public"."loan_program_a" to "service_role";

grant update on table "public"."loan_program_a" to "service_role";

grant delete on table "public"."loan_program_b" to "anon";

grant insert on table "public"."loan_program_b" to "anon";

grant references on table "public"."loan_program_b" to "anon";

grant select on table "public"."loan_program_b" to "anon";

grant trigger on table "public"."loan_program_b" to "anon";

grant truncate on table "public"."loan_program_b" to "anon";

grant update on table "public"."loan_program_b" to "anon";

grant delete on table "public"."loan_program_b" to "authenticated";

grant insert on table "public"."loan_program_b" to "authenticated";

grant references on table "public"."loan_program_b" to "authenticated";

grant select on table "public"."loan_program_b" to "authenticated";

grant trigger on table "public"."loan_program_b" to "authenticated";

grant truncate on table "public"."loan_program_b" to "authenticated";

grant update on table "public"."loan_program_b" to "authenticated";

grant delete on table "public"."loan_program_b" to "service_role";

grant insert on table "public"."loan_program_b" to "service_role";

grant references on table "public"."loan_program_b" to "service_role";

grant select on table "public"."loan_program_b" to "service_role";

grant trigger on table "public"."loan_program_b" to "service_role";

grant truncate on table "public"."loan_program_b" to "service_role";

grant update on table "public"."loan_program_b" to "service_role";

grant delete on table "public"."ltv_band" to "anon";

grant insert on table "public"."ltv_band" to "anon";

grant references on table "public"."ltv_band" to "anon";

grant select on table "public"."ltv_band" to "anon";

grant trigger on table "public"."ltv_band" to "anon";

grant truncate on table "public"."ltv_band" to "anon";

grant update on table "public"."ltv_band" to "anon";

grant delete on table "public"."ltv_band" to "authenticated";

grant insert on table "public"."ltv_band" to "authenticated";

grant references on table "public"."ltv_band" to "authenticated";

grant select on table "public"."ltv_band" to "authenticated";

grant trigger on table "public"."ltv_band" to "authenticated";

grant truncate on table "public"."ltv_band" to "authenticated";

grant update on table "public"."ltv_band" to "authenticated";

grant delete on table "public"."ltv_band" to "service_role";

grant insert on table "public"."ltv_band" to "service_role";

grant references on table "public"."ltv_band" to "service_role";

grant select on table "public"."ltv_band" to "service_role";

grant trigger on table "public"."ltv_band" to "service_role";

grant truncate on table "public"."ltv_band" to "service_role";

grant update on table "public"."ltv_band" to "service_role";

grant delete on table "public"."max_ltv" to "anon";

grant insert on table "public"."max_ltv" to "anon";

grant references on table "public"."max_ltv" to "anon";

grant select on table "public"."max_ltv" to "anon";

grant trigger on table "public"."max_ltv" to "anon";

grant truncate on table "public"."max_ltv" to "anon";

grant update on table "public"."max_ltv" to "anon";

grant delete on table "public"."max_ltv" to "authenticated";

grant insert on table "public"."max_ltv" to "authenticated";

grant references on table "public"."max_ltv" to "authenticated";

grant select on table "public"."max_ltv" to "authenticated";

grant trigger on table "public"."max_ltv" to "authenticated";

grant truncate on table "public"."max_ltv" to "authenticated";

grant update on table "public"."max_ltv" to "authenticated";

grant delete on table "public"."max_ltv" to "service_role";

grant insert on table "public"."max_ltv" to "service_role";

grant references on table "public"."max_ltv" to "service_role";

grant select on table "public"."max_ltv" to "service_role";

grant trigger on table "public"."max_ltv" to "service_role";

grant truncate on table "public"."max_ltv" to "service_role";

grant update on table "public"."max_ltv" to "service_role";

grant delete on table "public"."milestone_templates" to "anon";

grant insert on table "public"."milestone_templates" to "anon";

grant references on table "public"."milestone_templates" to "anon";

grant select on table "public"."milestone_templates" to "anon";

grant trigger on table "public"."milestone_templates" to "anon";

grant truncate on table "public"."milestone_templates" to "anon";

grant update on table "public"."milestone_templates" to "anon";

grant delete on table "public"."milestone_templates" to "authenticated";

grant insert on table "public"."milestone_templates" to "authenticated";

grant references on table "public"."milestone_templates" to "authenticated";

grant select on table "public"."milestone_templates" to "authenticated";

grant trigger on table "public"."milestone_templates" to "authenticated";

grant truncate on table "public"."milestone_templates" to "authenticated";

grant update on table "public"."milestone_templates" to "authenticated";

grant delete on table "public"."milestone_templates" to "service_role";

grant insert on table "public"."milestone_templates" to "service_role";

grant references on table "public"."milestone_templates" to "service_role";

grant select on table "public"."milestone_templates" to "service_role";

grant trigger on table "public"."milestone_templates" to "service_role";

grant truncate on table "public"."milestone_templates" to "service_role";

grant update on table "public"."milestone_templates" to "service_role";

grant delete on table "public"."milestones" to "anon";

grant insert on table "public"."milestones" to "anon";

grant references on table "public"."milestones" to "anon";

grant select on table "public"."milestones" to "anon";

grant trigger on table "public"."milestones" to "anon";

grant truncate on table "public"."milestones" to "anon";

grant update on table "public"."milestones" to "anon";

grant delete on table "public"."milestones" to "authenticated";

grant insert on table "public"."milestones" to "authenticated";

grant references on table "public"."milestones" to "authenticated";

grant select on table "public"."milestones" to "authenticated";

grant trigger on table "public"."milestones" to "authenticated";

grant truncate on table "public"."milestones" to "authenticated";

grant update on table "public"."milestones" to "authenticated";

grant delete on table "public"."milestones" to "service_role";

grant insert on table "public"."milestones" to "service_role";

grant references on table "public"."milestones" to "service_role";

grant select on table "public"."milestones" to "service_role";

grant trigger on table "public"."milestones" to "service_role";

grant truncate on table "public"."milestones" to "service_role";

grant update on table "public"."milestones" to "service_role";

grant delete on table "public"."payroll_submission" to "anon";

grant insert on table "public"."payroll_submission" to "anon";

grant references on table "public"."payroll_submission" to "anon";

grant select on table "public"."payroll_submission" to "anon";

grant trigger on table "public"."payroll_submission" to "anon";

grant truncate on table "public"."payroll_submission" to "anon";

grant update on table "public"."payroll_submission" to "anon";

grant delete on table "public"."payroll_submission" to "authenticated";

grant insert on table "public"."payroll_submission" to "authenticated";

grant references on table "public"."payroll_submission" to "authenticated";

grant select on table "public"."payroll_submission" to "authenticated";

grant trigger on table "public"."payroll_submission" to "authenticated";

grant truncate on table "public"."payroll_submission" to "authenticated";

grant update on table "public"."payroll_submission" to "authenticated";

grant delete on table "public"."payroll_submission" to "service_role";

grant insert on table "public"."payroll_submission" to "service_role";

grant references on table "public"."payroll_submission" to "service_role";

grant select on table "public"."payroll_submission" to "service_role";

grant trigger on table "public"."payroll_submission" to "service_role";

grant truncate on table "public"."payroll_submission" to "service_role";

grant update on table "public"."payroll_submission" to "service_role";

grant delete on table "public"."payroll_submission_fees_1099" to "anon";

grant insert on table "public"."payroll_submission_fees_1099" to "anon";

grant references on table "public"."payroll_submission_fees_1099" to "anon";

grant select on table "public"."payroll_submission_fees_1099" to "anon";

grant trigger on table "public"."payroll_submission_fees_1099" to "anon";

grant truncate on table "public"."payroll_submission_fees_1099" to "anon";

grant update on table "public"."payroll_submission_fees_1099" to "anon";

grant delete on table "public"."payroll_submission_fees_1099" to "authenticated";

grant insert on table "public"."payroll_submission_fees_1099" to "authenticated";

grant references on table "public"."payroll_submission_fees_1099" to "authenticated";

grant select on table "public"."payroll_submission_fees_1099" to "authenticated";

grant trigger on table "public"."payroll_submission_fees_1099" to "authenticated";

grant truncate on table "public"."payroll_submission_fees_1099" to "authenticated";

grant update on table "public"."payroll_submission_fees_1099" to "authenticated";

grant delete on table "public"."payroll_submission_fees_1099" to "service_role";

grant insert on table "public"."payroll_submission_fees_1099" to "service_role";

grant references on table "public"."payroll_submission_fees_1099" to "service_role";

grant select on table "public"."payroll_submission_fees_1099" to "service_role";

grant trigger on table "public"."payroll_submission_fees_1099" to "service_role";

grant truncate on table "public"."payroll_submission_fees_1099" to "service_role";

grant update on table "public"."payroll_submission_fees_1099" to "service_role";

grant delete on table "public"."property" to "anon";

grant insert on table "public"."property" to "anon";

grant references on table "public"."property" to "anon";

grant select on table "public"."property" to "anon";

grant trigger on table "public"."property" to "anon";

grant truncate on table "public"."property" to "anon";

grant update on table "public"."property" to "anon";

grant delete on table "public"."property" to "authenticated";

grant insert on table "public"."property" to "authenticated";

grant references on table "public"."property" to "authenticated";

grant select on table "public"."property" to "authenticated";

grant trigger on table "public"."property" to "authenticated";

grant truncate on table "public"."property" to "authenticated";

grant update on table "public"."property" to "authenticated";

grant delete on table "public"."property" to "service_role";

grant insert on table "public"."property" to "service_role";

grant references on table "public"."property" to "service_role";

grant select on table "public"."property" to "service_role";

grant trigger on table "public"."property" to "service_role";

grant truncate on table "public"."property" to "service_role";

grant update on table "public"."property" to "service_role";

grant delete on table "public"."property_income" to "anon";

grant insert on table "public"."property_income" to "anon";

grant references on table "public"."property_income" to "anon";

grant select on table "public"."property_income" to "anon";

grant trigger on table "public"."property_income" to "anon";

grant truncate on table "public"."property_income" to "anon";

grant update on table "public"."property_income" to "anon";

grant delete on table "public"."property_income" to "authenticated";

grant insert on table "public"."property_income" to "authenticated";

grant references on table "public"."property_income" to "authenticated";

grant select on table "public"."property_income" to "authenticated";

grant trigger on table "public"."property_income" to "authenticated";

grant truncate on table "public"."property_income" to "authenticated";

grant update on table "public"."property_income" to "authenticated";

grant delete on table "public"."property_income" to "service_role";

grant insert on table "public"."property_income" to "service_role";

grant references on table "public"."property_income" to "service_role";

grant select on table "public"."property_income" to "service_role";

grant trigger on table "public"."property_income" to "service_role";

grant truncate on table "public"."property_income" to "service_role";

grant update on table "public"."property_income" to "service_role";

grant delete on table "public"."property_reapi" to "anon";

grant insert on table "public"."property_reapi" to "anon";

grant references on table "public"."property_reapi" to "anon";

grant select on table "public"."property_reapi" to "anon";

grant trigger on table "public"."property_reapi" to "anon";

grant truncate on table "public"."property_reapi" to "anon";

grant update on table "public"."property_reapi" to "anon";

grant delete on table "public"."property_reapi" to "authenticated";

grant insert on table "public"."property_reapi" to "authenticated";

grant references on table "public"."property_reapi" to "authenticated";

grant select on table "public"."property_reapi" to "authenticated";

grant trigger on table "public"."property_reapi" to "authenticated";

grant truncate on table "public"."property_reapi" to "authenticated";

grant update on table "public"."property_reapi" to "authenticated";

grant delete on table "public"."property_reapi" to "service_role";

grant insert on table "public"."property_reapi" to "service_role";

grant references on table "public"."property_reapi" to "service_role";

grant select on table "public"."property_reapi" to "service_role";

grant trigger on table "public"."property_reapi" to "service_role";

grant truncate on table "public"."property_reapi" to "service_role";
