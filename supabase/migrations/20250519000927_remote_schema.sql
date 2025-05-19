create extension if not exists "pg_cron" with schema "extensions";


create type "public"."document_role" as enum ('Loan Officer', 'Loan Opener', 'Processor', 'Broker', 'Borrower', 'Borrower/Broker', 'Processor/Broker');

create type "public"."fee_type" as enum ('lender_fee', 'broker_fee', 'appraisal_fee', 'title_fee', 'property_tax_-_city/town', 'property_tax_-_county', 'property_tax_-_school', 'lender_holdback', 'lender_reserve', 'insurance _premium', 'credit_and_background_fee', 'judgment', 'lien', 'recording_and_transfer_fee', 'transfer_tax', 'lender_escrow');

create type "public"."user_role_internal" as enum ('admin', 'account_executive', 'loan_processor', 'balance_sheet_investor', 'loan_opener');

drop trigger if exists "created_update_expiration" on "public"."appraisal";

drop trigger if exists "handle_borrower_state_trigger" on "public"."borrower";

drop trigger if exists "add_milestone_templates_to_deal" on "public"."deal";

drop trigger if exists "before_deal_change_trigger" on "public"."deal";

drop trigger if exists "set_deal_property_id" on "public"."deal";

drop trigger if exists "after_property_change_trigger" on "public"."property";

drop trigger if exists "add_individual_documents_trigger" on "public"."borrower";

drop trigger if exists "add_entity_documents_trigger" on "public"."company";

drop trigger if exists "add_deal_documents_trigger" on "public"."deal";

drop policy "Admins can read all profiles" on "public"."user_profile";

drop policy "Admins can update all profiles" on "public"."user_profile";

drop policy "Internal admins in org 6 or 7 can delete any user profile" on "public"."user_profile";

drop policy "Users can read their own profile" on "public"."user_profile";

drop policy "Users can update their own profile" on "public"."user_profile";

alter table "public"."document_roles_assigned" drop constraint "document_roles_assigned_role_id_fkey";

alter table "public"."user_profile" drop constraint "user_profile_role_check";

alter table "public"."bs_investor_deals" drop constraint "bs_investor_deals_deal_id_fkey";

drop function if exists "public"."public_add_individual_documents_disabled"();

-- Skipping due to foreign key dependencies
-- alter table "public"."document_files" drop constraint "document_files_pkey";

alter table "public"."user_profile" drop constraint "user_profile_pkey";

-- Skipping due to foreign key dependencies
-- drop index if exists "public"."document_files_pkey";

drop index if exists "public"."idx_user_clerk_orgs_members_clerk_organization_fkey";

drop index if exists "public"."idx_user_clerk_orgs_members_user_id";

drop index if exists "public"."idx_user_clerk_sessions_clerk_user_id";

drop index if exists "public"."user_profile_pkey";

drop table "public"."user_clerk_sessions";

alter table "public"."company" alter column "co_ppb_address_country" drop default;

alter type "public"."country_enum" rename to "country_enum__old_version_to_be_dropped";

create type "public"."country_enum" as enum ('Bonaire, Sint Eustatius and Saba', 'Curaçao', 'Guernsey', 'Isle of Man', 'Jersey', 'Åland Islands', 'Montenegro', 'Saint Barthélemy', 'Saint Martin (French part)', 'Serbia', 'Sint Maarten (Dutch part)', 'South Sudan', 'Timor-Leste', 'American Samoa', 'Andorra', 'Angola', 'Anguilla', 'Antarctica', 'Antigua and Barbuda', 'Argentina', 'Armenia', 'Aruba', 'Australia', 'Austria', 'Azerbaijan', 'Bahamas', 'Bahrain', 'Bangladesh', 'Barbados', 'Belarus', 'Belgium', 'Belize', 'Benin', 'Bermuda', 'Bhutan', 'Bolivia', 'Bosnia and Herzegovina', 'Botswana', 'Bouvet Island', 'Brazil', 'British Indian Ocean Territory', 'Brunei Darussalam', 'Bulgaria', 'Burkina Faso', 'Burundi', 'Cambodia', 'Cameroon', 'Canada', 'Cape Verde', 'Cayman Islands', 'Central African Republic', 'Chad', 'Chile', 'China', 'Christmas Island', 'Cocos (Keeling) Islands', 'Colombia', 'Comoros', 'Congo', 'Congo, the Democratic Republic of the', 'Cook Islands', 'Costa Rica', 'Cote DIvoire', 'Croatia', 'Cuba', 'Cyprus', 'Czech Republic', 'Denmark', 'Djibouti', 'Dominica', 'Dominican Republic', 'Ecuador', 'Egypt', 'El Salvador', 'Equatorial Guinea', 'Eritrea', 'Estonia', 'Ethiopia', 'Falkland Islands (Malvinas)', 'Faroe Islands', 'Fiji', 'Finland', 'France', 'French Guiana', 'French Polynesia', 'French Southern Territories', 'Gabon', 'Gambia', 'Georgia', 'Germany', 'Ghana', 'Gibraltar', 'Greece', 'Greenland', 'Grenada', 'Guadeloupe', 'Guam', 'Guatemala', 'Guinea', 'Guinea-Bissau', 'Guyana', 'Haiti', 'Heard Island and Mcdonald Islands', 'Holy See (Vatican City State)', 'Honduras', 'Hong Kong', 'Hungary', 'Iceland', 'India', 'Indonesia', 'Iran, Islamic Republic of', 'Iraq', 'Ireland', 'Israel', 'Italy', 'Jamaica', 'Japan', 'Jordan', 'Kazakhstan', 'Kenya', 'Kiribati', 'Korea, Democratic People's Republic of', 'Korea, Republic of', 'Kuwait', 'Kyrgyzstan', 'Lao People's Democratic Republic', 'Latvia', 'Lebanon', 'Lesotho', 'Liberia', 'Libya', 'Liechtenstein', 'Lithuania', 'Luxembourg', 'Macao', 'Macedonia, the Former Yugoslav Republic of', 'Madagascar', 'Malawi', 'Malaysia', 'Maldives', 'Mali', 'Malta', 'Marshall Islands', 'Martinique', 'Mauritania', 'Mauritius', 'Mayotte', 'Mexico', 'Micronesia, Federated States of', 'Moldova, Republic of', 'Monaco', 'Mongolia', 'Albania', 'Montserrat', 'Morocco', 'Mozambique', 'Myanmar', 'Namibia', 'Nauru', 'Nepal', 'Netherlands', 'New Caledonia', 'New Zealand', 'Nicaragua', 'Niger', 'Nigeria', 'Niue', 'Norfolk Island', 'Northern Mariana Islands', 'Norway', 'Oman', 'Pakistan', 'Palau', 'Palestine, State of', 'Panama', 'Papua New Guinea', 'Paraguay', 'Peru', 'Philippines', 'Pitcairn', 'Poland', 'Portugal', 'Puerto Rico', 'Qatar', 'Reunion', 'Romania', 'Russian Federation', 'Rwanda', 'Saint Helena, Ascension and Tristan da Cunha', 'Saint Kitts and Nevis', 'Saint Lucia', 'Saint Pierre and Miquelon', 'Saint Vincent and the Grenadines', 'Samoa', 'San Marino', 'Sao Tome and Principe', 'Saudi Arabia', 'Senegal', 'Seychelles', 'Sierra Leone', 'Singapore', 'Slovakia', 'Slovenia', 'Solomon Islands', 'Somalia', 'South Africa', 'South Georgia and the South Sandwich Islands', 'Spain', 'Sri Lanka', 'Sudan', 'Suriname', 'Svalbard and Jan Mayen', 'Swaziland', 'Sweden', 'Switzerland', 'Syrian Arab Republic', 'Taiwan (Province of China)', 'Tajikistan', 'Tanzania, United Republic of', 'Thailand', 'Togo', 'Tokelau', 'Tonga', 'Trinidad and Tobago', 'Tunisia', 'Turkey', 'Turkmenistan', 'Turks and Caicos Islands', 'Tuvalu', 'Uganda', 'Ukraine', 'United Arab Emirates', 'United Kingdom', 'United States', 'United States Minor Outlying Islands', 'Uruguay', 'Uzbekistan', 'Vanuatu', 'Venezuela', 'Viet Nam', 'Virgin Islands (British)', 'Virgin Islands (U.S.)', 'Wallis and Futuna', 'Western Sahara', 'Yemen', 'Zambia', 'Zimbabwe', 'Afghanistan', 'Algeria');

alter type "public"."credit_check_status" rename to "credit_check_status__old_version_to_be_dropped";

create type "public"."credit_check_status" as enum ('Payment Needed', 'Paid', 'Approved', 'Denied', 'Frozen', 'Under Review');

alter type "public"."deal_disposition_1" rename to "deal_disposition_1__old_version_to_be_dropped";

create type "public"."deal_disposition_1" as enum ('active', 'dead', 'on_hold');

alter type "public"."deal_stage_1" rename to "deal_stage_1__old_version_to_be_dropped";

create type "public"."deal_stage_1" as enum ('lead', 'scenario', 'deal');

alter type "public"."deal_stage_2" rename to "deal_stage_2__old_version_to_be_dropped";

create type "public"."deal_stage_2" as enum ('loan_setup', 'processing_1', 'appraisal_review', 'processing_2', 'qc_1', 'underwriting', 'conditionally_approved', 'qc_2', 'clear_to_close', 'closed_and_funded');

alter type "public"."deal_status_primary" rename to "deal_status_primary__old_version_to_be_dropped";

create type "public"."deal_status_primary" as enum ('Scenario', 'Loan Setup', 'Pre-Qual Review (PQR)', 'Processing I', 'Appraisal Review', 'Processing II', 'Pre-Submission Review (PSR)', 'Underwriting', 'Conditionally Approved', 'Clear to Close', 'Closed & Funded');

alter type "public"."debt_instrument_type" rename to "debt_instrument_type__old_version_to_be_dropped";

create type "public"."debt_instrument_type" as enum ('mortgage_note', 'bridge_loan', 'construction_loan', 'rehab_loan', 'senior_debt', 'convertible_note', 'mortgage_pool', 'asset_backed_security', 'other');

alter type "public"."document_category" rename to "document_category__old_version_to_be_dropped";

create type "public"."document_category" as enum ('application', 'appraisal', 'assets', 'closing', 'credit_and_background', 'construction', 'environmental', 'experience', 'id', 'insurance', 'pricing', 'property', 'seasoning', 'servicing', 'title', 'entity');

alter type "public"."document_status" rename to "document_status__old_version_to_be_dropped";

create type "public"."document_status" as enum ('approved', 'pending_review', 'pending_submission', 'pending_exception', 'rejected_items_needed', 'rejected_revisions_needed', 'rejected_signature_needed');

alter type "public"."entity_type" rename to "entity_type__old_version_to_be_dropped";

create type "public"."entity_type" as enum ('corp', 'general_partnership', 'limited_liability_company', 'limited_liability_partnership', 'limited_partnership', 's_corp', 'sole_proprietorship');

create table "public"."bs_debt_instruments_deals" (
    "id" bigint generated by default as identity not null,
    "instrument_id" bigint not null,
    "deal_id" bigint not null
);


alter table "public"."bs_debt_instruments_deals" enable row level security;

create table "public"."cba_requests" (
    "id" bigint generated by default as identity not null,
    "submitted_at" timestamp with time zone not null default now(),
    "completed_at" timestamp with time zone,
    "deal_id" bigint,
    "uw_prequal_result_credit" bigint,
    "uw_prequal_result_background" bigint,
    "submitted_by" bigint not null
);


alter table "public"."cba_requests" enable row level security;

create table "public"."cba_requests_guarantors" (
    "created_at" timestamp with time zone not null default now(),
    "cba_request_id" bigint not null,
    "guarantor_id" bigint not null
);


alter table "public"."cba_requests_guarantors" enable row level security;

create table "public"."company_contact" (
    "id" bigint generated by default as identity not null,
    "co_id" bigint,
    "contact_id" bigint,
    "deal_id" bigint
);


alter table "public"."company_contact" enable row level security;

create table "public"."company_member" (
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

create table "public"."company_roles" (
    "id" bigint generated by default as identity not null,
    "co_id" bigint not null,
    "role_id" bigint not null,
    "deal_id" bigint
);


alter table "public"."company_roles" enable row level security;

create table "public"."company_roles_defined" (
    "id" bigint generated by default as identity not null,
    "co_role" company_role not null,
    "description" text,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "deal_id" bigint
);


alter table "public"."company_roles_defined" enable row level security;

create table "public"."constants" (
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

create table "public"."contact" (
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

create table "public"."contact_types" (
    "id" bigint generated by default as identity not null,
    "name" text
);


alter table "public"."contact_types" enable row level security;

create table "public"."contact_types_jt" (
    "id" bigint generated by default as identity not null,
    "contact_id" bigint,
    "contact_types_id" bigint
);


alter table "public"."contact_types_jt" enable row level security;

create table "public"."countries" (
    "id" bigint generated by default as identity not null,
    "name" text,
    "iso2" text not null,
    "iso3" text,
    "local_name" text,
    "continent" continents
);


alter table "public"."countries" enable row level security;

create table "public"."custom_loan_fees" (
    "id" bigint generated by default as identity not null,
    "deal_id" bigint not null,
    "fee_category" fee_type,
    "fee_description" text,
    "fee_amount" numeric,
    "created_at" timestamp with time zone not null default now()
);


alter table "public"."custom_loan_fees" enable row level security;

create table "public"."deal_appraisals" (
    "id" bigint generated by default as identity not null,
    "deal_id" bigint,
    "appraisal_id" bigint,
    "property_Id" bigint
);


alter table "public"."deal_appraisals" enable row level security;

create table "public"."deal_property" (
    "id" bigint generated by default as identity not null,
    "deal_id" bigint not null,
    "property_id" bigint not null
);


alter table "public"."deal_property" enable row level security;

create table "public"."deal_roles" (
    "id" bigint generated by default as identity not null,
    "deal_id" bigint,
    "contact_id" bigint,
    "contact_types_id" bigint
);


alter table "public"."deal_roles" enable row level security;

create table "public"."fee" (
    "id" bigint generated by default as identity not null,
    "category" text not null,
    "program" loan_program,
    "fee_amount_bps" numeric not null,
    "created_at" timestamp with time zone not null default now()
);


alter table "public"."fee" enable row level security;

create table "public"."guarantor" (
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

create table "public"."loan_application" (
    "id" bigint generated by default as identity not null,
    "submission" jsonb,
    "status" text,
    "application_deal_id" bigint,
    "created_at" timestamp with time zone not null default now(),
    "error_message" text,
    "reprocess" boolean default false
);


alter table "public"."loan_application" enable row level security;

create table "public"."loan_price" (
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

create table "public"."loan_price_saved" (
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

create table "public"."loan_program_a" (
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

create table "public"."loan_program_b" (
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

create table "public"."ltv_band" (
    "id" bigint generated by default as identity not null,
    "name" text not null,
    "ltv_min" numeric not null,
    "ltv_max" numeric not null,
    "notes" text,
    "created_at" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text),
    "updated_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text)
);


alter table "public"."ltv_band" enable row level security;

create table "public"."max_ltv" (
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

create table "public"."milestone_templates" (
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

create table "public"."milestones" (
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

create table "public"."payroll_submission" (
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

create table "public"."payroll_submission_fees_1099" (
    "id" uuid not null default gen_random_uuid(),
    "payroll_submission_id" bigint,
    "broker_id" bigint,
    "expense_1099_broker_fee_usd" numeric,
    "expense_1099_broker_fee_pct" numeric,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone
);


alter table "public"."payroll_submission_fees_1099" enable row level security;

create table "public"."property_income" (
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

create table "public"."property_reapi" (
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

create table "public"."rate_adjustment" (
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

create table "public"."select_uw_outcomes" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "label" text not null default ''::text,
    "description" text default ''::text
);


alter table "public"."select_uw_outcomes" enable row level security;

create table "public"."task_templates" (
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

alter table "public"."borrower" alter column credit_check type "public"."credit_check_status" using credit_check::text::"public"."credit_check_status";

alter table "public"."bs_debt_instruments" alter column instrument_type type "public"."debt_instrument_type" using instrument_type::text::"public"."debt_instrument_type";

alter table "public"."company" alter column co_entity_type type "public"."entity_type" using co_entity_type::text::"public"."entity_type";

alter table "public"."company" alter column co_ppb_address_country type "public"."country_enum" using co_ppb_address_country::text::"public"."country_enum";

alter table "public"."deal" alter column deal_stage_1 type "public"."deal_stage_1" using deal_stage_1::text::"public"."deal_stage_1";

alter table "public"."deal" alter column deal_stage_2 type "public"."deal_stage_2" using deal_stage_2::text::"public"."deal_stage_2";

alter table "public"."document_files" alter column category type "public"."document_category" using category::text::"public"."document_category";

alter table "public"."document_files" alter column status type "public"."document_status" using status::text::"public"."document_status";

alter table "public"."company" alter column "co_ppb_address_country" set default 'United States'::country_enum;

drop type "public"."country_enum__old_version_to_be_dropped";

drop type "public"."credit_check_status__old_version_to_be_dropped";

drop type "public"."deal_disposition_1__old_version_to_be_dropped";

drop type "public"."deal_stage_1__old_version_to_be_dropped";

drop type "public"."deal_stage_2__old_version_to_be_dropped";

drop type "public"."deal_status_primary__old_version_to_be_dropped";

drop type "public"."debt_instrument_type__old_version_to_be_dropped";

drop type "public"."document_category__old_version_to_be_dropped";

drop type "public"."document_status__old_version_to_be_dropped";

drop type "public"."entity_type__old_version_to_be_dropped";

alter table "public"."appraisal" drop column "appraisal_fee";

alter table "public"."appraisal" drop column "date_ordered";

alter table "public"."appraisal" drop column "order_number";

alter table "public"."appraisal" drop column "value";

alter table "public"."appraisal" drop column "value_as_is";

alter table "public"."appraisal" add column "created_at" timestamp with time zone not null default now();

alter table "public"."appraisal" add column "date_amc_vendor_accept" timestamp with time zone;

alter table "public"."appraisal" add column "date_amc_vendor_assign" timestamp with time zone;

alter table "public"."appraisal" add column "date_inspection_completed" date;

alter table "public"."appraisal" add column "date_inspection_scheduled" date;

alter table "public"."appraisal" add column "date_report_ordered" date;

alter table "public"."appraisal" add column "date_report_received" date;

alter table "public"."appraisal" add column "file_number" text;

alter table "public"."appraisal" add column "file_number_amc" text;

alter table "public"."appraisal" add column "updated_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text);

alter table "public"."appraisal" add column "value_conclusion_as_is" numeric;

alter table "public"."appraisal" add column "value_conclusion_as_repaired" numeric;

alter table "public"."appraisal" add column "value_conclusion_fair_market_rent" numeric;

alter table "public"."appraisal" enable row level security;

alter table "public"."borrower" drop column "fico_report_date_expiration";

alter table "public"."borrower" drop column "name";

alter table "public"."borrower" add column "fico_report_date_expiration" date generated always as ((fico_report_date_pulled + 91)) stored;

alter table "public"."borrower" add column "name" text generated always as (((first_name || ' '::text) || last_name)) stored;

alter table "public"."borrower" alter column "id" add generated by default as identity;

alter table "public"."borrower" enable row level security;

alter table "public"."bs_debt_instruments" enable row level security;

alter table "public"."bs_investor_deals" enable row level security;

alter table "public"."bs_investor_distributions" alter column "deposit_amount" set data type numeric(15,2) using "deposit_amount"::numeric(15,2);

alter table "public"."bs_investor_distributions" alter column "id" set default gen_random_uuid();

alter table "public"."bs_investor_distributions" alter column "id" drop identity;

alter table "public"."bs_investor_distributions" alter column "id" set data type uuid using "id"::uuid;

alter table "public"."bs_investor_distributions" alter column "interest_amount" set data type numeric(15,2) using "interest_amount"::numeric(15,2);

alter table "public"."bs_investor_distributions" alter column "rate_of_return_pct" set data type numeric(5,4) using "rate_of_return_pct"::numeric(5,4);

alter table "public"."bs_investor_distributions" alter column "servicing_fee" set data type numeric(15,2) using "servicing_fee"::numeric(15,2);

alter table "public"."bs_investor_distributions" alter column "wire_fee" set data type numeric(15,2) using "wire_fee"::numeric(15,2);

alter table "public"."bs_investor_distributions" enable row level security;

alter table "public"."bs_investor_statements" alter column "id" set default gen_random_uuid();

alter table "public"."bs_investor_statements" alter column "id" drop identity;

alter table "public"."bs_investor_statements" alter column "id" set data type uuid using "id"::uuid;

alter table "public"."bs_investor_statements" enable row level security;

alter table "public"."bs_investor_transactions" alter column "transaction_amount" set data type numeric(15,2) using "transaction_amount"::numeric(15,2);

alter table "public"."bs_investor_transactions" enable row level security;

alter table "public"."bs_investor_transactions_references" alter column "id" set default nextval('transaction_references_id_seq'::regclass);

alter table "public"."bs_investor_transactions_references" alter column "id" drop identity;

alter table "public"."bs_investor_transactions_references" enable row level security;

alter table "public"."company" alter column "co_id" add generated by default as identity;

alter table "public"."company" enable row level security;

alter table "public"."deal" drop column "additional_guarantors";

alter table "public"."deal" drop column "appraisal_required";

alter table "public"."deal" drop column "appraised_value";

alter table "public"."deal" drop column "archived";

alter table "public"."deal" drop column "arm_description";

alter table "public"."deal" drop column "calculated_mid_fico";

alter table "public"."deal" drop column "contact_2_id";

alter table "public"."deal" drop column "contact_3_id";

alter table "public"."deal" drop column "contact_4_id";

alter table "public"."deal" drop column "contact_id";

alter table "public"."deal" drop column "deal_address";

alter table "public"."deal" drop column "guarantee_type";

alter table "public"."deal" drop column "guarantor_citizenship";

alter table "public"."deal" drop column "guarantor_first_time_home_buyer";

alter table "public"."deal" drop column "guarantor_mortgage_debt";

alter table "public"."deal" drop column "last_status_change";

alter table "public"."deal" drop column "loan_amount_piti";

alter table "public"."deal" drop column "loan_price_id";

alter table "public"."deal" drop column "loan_structure";

alter table "public"."deal" drop column "loan_type";

alter table "public"."deal" drop column "locked";

alter table "public"."deal" drop column "name";

alter table "public"."deal" drop column "original_id";

alter table "public"."deal" drop column "payoff_mtg2_amount";

alter table "public"."deal" drop column "program_a_id";

alter table "public"."deal" drop column "program_b_id";

alter table "public"."deal" drop column "selected_program_loan";

alter table "public"."deal" drop column "status";

alter table "public"."deal" drop column "status_2";

alter table "public"."deal" add column "clerk_id" text;

alter table "public"."deal" add column "clerk_organization_id" text;

alter table "public"."deal" add column "cost_of_capital" numeric;

alter table "public"."deal" add column "deal_disposition_1" deal_disposition_1;

alter table "public"."deal" add column "declaration_1_lawsuits" boolean;

alter table "public"."deal" add column "declaration_1_lawsuits_explanation" text;

alter table "public"."deal" add column "declaration_2_bankruptcy" boolean;

alter table "public"."deal" add column "declaration_2_bankruptcy_explanation" text;

alter table "public"."deal" add column "declaration_3_felony" boolean default false;

alter table "public"."deal" add column "declaration_3_felony_explanation" text;

alter table "public"."deal" add column "declaration_5_license" boolean default false;

alter table "public"."deal" add column "funding_date" date;

alter table "public"."deal" add column "io_period" numeric;

alter table "public"."deal" add column "loan_amount_initial" numeric;

alter table "public"."deal" add column "loan_number" text;

alter table "public"."deal" add column "loan_sale_date" date;

alter table "public"."deal" add column "loan_structure_dscr" loan_structure_dscr;

alter table "public"."deal" add column "loan_type_rtl" loan_type_2;

alter table "public"."deal" add column "ltv_after_repair" numeric;

alter table "public"."deal" add column "ltv_asis" numeric;

alter table "public"."deal" add column "note_date" date;

alter table "public"."deal" add column "note_rate" numeric;

alter table "public"."deal" add column "ppp_structure_1" ppp_structure_1;

alter table "public"."deal" add column "ppp_term" ppp_term;

alter table "public"."deal" add column "pricing_file_path" text;

alter table "public"."deal" add column "pricing_file_url" text;

alter table "public"."deal" add column "pricing_is_locked" boolean not null default false;

alter table "public"."deal" add column "recently_renovated" yes_no;

alter table "public"."deal" add column "recourse_type" text default 'full_recourse'::text;

alter table "public"."deal" add column "renovation_completed" date;

alter table "public"."deal" add column "renovation_cost" numeric;

alter table "public"."deal" add column "title_file_number" text;

alter table "public"."deal" alter column "account_executive_id" set data type bigint using "account_executive_id"::bigint;

alter table "public"."deal" alter column "created_at" set default (now() AT TIME ZONE 'utc'::text);

alter table "public"."deal" alter column "guarantor_count" set default '1'::smallint;

alter table "public"."deal" alter column "guarantor_count" set data type smallint using "guarantor_count"::smallint;

alter table "public"."deal" alter column "guarantor_fico_score" set data type smallint using "guarantor_fico_score"::smallint;

alter table "public"."deal" alter column "lead_source_type" set data type lead_source using "lead_source_type"::text::lead_source;

alter table "public"."deal" alter column "loan_opener_id" set data type bigint using "loan_opener_id"::bigint;

alter table "public"."deal" alter column "loan_processor_id" set data type bigint using "loan_processor_id"::bigint;

alter table "public"."deal" alter column "mid_fico" set default '0'::smallint;

alter table "public"."deal" alter column "mid_fico" set data type smallint using "mid_fico"::smallint;

alter table "public"."deal" alter column "updated_at" set default (now() AT TIME ZONE 'utc'::text);

alter table "public"."deal" enable row level security;

alter table "public"."document_files" drop column "file_name";

alter table "public"."document_files" drop column "role";

alter table "public"."document_files" drop column "updated_at";

alter table "public"."document_files" add column "effective_date" date;

alter table "public"."document_files" add column "expiration_date" date;

alter table "public"."document_files" add column "file_size" bigint;

alter table "public"."document_files" add column "file_type" text;

alter table "public"."document_files" add column "is_required" boolean;

alter table "public"."document_files" add column "private_notes" text;

alter table "public"."document_files" add column "public_notes" text;

alter table "public"."document_files" add column "uploaded_at" timestamp with time zone;

alter table "public"."document_files" add column "uploaded_by" text;

alter table "public"."document_files" alter column "category" drop not null;

alter table "public"."document_files" alter column "created_at" set default now();

alter table "public"."document_files" alter column "created_at" set not null;

alter table "public"."document_files" alter column "name" drop not null;

alter table "public"."document_files" enable row level security;

alter table "public"."document_roles" enable row level security;

alter table "public"."document_roles_assigned" enable row level security;

alter table "public"."property" drop column "calculated_ltv";

alter table "public"."property" drop column "condo_type";

alter table "public"."property" drop column "expense_annual_administrative";

alter table "public"."property" drop column "expense_annual_capital_expenditures";

alter table "public"."property" drop column "expense_annual_common_area_maintenance";

alter table "public"."property" drop column "expense_annual_debt_service_existing";

alter table "public"."property" drop column "expense_annual_lawn_landscape";

alter table "public"."property" drop column "expense_annual_other";

alter table "public"."property" drop column "expense_annual_repairs_maintenance";

alter table "public"."property" drop column "expense_annual_snow_removal";

alter table "public"."property" drop column "expense_annual_trash";

alter table "public"."property" drop column "expense_annual_utilities";

alter table "public"."property" drop column "expense_annual_vacancy_loss";

alter table "public"."property" drop column "expenses_as_entered";

alter table "public"."property" drop column "hoa_dues_current";

alter table "public"."property" drop column "hoa_dues_include";

alter table "public"."property" drop column "hoa_fee";

alter table "public"."property" drop column "insurance_premium";

alter table "public"."property" drop column "is_income";

alter table "public"."property" drop column "lease_expires";

alter table "public"."property" drop column "lease_length";

alter table "public"."property" drop column "lease_rent";

alter table "public"."property" drop column "lease_start";

alter table "public"."property" drop column "lease_status";

alter table "public"."property" drop column "market_rent_fmr";

alter table "public"."property" drop column "property_manager";

alter table "public"."property" drop column "property_taxes";

alter table "public"."property" drop column "tenant_occupied";

alter table "public"."property" drop column "value_estimated_rent";

alter table "public"."property" add column "bathrooms_aiv" numeric;

alter table "public"."property" add column "bathrooms_arv" numeric;

alter table "public"."property" add column "bedrooms_aiv" numeric;

alter table "public"."property" add column "bedrooms_arv" numeric;

alter table "public"."property" add column "declining_market" yes_no;

alter table "public"."property" add column "hoa_contact_email" text;

alter table "public"."property" add column "hoa_contact_person" text;

alter table "public"."property" add column "hoa_contact_phone" text;

alter table "public"."property" add column "inspection" yes_no;

alter table "public"."property" add column "latitude" numeric;

alter table "public"."property" add column "longitude" numeric;

alter table "public"."property" add column "photo_url" text;

alter table "public"."property" add column "purchase_date" date;

alter table "public"."property" add column "recently_renovated" yes_no;

alter table "public"."property" add column "rehab_completed_post_acquisition" numeric;

alter table "public"."property" add column "renovation_completed" date;

alter table "public"."property" add column "renovation_cost" numeric;

alter table "public"."property" add column "rural" yes_no;

alter table "public"."property" add column "sale_date" date;

alter table "public"."property" add column "sale_price" numeric;

alter table "public"."property" add column "sq_footage_gla_aiv" bigint;

alter table "public"."property" add column "sq_footage_gla_arv" bigint;

alter table "public"."property" add column "sq_footage_lot_aiv" bigint;

alter table "public"."property" add column "sq_footage_lot_arv" bigint;

alter table "public"."property" add column "value_aiv_appraised" numeric;

alter table "public"."property" add column "value_arv_appraised" numeric;

alter table "public"."property" alter column "address_country" set default 'United States'::text;

alter table "public"."property" alter column "created_at" set default (now() AT TIME ZONE 'utc'::text);

alter table "public"."property" alter column "units" set data type smallint using "units"::smallint;

alter table "public"."property" alter column "updated_at" set default (now() AT TIME ZONE 'utc'::text);

alter table "public"."property" alter column "year_built" set data type bigint using "year_built"::bigint;

alter table "public"."property" enable row level security;

alter table "public"."tasks" drop column "completed_date";

alter table "public"."tasks" drop column "updated_at";

alter table "public"."tasks" add column "date_completed" date;

alter table "public"."tasks" add column "date_reached" date;

alter table "public"."tasks" add column "task_complete" boolean;

alter table "public"."tasks" alter column "assigned_to" set data type bigint using "assigned_to"::bigint;

alter table "public"."tasks" alter column "created_at" set not null;

alter table "public"."tasks" alter column "days_until_due" set data type numeric using "days_until_due"::numeric;

alter table "public"."tasks" alter column "task_name" set default ''::character varying;

alter table "public"."tasks" alter column "task_name" set not null;

alter table "public"."tasks" alter column "task_name" set data type character varying using "task_name"::character varying;

alter table "public"."tasks" alter column "task_order" set data type numeric using "task_order"::numeric;

alter table "public"."tasks" enable row level security;

alter table "public"."user_clerk_orgs_members" add column "clerk_organization_id" text not null;

alter table "public"."user_clerk_orgs_members" alter column "clerk_organization_fkey" drop not null;

alter table "public"."user_clerk_orgs_members" alter column "clerk_role" set default 'member'::clerk_role;

alter table "public"."user_clerk_orgs_members" alter column "clerk_role" drop not null;

alter table "public"."user_clerk_orgs_members" alter column "clerk_role" set data type clerk_role using "clerk_role"::clerk_role;

alter table "public"."user_profile" add column "avatar_url" text;

alter table "public"."user_profile" add column "website" text;

alter table "public"."user_profile" alter column "role" drop not null;

alter table "public"."user_profile" alter column "role" set data type user_role_internal using "role"::user_role_internal;

alter sequence "public"."transaction_references_id_seq" owned by "public"."bs_investor_transactions_references"."id";

drop type "public"."deal_status";

drop type "public"."deal_status_secondary";

drop type "public"."lead_source_type";

drop type "public"."loan_type_rtl";

CREATE UNIQUE INDEX "Documents_pkey" ON public.document_files USING btree (id);

CREATE UNIQUE INDEX "Tasks_pkey" ON public.tasks USING btree (id);

CREATE UNIQUE INDEX bs_debt_instruments_deals_pkey ON public.bs_debt_instruments_deals USING btree (id);

CREATE UNIQUE INDEX cba_submission_credit_id_key ON public.cba_requests USING btree (id);

CREATE UNIQUE INDEX cba_submission_credit_pkey ON public.cba_requests USING btree (id);

CREATE UNIQUE INDEX cba_submissions_guarantors_pkey ON public.cba_requests_guarantors USING btree (cba_request_id, guarantor_id);

CREATE UNIQUE INDEX company_contact_pkey ON public.company_contact USING btree (id);

CREATE UNIQUE INDEX company_member_pkey ON public.company_member USING btree (member_id);

CREATE UNIQUE INDEX company_role_name_key ON public.company_roles_defined USING btree (co_role);

CREATE UNIQUE INDEX company_role_pkey ON public.company_roles_defined USING btree (id);

CREATE UNIQUE INDEX company_roles_pkey ON public.company_roles USING btree (id);

CREATE UNIQUE INDEX constants_name_key ON public.constants USING btree (name);

CREATE UNIQUE INDEX constants_pkey ON public.constants USING btree (id);

CREATE UNIQUE INDEX contact_contact_types_pkey ON public.contact_types_jt USING btree (id);

CREATE UNIQUE INDEX contact_pkey ON public.contact USING btree (id);

CREATE UNIQUE INDEX contact_types_jt_id_key ON public.contact_types_jt USING btree (id);

CREATE UNIQUE INDEX contact_types_pkey ON public.contact_types USING btree (id);

CREATE UNIQUE INDEX countries_pkey ON public.countries USING btree (id);

CREATE UNIQUE INDEX custom_loan_fees_pkey ON public.custom_loan_fees USING btree (id);

CREATE UNIQUE INDEX deal_appraisals_pkey ON public.deal_appraisals USING btree (id);

CREATE UNIQUE INDEX deal_program_row_index_constraint ON public.loan_price USING btree (deal_id, program, row_index);

CREATE UNIQUE INDEX deal_property_pkey ON public.deal_property USING btree (id);

CREATE UNIQUE INDEX deal_roles_pkey ON public.deal_roles USING btree (id);

CREATE UNIQUE INDEX fee_pkey ON public.fee USING btree (id);

CREATE UNIQUE INDEX guarantor_pkey ON public.guarantor USING btree (guarantor_id);

CREATE UNIQUE INDEX loan_application_pkey ON public.loan_application USING btree (id);

CREATE UNIQUE INDEX loan_price_pkey ON public.loan_price USING btree (id);

CREATE UNIQUE INDEX loan_price_saved_pkey ON public.loan_price_saved USING btree (id);

CREATE UNIQUE INDEX loan_program_a_deal_id_key ON public.loan_program_a USING btree (deal_id);

CREATE UNIQUE INDEX loan_program_a_pkey ON public.loan_program_a USING btree (id);

CREATE UNIQUE INDEX loan_program_b_deal_id_key ON public.loan_program_b USING btree (deal_id);

CREATE UNIQUE INDEX loan_program_b_pkey ON public.loan_program_b USING btree (id);

CREATE UNIQUE INDEX ltv_band_name_key ON public.ltv_band USING btree (name);

CREATE UNIQUE INDEX ltv_band_pkey ON public.ltv_band USING btree (id);

CREATE UNIQUE INDEX max_ltv_pkey ON public.max_ltv USING btree (id);

CREATE UNIQUE INDEX milestone_templates_pkey ON public.milestone_templates USING btree (id);

CREATE UNIQUE INDEX milestones_pkey ON public.milestones USING btree (id);

CREATE UNIQUE INDEX payroll_submission_fees_1099_pkey ON public.payroll_submission_fees_1099 USING btree (id);

CREATE UNIQUE INDEX payroll_submission_pkey ON public.payroll_submission USING btree (id);

CREATE UNIQUE INDEX profile_pkey ON public.user_profile USING btree (id);

CREATE UNIQUE INDEX profiles_username_key ON public.user_profile USING btree (username);

CREATE UNIQUE INDEX property_data_reapi_pkey ON public.property_reapi USING btree (id);

CREATE UNIQUE INDEX property_income_pkey ON public.property_income USING btree (id);

CREATE UNIQUE INDEX property_pkey ON public.property USING btree (id);

CREATE UNIQUE INDEX property_reapi_id_key ON public.property_reapi USING btree (id);

CREATE UNIQUE INDEX rate_adjustment_pkey ON public.rate_adjustment USING btree (id);

CREATE UNIQUE INDEX task_templates_pkey ON public.task_templates USING btree (id);

CREATE UNIQUE INDEX unique_company_contact ON public.company_contact USING btree (co_id, contact_id, deal_id);

CREATE UNIQUE INDEX unique_company_role_deal ON public.company_roles USING btree (co_id, role_id, deal_id);

CREATE UNIQUE INDEX unique_deal_appraisal ON public.deal_appraisals USING btree (deal_id, appraisal_id);

CREATE UNIQUE INDEX user_clerk_orgs_slug_key ON public.user_clerk_orgs USING btree (clerk_organization_slug);

CREATE UNIQUE INDEX user_org_memberships_pkey ON public.user_clerk_orgs_members USING btree (id);

CREATE UNIQUE INDEX uw_result_id_key ON public.select_uw_outcomes USING btree (id);

CREATE UNIQUE INDEX uw_result_pkey ON public.select_uw_outcomes USING btree (id);

alter table "public"."bs_debt_instruments_deals" add constraint "bs_debt_instruments_deals_pkey" PRIMARY KEY using index "bs_debt_instruments_deals_pkey";

alter table "public"."cba_requests" add constraint "cba_submission_credit_pkey" PRIMARY KEY using index "cba_submission_credit_pkey";

alter table "public"."cba_requests_guarantors" add constraint "cba_submissions_guarantors_pkey" PRIMARY KEY using index "cba_submissions_guarantors_pkey";

alter table "public"."company_contact" add constraint "company_contact_pkey" PRIMARY KEY using index "company_contact_pkey";

alter table "public"."company_member" add constraint "company_member_pkey" PRIMARY KEY using index "company_member_pkey";

alter table "public"."company_roles" add constraint "company_roles_pkey" PRIMARY KEY using index "company_roles_pkey";

alter table "public"."company_roles_defined" add constraint "company_role_pkey" PRIMARY KEY using index "company_role_pkey";

alter table "public"."constants" add constraint "constants_pkey" PRIMARY KEY using index "constants_pkey";

alter table "public"."contact" add constraint "contact_pkey" PRIMARY KEY using index "contact_pkey";

alter table "public"."contact_types" add constraint "contact_types_pkey" PRIMARY KEY using index "contact_types_pkey";

alter table "public"."contact_types_jt" add constraint "contact_contact_types_pkey" PRIMARY KEY using index "contact_contact_types_pkey";

alter table "public"."countries" add constraint "countries_pkey" PRIMARY KEY using index "countries_pkey";

alter table "public"."custom_loan_fees" add constraint "custom_loan_fees_pkey" PRIMARY KEY using index "custom_loan_fees_pkey";

alter table "public"."deal_appraisals" add constraint "deal_appraisals_pkey" PRIMARY KEY using index "deal_appraisals_pkey";

alter table "public"."deal_property" add constraint "deal_property_pkey" PRIMARY KEY using index "deal_property_pkey";

alter table "public"."deal_roles" add constraint "deal_roles_pkey" PRIMARY KEY using index "deal_roles_pkey";

alter table "public"."document_files" add constraint "Documents_pkey" PRIMARY KEY using index "Documents_pkey";

alter table "public"."fee" add constraint "fee_pkey" PRIMARY KEY using index "fee_pkey";

alter table "public"."guarantor" add constraint "guarantor_pkey" PRIMARY KEY using index "guarantor_pkey";

alter table "public"."loan_application" add constraint "loan_application_pkey" PRIMARY KEY using index "loan_application_pkey";

alter table "public"."loan_price" add constraint "loan_price_pkey" PRIMARY KEY using index "loan_price_pkey";

alter table "public"."loan_price_saved" add constraint "loan_price_saved_pkey" PRIMARY KEY using index "loan_price_saved_pkey";

alter table "public"."loan_program_a" add constraint "loan_program_a_pkey" PRIMARY KEY using index "loan_program_a_pkey";

alter table "public"."loan_program_b" add constraint "loan_program_b_pkey" PRIMARY KEY using index "loan_program_b_pkey";

alter table "public"."ltv_band" add constraint "ltv_band_pkey" PRIMARY KEY using index "ltv_band_pkey";

alter table "public"."max_ltv" add constraint "max_ltv_pkey" PRIMARY KEY using index "max_ltv_pkey";

alter table "public"."milestone_templates" add constraint "milestone_templates_pkey" PRIMARY KEY using index "milestone_templates_pkey";

alter table "public"."milestones" add constraint "milestones_pkey" PRIMARY KEY using index "milestones_pkey";

alter table "public"."payroll_submission" add constraint "payroll_submission_pkey" PRIMARY KEY using index "payroll_submission_pkey";

alter table "public"."payroll_submission_fees_1099" add constraint "payroll_submission_fees_1099_pkey" PRIMARY KEY using index "payroll_submission_fees_1099_pkey";

alter table "public"."property" add constraint "property_pkey" PRIMARY KEY using index "property_pkey";

alter table "public"."property_income" add constraint "property_income_pkey" PRIMARY KEY using index "property_income_pkey";

alter table "public"."property_reapi" add constraint "property_data_reapi_pkey" PRIMARY KEY using index "property_data_reapi_pkey";

alter table "public"."rate_adjustment" add constraint "rate_adjustment_pkey" PRIMARY KEY using index "rate_adjustment_pkey";

alter table "public"."select_uw_outcomes" add constraint "uw_result_pkey" PRIMARY KEY using index "uw_result_pkey";

alter table "public"."task_templates" add constraint "task_templates_pkey" PRIMARY KEY using index "task_templates_pkey";

alter table "public"."tasks" add constraint "Tasks_pkey" PRIMARY KEY using index "Tasks_pkey";

alter table "public"."user_clerk_orgs_members" add constraint "user_org_memberships_pkey" PRIMARY KEY using index "user_org_memberships_pkey";

alter table "public"."user_profile" add constraint "profile_pkey" PRIMARY KEY using index "profile_pkey";

alter table "public"."appraisal" add constraint "appraisal_appraiser_id_fkey" FOREIGN KEY (appraiser_id) REFERENCES contact(id) ON DELETE SET NULL not valid;

alter table "public"."appraisal" validate constraint "appraisal_appraiser_id_fkey";

alter table "public"."appraisal" add constraint "appraisal_co_amc_fkey" FOREIGN KEY (co_amc) REFERENCES company(co_id) ON DELETE SET NULL not valid;

alter table "public"."appraisal" validate constraint "appraisal_co_amc_fkey";

alter table "public"."appraisal" add constraint "appraisal_co_appraisal_fkey" FOREIGN KEY (co_appraisal) REFERENCES company(co_id) ON DELETE SET NULL not valid;

alter table "public"."appraisal" validate constraint "appraisal_co_appraisal_fkey";

alter table "public"."appraisal" add constraint "appraisal_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE SET NULL not valid;

alter table "public"."appraisal" validate constraint "appraisal_deal_id_fkey";

alter table "public"."appraisal" add constraint "appraisal_document_id_fkey" FOREIGN KEY (document_id) REFERENCES document_files(id) ON DELETE SET NULL not valid;

alter table "public"."appraisal" validate constraint "appraisal_document_id_fkey";

alter table "public"."appraisal" add constraint "appraisal_property_id_fkey" FOREIGN KEY (property_id) REFERENCES property(id) ON DELETE SET NULL not valid;

alter table "public"."appraisal" validate constraint "appraisal_property_id_fkey";

alter table "public"."bs_debt_instruments_deals" add constraint "bs_debt_instruments_deals_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) not valid;

alter table "public"."bs_debt_instruments_deals" validate constraint "bs_debt_instruments_deals_deal_id_fkey";

alter table "public"."bs_debt_instruments_deals" add constraint "bs_debt_instruments_deals_instrument_id_fkey" FOREIGN KEY (instrument_id) REFERENCES bs_debt_instruments(id) not valid;

alter table "public"."bs_debt_instruments_deals" validate constraint "bs_debt_instruments_deals_instrument_id_fkey";

alter table "public"."bs_investor_deals" add constraint "bs_investor_deals_contact_id_fkey" FOREIGN KEY (contact_id) REFERENCES contact(id) ON DELETE CASCADE not valid;

alter table "public"."bs_investor_deals" validate constraint "bs_investor_deals_contact_id_fkey";

alter table "public"."bs_investor_deals" add constraint "bs_investor_deals_contact_types_id_fkey" FOREIGN KEY (contact_types_id) REFERENCES contact_types(id) ON DELETE CASCADE not valid;

alter table "public"."bs_investor_deals" validate constraint "bs_investor_deals_contact_types_id_fkey";

alter table "public"."bs_investor_distributions" add constraint "bs_investor_distribution_details_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) not valid;

alter table "public"."bs_investor_distributions" validate constraint "bs_investor_distribution_details_deal_id_fkey";

alter table "public"."bs_investor_distributions" add constraint "bs_investor_distributions_instrument_id_fkey" FOREIGN KEY (instrument_id) REFERENCES bs_debt_instruments(id) not valid;

alter table "public"."bs_investor_distributions" validate constraint "bs_investor_distributions_instrument_id_fkey";

alter table "public"."bs_investor_distributions" add constraint "bs_investor_distributions_investor_id_fkey" FOREIGN KEY (investor_id) REFERENCES contact(id) not valid;

alter table "public"."bs_investor_distributions" validate constraint "bs_investor_distributions_investor_id_fkey";

alter table "public"."bs_investor_distributions" add constraint "bs_investor_distributions_statement_id_fkey" FOREIGN KEY (statement_id) REFERENCES bs_investor_statements(id) ON DELETE CASCADE not valid;

alter table "public"."bs_investor_distributions" validate constraint "bs_investor_distributions_statement_id_fkey";

alter table "public"."bs_investor_statements" add constraint "bs_investor_statements_investor_id_fkey" FOREIGN KEY (investor_id) REFERENCES contact(id) ON DELETE RESTRICT not valid;

alter table "public"."bs_investor_statements" validate constraint "bs_investor_statements_investor_id_fkey";

alter table "public"."bs_investor_transactions" add constraint "bs_investor_distribution_payments_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON UPDATE CASCADE not valid;

alter table "public"."bs_investor_transactions" validate constraint "bs_investor_distribution_payments_deal_id_fkey";

alter table "public"."bs_investor_transactions" add constraint "bs_investor_transactions_instrument_id_fkey" FOREIGN KEY (instrument_id) REFERENCES bs_debt_instruments(id) not valid;

alter table "public"."bs_investor_transactions" validate constraint "bs_investor_transactions_instrument_id_fkey";

alter table "public"."bs_investor_transactions" add constraint "bs_investor_transactions_investor_id_fkey" FOREIGN KEY (investor_id) REFERENCES contact(id) not valid;

alter table "public"."bs_investor_transactions" validate constraint "bs_investor_transactions_investor_id_fkey";

alter table "public"."bs_investor_transactions_references" add constraint "transaction_references_transaction_id_fkey" FOREIGN KEY (transaction_id) REFERENCES bs_investor_transactions(id) ON DELETE CASCADE not valid;

alter table "public"."bs_investor_transactions_references" validate constraint "transaction_references_transaction_id_fkey";

alter table "public"."cba_requests" add constraint "cba_submission_credit_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) not valid;

alter table "public"."cba_requests" validate constraint "cba_submission_credit_deal_id_fkey";

alter table "public"."cba_requests" add constraint "cba_submission_credit_id_key" UNIQUE using index "cba_submission_credit_id_key";

alter table "public"."cba_requests" add constraint "cba_submission_credit_submitted_by_fkey" FOREIGN KEY (submitted_by) REFERENCES user_profile(id) not valid;

alter table "public"."cba_requests" validate constraint "cba_submission_credit_submitted_by_fkey";

alter table "public"."cba_requests" add constraint "cba_submission_credit_uw_prequal_result_background_fkey" FOREIGN KEY (uw_prequal_result_background) REFERENCES select_uw_outcomes(id) not valid;

alter table "public"."cba_requests" validate constraint "cba_submission_credit_uw_prequal_result_background_fkey";

alter table "public"."cba_requests" add constraint "cba_submission_credit_uw_prequal_result_credit_fkey" FOREIGN KEY (uw_prequal_result_credit) REFERENCES select_uw_outcomes(id) not valid;

alter table "public"."cba_requests" validate constraint "cba_submission_credit_uw_prequal_result_credit_fkey";

alter table "public"."company" add constraint "company_primary_guarantor_id_fkey" FOREIGN KEY (primary_guarantor_id) REFERENCES company_member(member_id) ON UPDATE CASCADE not valid;

alter table "public"."company" validate constraint "company_primary_guarantor_id_fkey";

alter table "public"."company_contact" add constraint "company_contact_co_id_fkey" FOREIGN KEY (co_id) REFERENCES company(co_id) ON DELETE CASCADE not valid;

alter table "public"."company_contact" validate constraint "company_contact_co_id_fkey";

alter table "public"."company_contact" add constraint "company_contact_contact_id_fkey" FOREIGN KEY (contact_id) REFERENCES contact(id) ON DELETE CASCADE not valid;

alter table "public"."company_contact" validate constraint "company_contact_contact_id_fkey";

alter table "public"."company_contact" add constraint "company_contact_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE SET NULL not valid;

alter table "public"."company_contact" validate constraint "company_contact_deal_id_fkey";

alter table "public"."company_contact" add constraint "unique_company_contact" UNIQUE using index "unique_company_contact";

alter table "public"."company_member" add constraint "company_member_member_borrower_id_fkey" FOREIGN KEY (member_borrower_id) REFERENCES borrower(id) ON DELETE CASCADE not valid;

alter table "public"."company_member" validate constraint "company_member_member_borrower_id_fkey";

alter table "public"."company_member" add constraint "company_member_member_company_id_fkey" FOREIGN KEY (member_company_id) REFERENCES company(co_id) ON DELETE CASCADE not valid;

alter table "public"."company_member" validate constraint "company_member_member_company_id_fkey";

alter table "public"."company_member" add constraint "company_member_member_owning_company_id_fkey" FOREIGN KEY (member_owning_company_id) REFERENCES company(co_id) ON DELETE SET NULL not valid;

alter table "public"."company_member" validate constraint "company_member_member_owning_company_id_fkey";

alter table "public"."company_roles" add constraint "company_roles_co_id_fkey" FOREIGN KEY (co_id) REFERENCES company(co_id) ON DELETE CASCADE not valid;

alter table "public"."company_roles" validate constraint "company_roles_co_id_fkey";

alter table "public"."company_roles" add constraint "company_roles_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON UPDATE CASCADE ON DELETE SET NULL not valid;

alter table "public"."company_roles" validate constraint "company_roles_deal_id_fkey";

alter table "public"."company_roles" add constraint "company_roles_role_id_fkey" FOREIGN KEY (role_id) REFERENCES company_roles_defined(id) ON DELETE CASCADE not valid;

alter table "public"."company_roles" validate constraint "company_roles_role_id_fkey";

alter table "public"."company_roles" add constraint "unique_company_role_deal" UNIQUE using index "unique_company_role_deal";

alter table "public"."company_roles_defined" add constraint "company_role_mm_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."company_roles_defined" validate constraint "company_role_mm_deal_id_fkey";

alter table "public"."company_roles_defined" add constraint "company_role_name_key" UNIQUE using index "company_role_name_key";

alter table "public"."constants" add constraint "constants_name_key" UNIQUE using index "constants_name_key";

alter table "public"."contact" add constraint "contact_company_id_fkey" FOREIGN KEY (company_id) REFERENCES company(co_id) not valid;

alter table "public"."contact" validate constraint "contact_company_id_fkey";

alter table "public"."contact" add constraint "contact_user_id_fkey" FOREIGN KEY (user_id) REFERENCES user_profile(id) not valid;

alter table "public"."contact" validate constraint "contact_user_id_fkey";

alter table "public"."contact_types_jt" add constraint "contact_types_jt_id_key" UNIQUE using index "contact_types_jt_id_key";

alter table "public"."contact_types_jt" add constraint "public_contact_contact_types_contact_id_fkey" FOREIGN KEY (contact_id) REFERENCES contact(id) ON DELETE CASCADE not valid;

alter table "public"."contact_types_jt" validate constraint "public_contact_contact_types_contact_id_fkey";

alter table "public"."contact_types_jt" add constraint "public_contact_contact_types_contact_types_id_fkey" FOREIGN KEY (contact_types_id) REFERENCES contact_types(id) ON DELETE CASCADE not valid;

alter table "public"."contact_types_jt" validate constraint "public_contact_contact_types_contact_types_id_fkey";

alter table "public"."custom_loan_fees" add constraint "public_custom_loan_fees_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) not valid;

alter table "public"."custom_loan_fees" validate constraint "public_custom_loan_fees_deal_id_fkey";

alter table "public"."deal" add constraint "deal_appraisal_poc_contact_id_fkey" FOREIGN KEY (appraisal_poc_contact_id) REFERENCES contact(id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_appraisal_poc_contact_id_fkey";

alter table "public"."deal" add constraint "deal_broker_company_id_fkey" FOREIGN KEY (broker_company_id) REFERENCES company(co_id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_broker_company_id_fkey";

alter table "public"."deal" add constraint "deal_closing_agent_contact_id_fkey" FOREIGN KEY (closing_agent_contact_id) REFERENCES contact(id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_closing_agent_contact_id_fkey";

alter table "public"."deal" add constraint "deal_escrow_company_id_fkey" FOREIGN KEY (escrow_company_id) REFERENCES company(co_id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_escrow_company_id_fkey";

alter table "public"."deal" add constraint "deal_escrow_contact_id_fkey" FOREIGN KEY (escrow_contact_id) REFERENCES contact(id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_escrow_contact_id_fkey";

alter table "public"."deal" add constraint "deal_fourth_guarantor_id_fkey" FOREIGN KEY (fourth_guarantor_id) REFERENCES guarantor(guarantor_id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_fourth_guarantor_id_fkey";

alter table "public"."deal" add constraint "deal_insurance_carrier_company_id_fkey" FOREIGN KEY (insurance_carrier_company_id) REFERENCES company(co_id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_insurance_carrier_company_id_fkey";

alter table "public"."deal" add constraint "deal_insurance_carrier_contact_id_fkey" FOREIGN KEY (insurance_carrier_contact_id) REFERENCES contact(id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_insurance_carrier_contact_id_fkey";

alter table "public"."deal" add constraint "deal_loan_buyer_company_id_fkey" FOREIGN KEY (loan_buyer_company_id) REFERENCES company(co_id) not valid;

alter table "public"."deal" validate constraint "deal_loan_buyer_company_id_fkey";

alter table "public"."deal" add constraint "deal_loan_buyer_contact_id_fkey" FOREIGN KEY (loan_buyer_contact_id) REFERENCES contact(id) not valid;

alter table "public"."deal" validate constraint "deal_loan_buyer_contact_id_fkey";

alter table "public"."deal" add constraint "deal_loan_opener_id_fkey" FOREIGN KEY (loan_opener_id) REFERENCES user_profile(id) not valid;

alter table "public"."deal" validate constraint "deal_loan_opener_id_fkey";

alter table "public"."deal" add constraint "deal_loan_processor_id_fkey" FOREIGN KEY (loan_processor_id) REFERENCES user_profile(id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_loan_processor_id_fkey";

alter table "public"."deal" add constraint "deal_primary_guarantor_id_fkey" FOREIGN KEY (primary_guarantor_id) REFERENCES guarantor(guarantor_id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_primary_guarantor_id_fkey";

alter table "public"."deal" add constraint "deal_second_guarantor_id_fkey" FOREIGN KEY (second_guarantor_id) REFERENCES guarantor(guarantor_id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_second_guarantor_id_fkey";

alter table "public"."deal" add constraint "deal_third_guarantor_id_fkey" FOREIGN KEY (third_guarantor_id) REFERENCES guarantor(guarantor_id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_third_guarantor_id_fkey";

alter table "public"."deal" add constraint "deal_title_company_id_fkey" FOREIGN KEY (title_company_id) REFERENCES company(co_id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_title_company_id_fkey";

alter table "public"."deal" add constraint "public_deal_account_executive_id_fkey" FOREIGN KEY (account_executive_id) REFERENCES user_profile(id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "public_deal_account_executive_id_fkey";

alter table "public"."deal" add constraint "public_deal_broker_id_fkey" FOREIGN KEY (broker_id) REFERENCES contact(id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "public_deal_broker_id_fkey";

alter table "public"."deal" add constraint "public_deal_company_id_fkey" FOREIGN KEY (company_id) REFERENCES company(co_id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "public_deal_company_id_fkey";

alter table "public"."deal" add constraint "public_deal_property_id_fkey" FOREIGN KEY (property_id) REFERENCES property(id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "public_deal_property_id_fkey";

alter table "public"."deal" add constraint "public_deal_title_company_contact_id_fkey" FOREIGN KEY (title_company_contact_id) REFERENCES contact(id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "public_deal_title_company_contact_id_fkey";

alter table "public"."deal_appraisals" add constraint "deal_appraisals_appraisal_id_fkey" FOREIGN KEY (appraisal_id) REFERENCES appraisal(id) ON DELETE SET NULL not valid;

alter table "public"."deal_appraisals" validate constraint "deal_appraisals_appraisal_id_fkey";

alter table "public"."deal_appraisals" add constraint "deal_appraisals_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE SET NULL not valid;

alter table "public"."deal_appraisals" validate constraint "deal_appraisals_deal_id_fkey";

alter table "public"."deal_appraisals" add constraint "deal_appraisals_property_Id_fkey" FOREIGN KEY ("property_Id") REFERENCES property(id) ON DELETE SET NULL not valid;

alter table "public"."deal_appraisals" validate constraint "deal_appraisals_property_Id_fkey";

alter table "public"."deal_appraisals" add constraint "unique_deal_appraisal" UNIQUE using index "unique_deal_appraisal";

alter table "public"."deal_property" add constraint "public_deal_property_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE CASCADE not valid;

alter table "public"."deal_property" validate constraint "public_deal_property_deal_id_fkey";

alter table "public"."deal_property" add constraint "public_deal_property_property_id_fkey" FOREIGN KEY (property_id) REFERENCES property(id) not valid;

alter table "public"."deal_property" validate constraint "public_deal_property_property_id_fkey";

alter table "public"."deal_roles" add constraint "public_deal_roles_contact_id_fkey" FOREIGN KEY (contact_id) REFERENCES contact(id) ON DELETE CASCADE not valid;

alter table "public"."deal_roles" validate constraint "public_deal_roles_contact_id_fkey";

alter table "public"."deal_roles" add constraint "public_deal_roles_contact_types_id_fkey" FOREIGN KEY (contact_types_id) REFERENCES contact_types(id) ON DELETE CASCADE not valid;

alter table "public"."deal_roles" validate constraint "public_deal_roles_contact_types_id_fkey";

alter table "public"."deal_roles" add constraint "public_deal_roles_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE CASCADE not valid;

alter table "public"."deal_roles" validate constraint "public_deal_roles_deal_id_fkey";

alter table "public"."document_files" add constraint "documents_borrower_id_fkey" FOREIGN KEY (borrower_id) REFERENCES borrower(id) ON DELETE CASCADE not valid;

alter table "public"."document_files" validate constraint "documents_borrower_id_fkey";

alter table "public"."document_files" add constraint "documents_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE CASCADE not valid;

alter table "public"."document_files" validate constraint "documents_deal_id_fkey";

alter table "public"."document_files" add constraint "documents_entity_id_fkey" FOREIGN KEY (entity_id) REFERENCES company(co_id) ON DELETE CASCADE not valid;

alter table "public"."document_files" validate constraint "documents_entity_id_fkey";

alter table "public"."document_files" add constraint "documents_guarantor_id_fkey" FOREIGN KEY (guarantor_id) REFERENCES guarantor(guarantor_id) not valid;

alter table "public"."document_files" validate constraint "documents_guarantor_id_fkey";

alter table "public"."document_files" add constraint "documents_property_id_fkey" FOREIGN KEY (property_id) REFERENCES property(id) not valid;

alter table "public"."document_files" validate constraint "documents_property_id_fkey";

alter table "public"."guarantor" add constraint "guarantor_borrower_id_fkey" FOREIGN KEY (borrower_id) REFERENCES borrower(id) ON DELETE CASCADE not valid;

alter table "public"."guarantor" validate constraint "guarantor_borrower_id_fkey";

alter table "public"."guarantor" add constraint "guarantor_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE CASCADE not valid;

alter table "public"."guarantor" validate constraint "guarantor_deal_id_fkey";

alter table "public"."loan_application" add constraint "loan_application_application_deal_id_fkey" FOREIGN KEY (application_deal_id) REFERENCES deal(id) ON DELETE SET NULL not valid;

alter table "public"."loan_application" validate constraint "loan_application_application_deal_id_fkey";

alter table "public"."loan_price" add constraint "deal_program_row_index_constraint" UNIQUE using index "deal_program_row_index_constraint";

alter table "public"."loan_price" add constraint "loan_price_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE CASCADE not valid;

alter table "public"."loan_price" validate constraint "loan_price_deal_id_fkey";

alter table "public"."loan_price_saved" add constraint "loan_price_saved_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE CASCADE not valid;

alter table "public"."loan_price_saved" validate constraint "loan_price_saved_deal_id_fkey";

alter table "public"."loan_price_saved" add constraint "loan_price_saved_loan_price_id_fkey" FOREIGN KEY (loan_price_id) REFERENCES loan_price(id) ON DELETE CASCADE not valid;

alter table "public"."loan_price_saved" validate constraint "loan_price_saved_loan_price_id_fkey";

alter table "public"."loan_program_a" add constraint "loan_program_a_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE CASCADE not valid;

alter table "public"."loan_program_a" validate constraint "loan_program_a_deal_id_fkey";

alter table "public"."loan_program_a" add constraint "loan_program_a_deal_id_key" UNIQUE using index "loan_program_a_deal_id_key";

alter table "public"."loan_program_b" add constraint "loan_program_b_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE CASCADE not valid;

alter table "public"."loan_program_b" validate constraint "loan_program_b_deal_id_fkey";

alter table "public"."loan_program_b" add constraint "loan_program_b_deal_id_key" UNIQUE using index "loan_program_b_deal_id_key";

alter table "public"."ltv_band" add constraint "ltv_band_name_key" UNIQUE using index "ltv_band_name_key";

alter table "public"."milestones" add constraint "milestones_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE CASCADE not valid;

alter table "public"."milestones" validate constraint "milestones_deal_id_fkey";

alter table "public"."milestones" add constraint "milestones_milestone_template_id_fkey" FOREIGN KEY (milestone_template_id) REFERENCES milestone_templates(id) not valid;

alter table "public"."milestones" validate constraint "milestones_milestone_template_id_fkey";

alter table "public"."payroll_submission" add constraint "payroll_submission_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON UPDATE CASCADE ON DELETE SET NULL not valid;

alter table "public"."payroll_submission" validate constraint "payroll_submission_deal_id_fkey";

alter table "public"."payroll_submission_fees_1099" add constraint "payroll_submission_fees_1099_broker_id_fkey" FOREIGN KEY (broker_id) REFERENCES contact(id) ON UPDATE CASCADE ON DELETE SET NULL not valid;

alter table "public"."payroll_submission_fees_1099" validate constraint "payroll_submission_fees_1099_broker_id_fkey";

alter table "public"."payroll_submission_fees_1099" add constraint "payroll_submission_fees_1099_payroll_submission_id_fkey" FOREIGN KEY (payroll_submission_id) REFERENCES payroll_submission(id) ON UPDATE CASCADE ON DELETE SET NULL not valid;

alter table "public"."payroll_submission_fees_1099" validate constraint "payroll_submission_fees_1099_payroll_submission_id_fkey";

alter table "public"."property" add constraint "property_hoa_contact_fkey" FOREIGN KEY (hoa_contact) REFERENCES contact(id) ON UPDATE CASCADE ON DELETE SET NULL not valid;

alter table "public"."property" validate constraint "property_hoa_contact_fkey";

alter table "public"."property_income" add constraint "property_income_property_id_fkey" FOREIGN KEY (property_id) REFERENCES property(id) not valid;

alter table "public"."property_income" validate constraint "property_income_property_id_fkey";

alter table "public"."property_reapi" add constraint "property_reapi_address_zip5_check" CHECK ((length(address_zip5) = 5)) not valid;

alter table "public"."property_reapi" validate constraint "property_reapi_address_zip5_check";

alter table "public"."property_reapi" add constraint "property_reapi_id_key" UNIQUE using index "property_reapi_id_key";

alter table "public"."property_reapi" add constraint "property_reapi_pinfo_address_zip4_check" CHECK ((length(address_zip4) = 4)) not valid;

alter table "public"."property_reapi" validate constraint "property_reapi_pinfo_address_zip4_check";

alter table "public"."property_reapi" add constraint "property_reapi_property_id_fkey" FOREIGN KEY (property_id) REFERENCES property(id) not valid;

alter table "public"."property_reapi" validate constraint "property_reapi_property_id_fkey";

alter table "public"."property_reapi" add constraint "property_reapi_tax_year_check" CHECK ((tax_year = 4)) not valid;

alter table "public"."property_reapi" validate constraint "property_reapi_tax_year_check";

alter table "public"."select_uw_outcomes" add constraint "uw_result_id_key" UNIQUE using index "uw_result_id_key";

alter table "public"."task_templates" add constraint "task_templates_assigned_to_fkey" FOREIGN KEY (assigned_to) REFERENCES user_profile(id) not valid;

alter table "public"."task_templates" validate constraint "task_templates_assigned_to_fkey";

alter table "public"."task_templates" add constraint "task_templates_milestone_template_id_fkey" FOREIGN KEY (milestone_template_id) REFERENCES milestone_templates(id) not valid;

alter table "public"."task_templates" validate constraint "task_templates_milestone_template_id_fkey";

alter table "public"."tasks" add constraint "Tasks_id_key" UNIQUE using index "Tasks_id_key";

alter table "public"."tasks" add constraint "tasks_assigned_to_fkey" FOREIGN KEY (assigned_to) REFERENCES user_profile(id) not valid;

alter table "public"."tasks" validate constraint "tasks_assigned_to_fkey";

alter table "public"."tasks" add constraint "tasks_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE SET NULL not valid;

alter table "public"."tasks" validate constraint "tasks_deal_id_fkey";

alter table "public"."tasks" add constraint "tasks_milestone_id_fkey" FOREIGN KEY (milestone_id) REFERENCES milestones(id) ON DELETE CASCADE not valid;

alter table "public"."tasks" validate constraint "tasks_milestone_id_fkey";

alter table "public"."user_clerk_orgs" add constraint "user_clerk_orgs_slug_key" UNIQUE using index "user_clerk_orgs_slug_key";

alter table "public"."user_clerk_orgs_members" add constraint "user_org_memberships_user_id_fkey" FOREIGN KEY (user_id) REFERENCES user_profile(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."user_clerk_orgs_members" validate constraint "user_org_memberships_user_id_fkey";

alter table "public"."user_profile" add constraint "profiles_username_key" UNIQUE using index "profiles_username_key";

alter table "public"."user_profile" add constraint "user_profile_contact_id_fkey" FOREIGN KEY (contact_id) REFERENCES contact(id) not valid;

alter table "public"."user_profile" validate constraint "user_profile_contact_id_fkey";

alter table "public"."user_profile" add constraint "username_length" CHECK ((char_length(username) >= 3)) not valid;

alter table "public"."user_profile" validate constraint "username_length";

alter table "public"."bs_investor_deals" add constraint "bs_investor_deals_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE CASCADE not valid;

alter table "public"."bs_investor_deals" validate constraint "bs_investor_deals_deal_id_fkey";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.add_individual_documents_disabled()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$BEGIN
  IF NEW.id is not null THEN
    --PERFORM add_documents('Individual', NEW.id);
    insert into documents 
      (name, borrower_id, status, category, role) 
    values
      ('Drivers License', NEW.id, 'Pending Submission', 'ID', 'Borrower/Broker'),
      ('Passport', NEW.id, 'Pending Submission', 'ID', 'Borrower/Broker'),
      ('Asset Statements - 2 Months Trailing', NEW.id, 'Pending Submission', 'Assets', 'Borrower/Broker'),
      ('Credit & Background Authorization', NEW.id, 'Pending Submission', 'Credit & Background', 'Borrower/Broker'),
      ('Credit Report', NEW.id, 'Pending Submission', 'Credit & Background', 'Loan Opener'),
      ('Credit Report Invoice', NEW.id, 'Pending Submission', 'Credit & Background', 'Loan Opener'),
      ('Background Report - Guarantor(s)', NEW.id, 'Pending Submission', 'Credit & Background', 'Loan Opener'),
      ('Background Report - Entity', NEW.id, 'Pending Submission', 'Credit & Background', 'Loan Opener');
    
    IF NEW.citizenship != 'Foreign National' THEN
      insert into documents 
        (name, borrower_id, status, category, role)
      values
        ('Passport', NEW.id, 'Pending Submission', 'ID', 'Borrower/Broker');
    END IF;
  END IF;
  RETURN NEW;
END;$function$
;

CREATE OR REPLACE FUNCTION public.create_company_from_submission(submission_data jsonb)
 RETURNS bigint
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
  company_id bigint;
BEGIN
  BEGIN
      insert into company (co_name, co_ein, co_website, co_ppb_address_street, co_ppb_address_suite_apt,
      co_ppb_address_city, co_ppb_address_state_long, co_ppb_address_postal_code, co_ppb_address_country, 
      co_phone, co_date_established, co_state_of_formation_long, co_entity_type, co_role)
      values(
        submission_data->>'vestingEntityName',
        submission_data->>'vestingEntityEIN',
        submission_data->>'vestingEntityWebsite',
        submission_data->>'vestingEntityAddressStreet',
        submission_data->>'vestingEntityAddressSuiteApt',
        submission_data->>'vestingEntityAddressCity',
        CAST(submission_data->>'vestingEntityAddressState' AS us_states_long),
        submission_data->>'vestingEntityAddressPostalCode',
        CAST(
            CASE 
                WHEN submission_data->>'vestingEntityAddressCountry' = 'US' THEN 'United States'
                ELSE submission_data->>'vestingEntityAddressCountry'
            END AS country_enum
        ),
        submission_data->>'vestingEntityPhone',
        TO_DATE(submission_data->>'vestingEntityDateEstablished', 'YYYY-MM-DD'),
        CAST(submission_data->>'vestingEntityStateOfFormation' AS us_states_long),
        CAST(submission_data->>'entityType' AS entity_type),
        'Borrowing Entity'::company_role
     )
     returning co_id into company_id;
  EXCEPTION
    WHEN OTHERS THEN
    -- Log the error (optional)
      RAISE LOG 'Error creating company from loan application submission: %', SQLERRM;
      RAISE EXCEPTION 'Error creating company from loan application submission: %', SQLERRM;
  END;
  RETURN company_id;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.create_company_member_from_submission(submission_data jsonb, index integer, company_id bigint)
 RETURNS bigint
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
  new_member_id bigint;
  is_guarantor boolean;
BEGIN
      is_guarantor := get_jsonb_array_element(submission_data->'companyMemberIsGuarantor', index) = 'Yes';
      IF is_guarantor THEN
        insert into company_member (member_company_id, guarantor, member_name_first, member_name_last, member_name_middle, member_title,
        member_ownership_percentage, member_email_address, member_cell_phone, social_security_number, citizenship, date_of_birth, marital_status, 
        first_time_home_buyer, mortgage_debt, primary_residence_address_street, primary_residence_address_suite_apt, primary_residence_address_city, primary_residence_address_state_long, primary_residence_address_postal_code, primary_residence_address_country, primary_residence_occupancy_start_date, primary_residence_ownership)
        values(
          company_id,
          true,
          get_jsonb_array_element(submission_data->'individualGuarantorFirstName', index),
          get_jsonb_array_element(submission_data->'individualGuarantorLastName', index),
          get_jsonb_array_element(submission_data->'individualGuarantorMiddleName', index),
          get_jsonb_array_element(submission_data->'individualGuarantorTitle', index),
          CAST(NULLIF(get_jsonb_array_element(submission_data->'individualGuarantorOwnership', index), '') AS double precision)/100,
          get_jsonb_array_element(submission_data->'individualGuarantorEmail', index),
          get_jsonb_array_element(submission_data->'individualGuarantorCellPhone', index),
          get_jsonb_array_element(submission_data->'individualGuarantorSSN', index),
          CAST(get_jsonb_array_element(submission_data->'individualGuarantorCitizenship', index) AS citizenship),
          TO_DATE(get_jsonb_array_element(submission_data->'individualGuarantorDateOfBirth', index), 'YYYY-MM-DD'),
          CAST(get_jsonb_array_element(submission_data->'individualGuarantorMaritalStatus', index) AS marital_status),
          CAST(get_jsonb_array_element(submission_data->'individualGuarantorFirstTimeHomeBuyer', index) AS yes_no),
          CAST(NULLIF(get_jsonb_array_element(submission_data->'individualGuarantorMortgageDebt', index), '') AS NUMERIC),
          get_jsonb_array_element(submission_data->'individualGuarantorAddress', index),
          get_jsonb_array_element(submission_data->'individualGuarantorAddressLine2', index),
          get_jsonb_array_element(submission_data->'individualGuarantorCity', index),
          CAST(get_jsonb_array_element(submission_data->'individualGuarantorState', index) AS us_states_long),
          get_jsonb_array_element(submission_data->'individualGuarantorPostalCode', index),
          get_jsonb_array_element(submission_data->'individualGuarantorCountry', index),
          TO_DATE(get_jsonb_array_element(submission_data->'individualGuarantorOccupancyStartDate', index), 'YYYY-MM-DD'),
          CAST(get_jsonb_array_element(submission_data->'individualGuarantorResidenceOwnership', index) AS residence_ownership)
        )
        returning member_id into new_member_id;
      ELSE 
        insert into company_member (member_company_id, guarantor, member_name_first, member_name_last, member_name_middle, member_title,
        member_ownership_percentage, member_email_address, member_cell_phone)
          values(
            company_id,
            false,
            get_jsonb_array_element(submission_data->'individualGuarantorFirstName', index),
            get_jsonb_array_element(submission_data->'individualGuarantorLastName', index),
            get_jsonb_array_element(submission_data->'individualGuarantorMiddleName', index),
            get_jsonb_array_element(submission_data->'individualGuarantorTitle', index),
            CAST(NULLIF(get_jsonb_array_element(submission_data->'individualGuarantorOwnership', index), '') AS double precision)/100,
            get_jsonb_array_element(submission_data->'individualGuarantorEmail', index),
            get_jsonb_array_element(submission_data->'individualGuarantorCellPhone', index)
        )
        returning member_id into new_member_id;
      END IF;
      
      RETURN new_member_id;
EXCEPTION
    WHEN OTHERS THEN
    -- Log the error (optional)
      RAISE LOG 'Error creating company member from loan application submission: %', SQLERRM;
      RAISE EXCEPTION 'Error creating company member from loan application submission: %', SQLERRM;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.create_deal_from_submission(submission_data jsonb, new_property_id bigint)
 RETURNS bigint
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
  deal_id bigint;
BEGIN
  BEGIN
      insert into deal (status, vesting_type, guarantor_count, lead_source_type, lead_source_name, deal_type, transaction_type, 
        project_type, loan_type, loan_structure, loan_term, date_of_purchase, target_closing_date, 
        payoff_mtg1_amount, loan_amount_total, cash_out_purpose, construction_holdback, property_id )
      values(
        'Scenario'::deal_status_primary,
        CAST(NULLIF(submission_data->>'vestingEntityType', '') AS vesting_type),
        CAST(NULLIF(submission_data->>'numberGuarantors', '') AS numeric),
        CAST(NULLIF(submission_data->>'leadSource', '') AS lead_source),
        submission_data->>'brokerName',
        CAST(NULLIF(submission_data->>'dealType', '') AS loan_type_1),
        CAST(NULLIF(submission_data->>'transactionType', '') AS transaction_type),
        CAST(NULLIF(submission_data->>'projectType', '') AS project_type),
        CAST(NULLIF(submission_data->>'loanType', '') AS loan_type_2),
        CAST(NULLIF(submission_data->>'loanStructure', '') AS loan_structure),
        CAST(NULLIF(submission_data->>'loanTerm', '') AS loan_term),
        TO_DATE(submission_data->>'dateOfPurchase', 'YYYY-MM-DD'),
        TO_DATE(submission_data->>'targetClosingDate', 'YYYY-MM-DD'),
        CAST(NULLIF(submission_data->>'payOffAmount', '') AS numeric),
        CAST(NULLIF(submission_data->>'totalLoanAmount', '') AS numeric),
        submission_data->>'cashOutRefinance',
        CAST(NULLIF(submission_data->>'constructionHoldback', '') AS numeric),
        new_property_id
     )
     returning id into deal_id;
  EXCEPTION
    WHEN OTHERS THEN
    -- Log the error (optional)
      RAISE LOG 'Error creating deal from loan application submission: %', SQLERRM;
      RAISE EXCEPTION 'Error creating deal from loan application submission: %', SQLERRM;
  END;
  RETURN deal_id;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.create_deal_from_submission(submission_data jsonb, new_property_id bigint, new_company_id bigint, new_guarantor_id bigint, new_contact_id bigint, new_contact_2_id bigint, new_contact_3_id bigint, new_contact_4_id bigint)
 RETURNS bigint
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
  deal_id bigint;
  number_of_guarantors int;
  has_additional_guarantors boolean;
BEGIN
  BEGIN
      number_of_guarantors := CAST(NULLIF(submission_data->>'numberGuarantors', '') AS numeric);
      has_additional_guarantors := number_of_guarantors > 1;
      insert into deal (status, vesting_type, guarantor_count, lead_source_type, transaction_type, 
      target_closing_date, loan_amount_total, property_id, company_id, primary_guarantor_id, 
      contact_id, contact_2_id, contact_3_id, contact_4_id, additional_guarantors)
      values(
        'Scenario'::deal_status_primary,
        CAST(submission_data->>'vestingEntityType' AS vesting_type),
        number_of_guarantors,
        CAST(submission_data->>'leadSource' AS lead_source),
        CAST(submission_data->>'transactionType' AS transaction_type),
        TO_DATE(submission_data->>'targetClosingDate', 'YYYY-MM-DD'),
        CAST(NULLIF(submission_data->>'totalLoanAmount', '') AS numeric),
        new_property_id,
        new_company_id,
        new_guarantor_id,
        new_contact_id, 
        new_contact_2_id, 
        new_contact_3_id, 
        new_contact_4_id,
        has_additional_guarantors
     )
     returning id into deal_id;
  EXCEPTION
    WHEN OTHERS THEN
    -- Log the error (optional)
      RAISE LOG 'Error creating deal from loan application submission: %', SQLERRM;
      RAISE EXCEPTION 'Error creating deal from loan application submission: %', SQLERRM;
  END;
  RETURN deal_id;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.create_property_from_submission(submission_data jsonb)
 RETURNS bigint
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
  property_id bigint;
BEGIN
  BEGIN
      insert into property (address_street, address_suite_apt, address_city, address_state_long, address_postal_code,
      address_county, property_type, units, warrantability, hoa_name, purchase_price, value_aiv_estimate, value_arv_estimate,
      short_term_rental, occupancy, income_monthly_gross_rent, income_monthly_fair_market_rent, expense_annual_property_tax, 
      expense_annual_insurance_hoi, expense_annual_insurance_flood, expense_annual_management, expense_annual_association_hoa)
      values(
        submission_data->>'propertyAddress',
        submission_data->>'propertyAddressLine2',
        submission_data->>'propertyCity',
        CAST(NULLIF(submission_data->>'propertyState', '') AS us_states_long),
        submission_data->>'propertyPostalCode',
        submission_data->>'propertyCounty',
        CAST(submission_data->>'propertyType' AS property_type),
        CAST(NULLIF(submission_data->>'propertyUnits', '') AS numeric),
        CAST(NULLIF(submission_data->>'propertyCondominiumType', '') AS warrantability),
        submission_data->>'hoa_name',
        CAST(NULLIF(submission_data->>'propertyPurchasePrice', '') AS numeric),
        CAST(NULLIF(submission_data->>'asIsValue', '') AS numeric),
        CAST(NULLIF(submission_data->>'propertyARV', '') AS numeric),
        CAST(submission_data->>'propertyIsShortRental' AS yes_no),
        CAST(submission_data->>'propertyOccupancy' AS property_occupancy),
        CAST(NULLIF(submission_data->>'propertyIncomeMoGR', '') AS numeric),
        CAST(NULLIF(submission_data->>'propertyIncomeMoFMR', '') AS numeric),
        CAST(NULLIF(submission_data->>'propertyTax', '') AS numeric),
        CAST(NULLIF(submission_data->>'propertyHOI', '') AS numeric),
        CAST(NULLIF(submission_data->>'propertyFloodInsurance', '') AS numeric),
        CAST(NULLIF(submission_data->>'propertyManagementFee', '') AS numeric),
        CAST(NULLIF(submission_data->>'propertyHOAFee', '') AS numeric)
     )
     returning id into property_id;
  EXCEPTION
    WHEN OTHERS THEN
    -- Log the error (optional)
      RAISE LOG 'Error creating property from loan application submission: %', SQLERRM;
      RAISE EXCEPTION 'Error creating property from loan application submission: %', SQLERRM;
  END;
  RETURN property_id;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.create_submission_borrower(fname text, mname text, lname text, email text, cellphone text, otherphone text, citizenstatus citizenship, ssn text, dob date, addstreet text, addstreet2 text, addcity text, addstate us_states_long, addpostal text, addcounty text, addcountry text, fico numeric, rentals numeric, flips numeric, groundups numeric, experience yes_no)
 RETURNS bigint
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
  borrower_id bigint;
BEGIN
  BEGIN
  -- TODO: Check if the borrower exists and if so, return the matching id.
    insert into borrower (first_name, middle_name, last_name, email_address, cell_phone, home_phone, citizenship, social_security_number, date_of_birth, 
      primary_residence_address_street, primary_residence_address_suite_apt, primary_residence_address_city, primary_residence_address_state_long, 
      primary_residence_address_postal_code, primary_residence_address_county, primary_residence_address_country, fico_score_mid_estimate, 
      exp_rentals_owned, exp_flips_sold, exp_ground_ups_sold, has_experience)
    values(fname, mname, lname, email, cellphone, otherphone, citizenstatus, ssn, dob, addstreet, addstreet2, addcity, addstate, addpostal, 
      addcounty, addcountry, fico, rentals, flips, groundups, experience )
    returning id into borrower_id;
  EXCEPTION
    WHEN OTHERS THEN
    -- Log the error (optional)
      RAISE LOG 'Error creating borrower from loan application submission: %', SQLERRM;
      RAISE EXCEPTION 'Error creating borrower from loan application submission: %', SQLERRM;
  END;
  RETURN borrower_id;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.create_submission_contact(fname text, mname text, lname text, email text, cellphone text, otherphone text, citizenstatus citizenship, ssn text, dob date, addstreet text, addstreet2 text, addcity text, addstate us_states_long, addpostal text, addcountry text, fico numeric, rentals numeric, flips numeric, groundups numeric, experience yes_no)
 RETURNS bigint
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$DECLARE
  contact_id bigint;
  user_profile_id bigint;
BEGIN
  BEGIN
    insert into borrower_profile (citizenship, social_security_number, date_of_birth, primary_residence_address_street, primary_residence_address_suite_apt,
      primary_residence_address_city, primary_residence_address_state_long, primary_residence_address_postal_code, primary_residence_address_country, 
      fico_score_mid_estimate, exp_rentals_owned, exp_flips_sold, exp_ground_ups_sold, has_experience)
      values(citizenstatus, ssn, dob, addstreet, addstreet2, addcity, addstate, addpostal, addcountry, fico, rentals, flips, groundups, experience
    )
    returning id into user_profile_id;

    insert into contact (first_name, middle_name, last_name, email_address, cell_phone,
      home_phone, borrower_profile_id, contact_type)
      values(fname, mname, lname, email, cellphone, otherphone, profile_id, 'Borrower'::contact_type)
    returning id into contact_id;
  EXCEPTION
    WHEN OTHERS THEN
    -- Log the error (optional)
      RAISE LOG 'Error creating contact from loan application submission: %', SQLERRM;
      RAISE EXCEPTION 'Error creating contact from loan application submission: %', SQLERRM;
  END;
  RETURN contact_id;
END;$function$
;

CREATE OR REPLACE FUNCTION public.create_submission_guarantor(deal bigint, borrower bigint, fname text, mname text, lname text)
 RETURNS bigint
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
  new_guarantor_id bigint;
BEGIN
  BEGIN
    insert into guarantor (deal_id, borrower_id, first_name, middle_name, last_name)
    values(deal, borrower, fname, mname, lname)
    returning guarantor_id into new_guarantor_id;
  EXCEPTION
    WHEN OTHERS THEN
    -- Log the error (optional)
      RAISE LOG 'Error creating guarantor from loan application submission: %', SQLERRM;
      RAISE EXCEPTION 'Error creating guarantor from loan application submission: %', SQLERRM;
  END;
  RETURN new_guarantor_id;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.create_submission_guarantor(deal bigint, borrower bigint, fname text, mname text, lname text, email text, cell text)
 RETURNS bigint
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
  new_guarantor_id bigint;
BEGIN
  BEGIN
    insert into guarantor (deal_id, borrower_id, first_name, middle_name, last_name, email_address, cell_phone, credit_check)
    values(deal, borrower, fname, mname, lname, email, cell, 'Payment Needed'::credit_check_status)
    returning guarantor_id into new_guarantor_id;
  EXCEPTION
    WHEN OTHERS THEN
    -- Log the error (optional)
      RAISE LOG 'Error creating guarantor from loan application submission: %', SQLERRM;
      RAISE EXCEPTION 'Error creating guarantor from loan application submission: %', SQLERRM;
  END;
  RETURN new_guarantor_id;
END;
$function$
;

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

CREATE OR REPLACE FUNCTION public.get_qualifying_rent(program loan_program, rented yes_no, gross_rent numeric, fmr numeric, transaction_type transaction_type)
 RETURNS numeric
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
declare qualifying_rent numeric;
begin
  if program = 'Program A' then
    if rented = 'Yes' then
      if gross_rent <= fmr then
        qualifying_rent := gross_rent;
      else
        qualifying_rent := fmr;
      end if;
    else 
      qualifying_rent := fmr;
    end if;
  elsif program = 'Program B' then
    if transaction_type <> 'Purchase' then
      if rented = 'Yes' and gross_rent <= 1.1 * fmr then
        qualifying_rent := gross_rent;
      elsif rented = 'Yes' then
        qualifying_rent := 1.1 * fmr;
      else
        qualifying_rent := 0.9 * fmr;
      end if;
    else
      if rented = 'Yes' and gross_rent <= fmr then
        qualifying_rent := gross_rent;
      elsif rented = 'Yes' then
        qualifying_rent := fmr;
      else
        qualifying_rent := fmr;
      end if;
    end if;
  else
    raise notice 'The program - % - is invalid ', program;
  end if;

  return qualifying_rent;
end;

$function$
;

CREATE OR REPLACE FUNCTION public.get_qualifying_rent_by_property(program loan_program, transaction_type transaction_type, property bigint)
 RETURNS numeric
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
declare qualifying_rent numeric;
begin
  
  select sum(get_qualifying_rent(program, pi.tenant_occupied, pi.lease_rent, pi.market_rent_fmr, transaction_type)) 
  into qualifying_rent
  from property_income pi where pi.property_id = property;

  return COALESCE(qualifying_rent,0);
end;

$function$
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

CREATE OR REPLACE FUNCTION public.handle_borrower_profile_changes()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE contactid BIGINT;
BEGIN
    -- Locate the contact ID using `user_profile_id` instead of `borrower_profile_id`
    SELECT id INTO contactid 
    FROM contact 
    WHERE user_profile_id = NEW.id;  -- Ensure `user_profile_id` exists in the `contact` table

    -- Update deal table with new guarantor information
    UPDATE deal 
    SET guarantor_fico_score = NEW.fico_score_mid_actual, 
        guarantor_citizenship = NEW.citizenship, 
        guarantor_first_time_home_buyer = NEW.first_time_home_buyer, 
        guarantor_mortgage_debt = NEW.mortgage_debt
    WHERE primary_guarantor_id = contactid 
      AND deal.locked = false;

    RETURN NEW;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.handle_guarantor_changes()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
  contactId integer;
  midFico integer;
  dealId integer;
BEGIN

    IF TG_OP = 'DELETE' THEN
      dealId := OLD.deal_id;
    ElSE 
      dealId := NEW.deal_id;
    END IF;

    SELECT contact.id INTO contactId
    FROM guarantor, contact, borrower_profile
    WHERE guarantor.deal_id = dealId
    and guarantor.contact_id = contact.id
    and contact.borrower_profile_id = borrower_profile.id
    ORDER BY COALESCE(borrower_profile.fico_score_actual, 0) DESC
    LIMIT 1;

    SELECT
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY COALESCE(borrower_profile.fico_score_actual, 0)) AS median_fico_score_actual
    INTO midFico
    FROM guarantor
    INNER JOIN contact ON guarantor.contact_id = contact.id
    INNER JOIN borrower_profile ON contact.borrower_profile_id = borrower_profile.id
    WHERE guarantor.deal_id = dealId;

    UPDATE deal SET primary_guarantor_id = contactId, mid_fico = midFico
    where deal.id = dealId;

  IF TG_OP = 'DELETE' THEN
    RETURN OLD;
  ElSE 
    RETURN NEW;
  END IF;
END;
$function$
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

create type "public"."ltv_scores" as ("ltv_1" numeric, "ltv_2" numeric, "ltv_3" numeric, "ltv_4" numeric, "ltv_5" numeric, "ltv_6" numeric, "ltv_7" numeric);

create type "public"."max_ltv_scores" as ("purchase_ltv" numeric, "delayed_purchase_ltv" numeric, "refinance_rt_ltv" numeric, "refinance_co_ltv" numeric);

CREATE OR REPLACE FUNCTION public.public_add_property_documents_disabled()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
BEGIN
  IF NEW.id is not null THEN
    --PERFORM add_documents('Property', NEW.id);
    insert into documents 
      (name, property_id, status, category, role) 
    values
      ('Homeowners Insurance Declarations', NEW.id, 'Pending Submission', 'Insurance', 'Borrower/Broker'),
      ('Homeowners Insurance Invoice / Receipt', NEW.id, 'Pending Submission', 'Insurance', 'Borrower/Broker'),
      ('Appraisal Report', NEW.id, 'Pending Submission', 'Appraisal', 'Processor/Broker');

    IF NEW.flood_zone = 'Yes' THEN
      insert into documents 
        (name, property_id, status, category, role) 
      values
        ('Flood Insurance Declarations', NEW.id, 'Pending Submission', 'Insurance', 'Borrower/Broker'),
        ('Flood Insurance Invoice / Receipt', NEW.id, 'Pending Submission', 'Insurance', 'Borrower/Broker');
    END IF;
  END IF;
  RETURN NEW;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.update_credit_check_status(p_id bigint, p_status credit_check_status)
 RETURNS json
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
BEGIN
    -- Check if the record exists
    IF EXISTS (SELECT 1 FROM public.guarantor WHERE guarantor_id = p_id) THEN
        -- Update the status if the record exists
        UPDATE public.guarantor
        SET credit_check = p_status
        WHERE guarantor_id = p_id;

        RETURN json_build_object(
            'status', 'success',
            'message', 'Guarantor status updated successfully.',
            'guarantor_id', p_id,
            'new_status', p_status
        );
    ELSE
        -- Return message if no matching record is found
        RETURN json_build_object(
            'status', 'error',
            'message', 'Guarantor with the specified ID not found.',
            'guarantor_id', p_id
        );
    END IF;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.update_guarantor_info(deal_id bigint, guarantor_id bigint)
 RETURNS void
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
  fico_score integer;
  name text;
  citizenship_status citizenship;
  first_time_home_buyer yes_no;
  mortgage_debt numeric;
BEGIN

    SELECT borrower_profile.citizenship, borrower_profile.first_time_home_buyer, borrower_profile.mortgage_debt, borrower_profile.fico_score_mid_actual
    INTO citizenship_status, first_time_home_buyer, mortgage_debt, fico_score
    FROM contact, borrower_profile
    WHERE contact.id = guarantor_id
    and contact.borrower_profile_id = borrower_profile.id
    LIMIT 1;

    
    UPDATE deal SET guarantor_fico_score = fico_score, guarantor_citizenship = citizenship_status, 
    guarantor_first_time_home_buyer = first_time_home_buyer, guarantor_mortgage_debt = mortgage_debt
    where deal.id = deal_id and deal.locked = false;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.update_member_name_column()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
    NEW."member_name" := NEW."member_name_first" || ' ' || NEW."member_name_last";
    RETURN NEW;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.update_property_address()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$declare 
  new_address text;
begin
  IF length(new.address_state_long::text) > 2 THEN
    new.address_state := get_state_code(new.address_state_long::text);
  END IF;

  new_address := format_address(new.address_street, new.address_suite_apt, new.address_city, new.address_state::text, new.address_postal_code, new.address_country, null);
  
  new.address = new_address;
  return new;
end;$function$
;

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

grant update on table "public"."company_roles_defined" to "service_role";

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

grant update on table "public"."countries" to "service_role";

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

grant update on table "public"."property_reapi" to "service_role";

grant delete on table "public"."rate_adjustment" to "anon";

grant insert on table "public"."rate_adjustment" to "anon";

grant references on table "public"."rate_adjustment" to "anon";

grant select on table "public"."rate_adjustment" to "anon";

grant trigger on table "public"."rate_adjustment" to "anon";

grant truncate on table "public"."rate_adjustment" to "anon";

grant update on table "public"."rate_adjustment" to "anon";

grant delete on table "public"."rate_adjustment" to "authenticated";

grant insert on table "public"."rate_adjustment" to "authenticated";

grant references on table "public"."rate_adjustment" to "authenticated";

grant select on table "public"."rate_adjustment" to "authenticated";

grant trigger on table "public"."rate_adjustment" to "authenticated";

grant truncate on table "public"."rate_adjustment" to "authenticated";

grant update on table "public"."rate_adjustment" to "authenticated";

grant delete on table "public"."rate_adjustment" to "service_role";

grant insert on table "public"."rate_adjustment" to "service_role";

grant references on table "public"."rate_adjustment" to "service_role";

grant select on table "public"."rate_adjustment" to "service_role";

grant trigger on table "public"."rate_adjustment" to "service_role";

grant truncate on table "public"."rate_adjustment" to "service_role";

grant update on table "public"."rate_adjustment" to "service_role";

grant delete on table "public"."select_uw_outcomes" to "anon";

grant insert on table "public"."select_uw_outcomes" to "anon";

grant references on table "public"."select_uw_outcomes" to "anon";

grant select on table "public"."select_uw_outcomes" to "anon";

grant trigger on table "public"."select_uw_outcomes" to "anon";

grant truncate on table "public"."select_uw_outcomes" to "anon";

grant update on table "public"."select_uw_outcomes" to "anon";

grant delete on table "public"."select_uw_outcomes" to "authenticated";

grant insert on table "public"."select_uw_outcomes" to "authenticated";

grant references on table "public"."select_uw_outcomes" to "authenticated";

grant select on table "public"."select_uw_outcomes" to "authenticated";

grant trigger on table "public"."select_uw_outcomes" to "authenticated";

grant truncate on table "public"."select_uw_outcomes" to "authenticated";

grant update on table "public"."select_uw_outcomes" to "authenticated";

grant delete on table "public"."select_uw_outcomes" to "service_role";

grant insert on table "public"."select_uw_outcomes" to "service_role";

grant references on table "public"."select_uw_outcomes" to "service_role";

grant select on table "public"."select_uw_outcomes" to "service_role";

grant trigger on table "public"."select_uw_outcomes" to "service_role";

grant truncate on table "public"."select_uw_outcomes" to "service_role";

grant update on table "public"."select_uw_outcomes" to "service_role";

grant delete on table "public"."task_templates" to "anon";

grant insert on table "public"."task_templates" to "anon";

grant references on table "public"."task_templates" to "anon";

grant select on table "public"."task_templates" to "anon";

grant trigger on table "public"."task_templates" to "anon";

grant truncate on table "public"."task_templates" to "anon";

grant update on table "public"."task_templates" to "anon";

grant delete on table "public"."task_templates" to "authenticated";

grant insert on table "public"."task_templates" to "authenticated";

grant references on table "public"."task_templates" to "authenticated";

grant select on table "public"."task_templates" to "authenticated";

grant trigger on table "public"."task_templates" to "authenticated";

grant truncate on table "public"."task_templates" to "authenticated";

grant update on table "public"."task_templates" to "authenticated";

grant delete on table "public"."task_templates" to "service_role";

grant insert on table "public"."task_templates" to "service_role";

grant references on table "public"."task_templates" to "service_role";

grant select on table "public"."task_templates" to "service_role";

grant trigger on table "public"."task_templates" to "service_role";

grant truncate on table "public"."task_templates" to "service_role";

grant update on table "public"."task_templates" to "service_role";

create policy "Allow auth select"
on "public"."borrower"
as permissive
for select
to authenticated, anon
using (true);


create policy "Balance Sheet Investor or Org Member can view investor deals"
on "public"."bs_investor_deals"
as permissive
for select
to authenticated
using (((EXISTS ( SELECT 1
   FROM (contact c
     JOIN user_profile up ON ((c.user_id = up.id)))
  WHERE ((c.id = bs_investor_deals.contact_id) AND (up.clerk_id = (auth.jwt() ->> 'sub'::text)) AND (up.role = 'balance_sheet_investor'::user_role_internal)))) OR ((EXISTS ( SELECT 1
   FROM (user_profile up2
     JOIN user_clerk_orgs_members uom2 ON ((up2.id = uom2.user_id)))
  WHERE ((up2.clerk_id = (auth.jwt() ->> 'sub'::text)) AND (up2.role = 'balance_sheet_investor'::user_role_internal)))) AND (EXISTS ( SELECT 1
   FROM ((contact c
     JOIN user_profile up ON ((c.user_id = up.id)))
     JOIN user_clerk_orgs_members uom ON ((up.id = uom.user_id)))
  WHERE ((c.id = bs_investor_deals.contact_id) AND (up.role = 'balance_sheet_investor'::user_role_internal) AND (uom.clerk_organization_id IN ( SELECT uom2.clerk_organization_id
           FROM (user_profile up2
             JOIN user_clerk_orgs_members uom2 ON ((up2.id = uom2.user_id)))
          WHERE ((up2.clerk_id = (auth.jwt() ->> 'sub'::text)) AND (up2.role = 'balance_sheet_investor'::user_role_internal))))))))));


create policy "Balance Sheet Investor or Org Member can view distributions"
on "public"."bs_investor_distributions"
as permissive
for select
to authenticated
using (((EXISTS ( SELECT 1
   FROM ((bs_investor_deals bid
     JOIN contact c ON ((bid.contact_id = c.id)))
     JOIN user_profile up ON ((c.user_id = up.id)))
  WHERE ((bid.deal_id = bs_investor_distributions.deal_id) AND (up.clerk_id = (auth.jwt() ->> 'sub'::text)) AND (up.role = 'balance_sheet_investor'::user_role_internal)))) OR ((EXISTS ( SELECT 1
   FROM (((bs_investor_deals bid
     JOIN contact c ON ((bid.contact_id = c.id)))
     JOIN user_profile up ON ((c.user_id = up.id)))
     JOIN user_clerk_orgs_members uom ON ((up.id = uom.user_id)))
  WHERE ((bid.deal_id = bs_investor_distributions.deal_id) AND (uom.clerk_organization_id = bs_investor_distributions.clerk_organization_id) AND (up.role = 'balance_sheet_investor'::user_role_internal)))) AND (EXISTS ( SELECT 1
   FROM (user_profile up2
     JOIN user_clerk_orgs_members uom2 ON ((up2.id = uom2.user_id)))
  WHERE ((up2.clerk_id = (auth.jwt() ->> 'sub'::text)) AND (up2.role = 'balance_sheet_investor'::user_role_internal) AND (uom2.clerk_organization_id = bs_investor_distributions.clerk_organization_id)))))));


create policy "Investor or Org Member can view distributions"
on "public"."bs_investor_distributions"
as permissive
for select
to authenticated
using (((EXISTS ( SELECT 1
   FROM (contact
     JOIN user_profile ON ((contact.user_id = user_profile.id)))
  WHERE ((contact.id = bs_investor_distributions.investor_id) AND (user_profile.clerk_id = (auth.jwt() ->> 'sub'::text))))) OR ((clerk_organization_id = (auth.jwt() ->> 'org_id'::text)) AND (EXISTS ( SELECT 1
   FROM user_profile
  WHERE ((user_profile.clerk_id = (auth.jwt() ->> 'sub'::text)) AND (user_profile.role = 'balance_sheet_investor'::user_role_internal)))))));


create policy "User can view their own distributions"
on "public"."bs_investor_distributions"
as permissive
for select
to authenticated
using ((EXISTS ( SELECT 1
   FROM (contact
     JOIN user_profile ON ((contact.user_id = user_profile.id)))
  WHERE ((contact.id = bs_investor_distributions.investor_id) AND (user_profile.clerk_id = (auth.jwt() ->> 'sub'::text))))));


create policy "Allow API Insert"
on "public"."company"
as permissive
for insert
to anon
with check (true);


create policy "Return data for API insert"
on "public"."company"
as permissive
for select
to public
using (true);


create policy "Users can select their own contact"
on "public"."contact"
as permissive
for select
to authenticated
using ((email_address = (auth.jwt() ->> 'email'::text)));


create policy "Enable read access for all users"
on "public"."deal"
as permissive
for select
to public
using (true);


create policy "Users can select their own documents"
on "public"."document_files"
as permissive
for select
to authenticated
using ((uploaded_by = (auth.uid())::text));


create policy "Allow auth select"
on "public"."guarantor"
as permissive
for select
to authenticated, anon
using (true);


create policy "Allow API Insert"
on "public"."loan_application"
as permissive
for insert
to anon
with check (true);


create policy "Allow insert for auth"
on "public"."loan_price"
as permissive
for insert
to authenticated, anon
with check (true);


create policy "Allow select for auth"
on "public"."loan_price"
as permissive
for select
to authenticated, anon
using (true);


create policy "Allow update for auth"
on "public"."loan_price"
as permissive
for update
to public
using (true);


create policy "Allow insert for auth "
on "public"."loan_program_a"
as permissive
for insert
to authenticated, anon
with check (true);


create policy "Allow select for auth"
on "public"."loan_program_a"
as permissive
for select
to authenticated, anon
using (true);


create policy "Allow update for auth"
on "public"."loan_program_a"
as permissive
for update
to authenticated, anon
using (true);


create policy "Allow insert for auth"
on "public"."loan_program_b"
as permissive
for insert
to public
with check (true);


create policy "Allow select for auth"
on "public"."loan_program_b"
as permissive
for select
to public
using (true);


create policy "Allow update for auth"
on "public"."loan_program_b"
as permissive
for update
to public
using (true);


create policy "Allow auth select"
on "public"."property"
as permissive
for select
to authenticated, anon
using (true);


create policy "Allow authenticated users to select all property_reapi records"
on "public"."property_reapi"
as permissive
for select
to authenticated
using (true);


create policy "Allow users to insert property records"
on "public"."property_reapi"
as permissive
for insert
to authenticated
with check (true);


create policy "Users can select their own profile"
on "public"."user_profile"
as permissive
for select
to authenticated
using ((clerk_id = (auth.jwt() ->> 'sub'::text)));


CREATE TRIGGER set_date_report_expiration BEFORE UPDATE OF date_report_effective ON public.appraisal FOR EACH ROW EXECUTE FUNCTION update_date_report_expiration();

CREATE TRIGGER handle_borrower_profile_changes_trigger AFTER UPDATE OF citizenship, first_time_home_buyer, mortgage_debt, fico_score_mid_actual ON public.borrower FOR EACH ROW EXECUTE FUNCTION handle_user_profile_changes();

CREATE TRIGGER handle_borrower_profile_state_trigger BEFORE INSERT OR UPDATE ON public.borrower FOR EACH ROW EXECUTE FUNCTION update_borrower_address();

CREATE TRIGGER handle_updated_at BEFORE UPDATE ON public.company_member FOR EACH ROW EXECUTE FUNCTION moddatetime('member_updated_at');
ALTER TABLE "public"."company_member" DISABLE TRIGGER "handle_updated_at";

CREATE TRIGGER set_member_name BEFORE INSERT OR UPDATE ON public.company_member FOR EACH ROW EXECUTE FUNCTION update_member_name_column();
ALTER TABLE "public"."company_member" DISABLE TRIGGER "set_member_name";

CREATE TRIGGER handle_updated_at BEFORE UPDATE ON public.contact FOR EACH ROW EXECUTE FUNCTION moddatetime('updated_at');

CREATE TRIGGER add_deal_milestones_tasks_trigger AFTER INSERT ON public.deal FOR EACH ROW EXECUTE FUNCTION add_deal_milestones_and_tasks();
ALTER TABLE "public"."deal" DISABLE TRIGGER "add_deal_milestones_tasks_trigger";

CREATE TRIGGER handle_deal_changes_trigger BEFORE INSERT OR UPDATE ON public.deal FOR EACH ROW EXECUTE FUNCTION handle_deal_changes();

CREATE TRIGGER after_loan_application_insert AFTER INSERT ON public.loan_application FOR EACH ROW EXECUTE FUNCTION handle_new_loan_application();
ALTER TABLE "public"."loan_application" DISABLE TRIGGER "after_loan_application_insert";

CREATE TRIGGER after_loan_application_update AFTER UPDATE ON public.loan_application FOR EACH ROW WHEN (((old.reprocess IS DISTINCT FROM new.reprocess) AND (new.reprocess = true))) EXECUTE FUNCTION handle_new_loan_application();
ALTER TABLE "public"."loan_application" DISABLE TRIGGER "after_loan_application_update";

CREATE TRIGGER handle_updated_at BEFORE UPDATE ON public.loan_price FOR EACH ROW EXECUTE FUNCTION moddatetime('updated_at');

CREATE TRIGGER add_property_documents_trigger AFTER INSERT ON public.property FOR EACH ROW EXECUTE FUNCTION public_add_property_documents_disabled();
ALTER TABLE "public"."property" DISABLE TRIGGER "add_property_documents_trigger";

CREATE TRIGGER handle_property_address_change BEFORE INSERT OR UPDATE OF address_street, address_suite_apt, address_city, address_state, address_postal_code, address_country ON public.property FOR EACH ROW EXECUTE FUNCTION update_property_address();

CREATE TRIGGER handle_property_changes AFTER UPDATE ON public.property FOR EACH ROW EXECUTE FUNCTION handle_property_changes();

CREATE TRIGGER handle_property_changes_trigger AFTER UPDATE ON public.property FOR EACH ROW EXECUTE FUNCTION handle_property_changes();

CREATE TRIGGER handle_updated_at BEFORE UPDATE ON public.property FOR EACH ROW EXECUTE FUNCTION moddatetime('updated_at');

CREATE TRIGGER handle_updated_at BEFORE UPDATE ON public.user_profile FOR EACH ROW EXECUTE FUNCTION moddatetime('updated_at');

CREATE TRIGGER add_individual_documents_trigger AFTER INSERT ON public.borrower FOR EACH ROW EXECUTE FUNCTION add_individual_documents_disabled();
ALTER TABLE "public"."borrower" DISABLE TRIGGER "add_individual_documents_trigger";

CREATE TRIGGER add_entity_documents_trigger AFTER INSERT ON public.company FOR EACH ROW EXECUTE FUNCTION public_add_entity_documents_disabled();
ALTER TABLE "public"."company" DISABLE TRIGGER "add_entity_documents_trigger";

CREATE TRIGGER add_deal_documents_trigger AFTER INSERT ON public.deal FOR EACH ROW EXECUTE FUNCTION public_add_deal_documents_disabled();
ALTER TABLE "public"."deal" DISABLE TRIGGER "add_deal_documents_trigger";


