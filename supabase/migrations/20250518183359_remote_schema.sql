-- TYPE DEFINITIONS (all custom types used in tables, moved to top)
-- (All CREATE TYPE statements for referenced types go here, in any order, but before any table definitions)

CREATE TYPE public.amortization_type as enum ('fixed_rate', 'adjustable_rate');

CREATE TYPE public.appraisal_order_status as enum ('accepted_by_vendor', 'action_required', 'appraiser_waiting_for_contract', 'appraiser_waiting_for_lease', 'appraiser_waiting_for_questionnaire', 'assigned_to_vendor', 'awaiting_confirmation_for_appointment', 'awaiting_fee_approval_from_client', 'awaiting_info_from_client', 'awaiting_trip_fee_approval_to_proceed', 'cancelled', 'completed', 'declined_by_vendor', 'file_in_review', 'in_progress', 'inspected', 'inspection_scheduled', 'left_message_with_contact', 'on_hold', 'order_Is_due_today', 'payment_pending', 'please_submit_report_order_past_due', 'reconsideration_requested', 'reconsideration_requested_urgent', 'report_accepted', 'report_accepted_awaiting_payment', 'revision_requested', 'revision_requested_urgent', 'unassigned', 'unassigned_awaiting_bids');

CREATE TYPE public.appraisal_order_type as enum ('commercial', 'residential');

CREATE TYPE public.citizenship as enum ('U.S. Citizen', 'Permanent Resident', 'Non-Permanent Resident', 'Foreign National');

CREATE TYPE public.company_role as enum ('Borrowing Entity', 'Broker', 'Insurance', 'Legal', 'Title', 'Appraisal', 'Appraisal Management Company', 'Lender', 'Loan Buyer', 'Balance Sheet Investor', 'Environmental', 'Escrow', 'Entity Member (Layer)');

CREATE TYPE public.country_enum as enum ('United States', 'Canada', 'Mexico', 'United Kingdom', 'Australia', 'Germany', 'France', 'Italy', 'Spain', 'Japan', 'China', 'India', 'Brazil', 'Russia', 'South Africa', 'Other');

CREATE TYPE public.condo_type as enum ('warrantable', 'non_warrantable');

CREATE TYPE public.constant_types as enum ('Text', 'Numeric', 'Boolean');

CREATE TYPE public.contact_type as enum ('Appraisal Administration', 'Appraisal Management Company', 'Appraiser', 'Borrower', 'Borrower Assistant', 'Broker', 'Broker Loan Processor', 'General Contractor', 'Entity Member', 'Escrow', 'Insurance', 'Balance Sheet Investor', 'Lender', 'Point of Contact', 'Referring Party', 'Title', 'Transaction Coordinator', 'Loan Buyer');

CREATE TYPE public.continents as enum ('africa', 'antarctica', 'asia', 'europe', 'oceania', 'north_america', 'south_america');

CREATE TYPE public.entity_type as enum ('limited_liability_company', 's_corp', 'limited_partnership', 'general_partnership', 'corp', 'limited_liability_partnership', 'sole_proprietorship');

CREATE TYPE public.debt_instrument_type as enum ('mortgage', 'bridge');

CREATE TYPE public.deal_disposition_1 as enum ('active', 'cancelled', 'funded', 'funded_on_balance_sheet', 'funded_and_sold', 'archive');

CREATE TYPE public.deal_stage_1 as enum ('phase_1_onboarding', 'phase_2_underwriting', 'phase_3_legal_docs', 'phase_4_closing_prep', 'phase_5_post_closing', 'phase_6_qa_compliance', 'phase_7_loan_pool', 'phase_8_loan_sale', 'phase_9_servicing');

CREATE TYPE public.deal_stage_2 as enum ('LOI', 'Docs Out');

CREATE TYPE public.deal_status as enum ('QUALIFIED', 'DENIED', 'NOT QUALIFIED', 'EXPIRED', 'FUNDED', 'TO BE REVIEWED');

CREATE TYPE public.deal_status_primary as enum ('Prequal', 'Scenario', 'Active', 'Complete', 'Dead/Archived');

CREATE TYPE public.deal_status_secondary as enum ('New Lead', 'Pricing', 'Pre-App', 'App Submitted', 'Docs Out', 'Conditions', 'Processing', 'Docs Signed', 'Funded', 'Redeemed', 'Default', 'Declined');

CREATE TYPE public.document_category as enum ('ID', 'Income', 'Assets', 'Title', 'Seasoning', 'Credit & Background', 'Entity', 'Insurance', 'Property', 'Loan', 'Appraisal', 'Financials', 'Ownership', 'Seller', 'Closing');

CREATE TYPE public.document_status as enum ('Pending Submission', 'Under Review', 'Approved', 'Declined (changes needed)', 'N/A');

CREATE TYPE public.credit_check_status AS ENUM ('Frozen', 'Paid', 'Approved', 'Under Review', 'Payment Needed', 'Denied');

CREATE TYPE public.lead_source as enum ('biggerpockets', 'broker', 'brrrr.com_chat', 'brrrr.com_form_submission', 'direct_mail_marketing', 'email_marketing', 'event_conference_tradeshow', 'existing_client', 'podcast', 'search_engine', 'referral', 'social_media', 'other', 'reia');

CREATE TYPE public.lead_source_type as enum ('Direct Email', 'Direct Mail - Print', 'Email - Marketing Blast', 'Google Ads', 'LinkedIn', 'Outbound Call', 'Partner Referral', 'Podcast', 'REIA Event', 'Social Media - Facebook', 'Social Media - Instagram', 'Social Media - LinkedIn', 'Social Media - TikTok', 'Social Media - YouTube', 'Tradeshow', 'Walk-in', 'Website Lead Form', 'Word of Mouth Referral', 'Return Client', 'Other');

CREATE TYPE public.lease_length as enum ('N/A', 'STR', 'Unoccupied', '12', '24', '36');

CREATE TYPE public.ledger_entry_type as enum ('contribution', 'redemption', 'interest', 'fee');

CREATE TYPE public.loan_accrual_type as enum ('30/360', '30/365', 'Actual 360', 'Actual 365');

CREATE TYPE public.loan_amortization as enum ('interest_only', '300', '360');

CREATE TYPE public.loan_program as enum ('BPL Program A', 'BPL Program B');

CREATE TYPE public.loan_structure_dscr as enum ('30_yr_fixed', '5/1_arm', '7/1_arm', '10/1_arm_io', '5/6_arm', '10/6_arm');

CREATE TYPE public.loan_term_months as enum ('6', '12', '15', '18', '24', '36', '48', '60', '72', '84', '96', '108', '120', '300', '360');

CREATE TYPE public.loan_type_1 as enum ('dscr', 'rtl');

CREATE TYPE public.loan_type_2 as enum ('bridge', 'bridge_plus_rehab');

CREATE TYPE public.loan_type_rtl as enum ('ground_up', 'rehab', 'rent_capture');

CREATE TYPE public.marital_status as enum ('Married', 'Separated', 'Unmarried');

CREATE TYPE public.milestone_status as enum ('to_do', 'in_progress', 'completed');

CREATE TYPE public.ppp_structure as enum ('Declining', 'Fixed 5%', 'Fixed 4%', 'Fixed 3%', 'Fixed 2%', 'Fixed 1%', 'Interest', 'Minimum Interest');

CREATE TYPE public.ppp_structure_1 as enum ('declining', 'fixed', 'minimum_interest');

CREATE TYPE public.ppp_term as enum ('0', '12', '24', '36', '48', '60', '72', '84', '96', '108', '120');

CREATE TYPE public.professional_license as enum ('Appraiser', 'Certified Public Accountant (CPA)', 'General Contractor', 'Lender', 'Mortgage (NMLS)', 'Real Estate Broker', 'Property Manager');

CREATE TYPE public.project_status as enum ('Sold', 'Held', 'In Progress');

CREATE TYPE public.project_type as enum ('fix_and_flip', 'ground_up', 'rental', 'stabilized_bridge');

CREATE TYPE public.property_appraisal_status as enum ('Payment Needed', 'Paid', 'Ordered', 'Received', 'Revision Needed', 'Revision Requested', 'Completed');

CREATE TYPE public.property_lease_term_status as enum ('active', 'expired', 'month_to_month');

CREATE TYPE public.property_occupancy as enum ('Vacant', 'Tenant Occupied', 'Owner Occupied');

CREATE TYPE public.property_type as enum ('Single Family', 'Condominium', 'Condominium Warrantable', 'Condominium Non-Warrantable', 'Multifamily 2-4', 'Multifamily 5-10', 'Townhome/PUD', 'Multifamily 11+', 'Mixed Use 2-4', 'Mixed Use 5-10', 'Mixed Use 11+', 'Other');

CREATE TYPE public.transaction_reference_type as enum ('federal_reference_number', 'imad', 'omad');

CREATE TYPE public.residence_ownership as enum ('Own', 'Rent');

CREATE TYPE public.task_status as enum ('not_started', 'in_progress', 'completed');

CREATE TYPE public.transaction_method as enum ('ach', 'billpay', 'cash', 'check', 'credit_card', 'cryptocurrency', 'debit_card', 'internal', 'rtp', 'wire', 'other');

CREATE TYPE public.transaction_status as enum ('canceled', 'completed', 'failed', 'initiated', 'on_hold', 'owed', 'pending', 'processing', 'refunded', 'returned', 'scheduled');

CREATE TYPE public.transaction_type as enum ('purchase', 'delayed_purchase', 'refinance_rate_term', 'refinance_cash_out');

CREATE TYPE public.true_false as enum ('true', 'false');

CREATE TYPE public.us_states as enum ('AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'PR', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY');

CREATE TYPE public.us_states_long as enum ('alabama', 'alaska', 'arizona', 'arkansas', 'california', 'colorado', 'connecticut', 'delaware', 'district_of_columbia', 'florida', 'georgia', 'hawaii', 'idaho', 'illinois', 'indiana', 'iowa', 'kansas', 'kentucky', 'louisiana', 'maine', 'maryland', 'massachusetts', 'michigan', 'minnesota', 'mississippi', 'missouri', 'montana', 'nebraska', 'nevada', 'new_hampshire', 'new_jersey', 'new_mexico', 'new_york', 'north_carolina', 'north_dakota', 'ohio', 'oklahoma', 'oregon', 'pennsylvania', 'rhode_island', 'south_carolina', 'south_dakota', 'tennessee', 'texas', 'utah', 'vermont', 'virginia', 'washington', 'west_virginia', 'wisconsin', 'wyoming');

CREATE TYPE public.vesting_type as enum ('entity', 'Individual');

CREATE TYPE public.warrantability as enum ('warrantable', 'non-warrantable');

CREATE TYPE public.yes_no as enum ('yes', 'no');

CREATE TYPE public.clerk_role as enum ('admin', 'member');

-- END TYPE DEFINITIONS

-- FUNCTION DEFINITIONS (required for triggers)
-- ============================================

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

CREATE OR REPLACE FUNCTION public.public_add_entity_documents_disabled()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
BEGIN
  IF NEW.co_id is not null THEN
    --PERFORM add_documents('Entity', NEW.co_id);
    insert into documents 
      (name, entity_id, status, category, role) 
    values
      ('EIN Letter', NEW.co_id, 'Pending Submission', 'Entity', 'Borrower/Broker'),
      ('Certificate of Good Standing Standing', NEW.co_id, 'Pending Submission', 'Entity', 'Borrower/Broker'),
      ('Operating Agreement', NEW.co_id, 'Pending Submission', 'Entity', 'Borrower/Broker'),
      ('Articles of Organization', NEW.co_id, 'Pending Submission', 'Entity', 'Borrower/Broker');
  END IF;
  RETURN NEW;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.update_company_address()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
begin
  IF length(new.co_ppb_address_state_long::text) > 2 THEN
    new.co_ppb_address_state := get_state_code(new.co_ppb_address_state_long::text);
  END IF;
  IF length(new.co_state_of_formation_long::text) > 2 THEN
    new.co_state_of_formation := get_state_code(new.co_state_of_formation_long::text);
  END IF;

  return new;
end;
$function$
;

CREATE OR REPLACE FUNCTION public.public_add_individual_documents_disabled()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
BEGIN
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
END;
$function$
;

CREATE OR REPLACE FUNCTION public.update_borrower_address()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
begin
  IF length(new.primary_residence_address_state_long::text) > 2 THEN
    new.primary_residence_address_state := get_state_code(new.primary_residence_address_state_long::text);
  END IF;
  IF length(new.previous_residence_address_state_long::text) > 2 THEN
    new.previous_residence_address_state := get_state_code(new.previous_residence_address_state_long::text);
  END IF;
    IF length(new.mailing_address_state_long::text) > 2 THEN
    new.mailing_address_state := get_state_code(new.mailing_address_state_long::text);
  END IF;
  return new;
end;
$function$
;

CREATE OR REPLACE FUNCTION public.handle_property_changes()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
    -- Update the deal_name in the deal table using the formatted address
    UPDATE public.deal
    SET deal_name = public.format_deal_name(NEW.id)
    WHERE property_id = NEW.id;

    RETURN NEW;
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

CREATE OR REPLACE FUNCTION public.update_date_report_expiration()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
    NEW.date_report_expiration := NEW.date_report_effective + INTERVAL '120 days';
    RETURN NEW;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.handle_deal_changes()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
DECLARE
  property_address text;
BEGIN
  --RAISE log 'Running handle_deal_changes function with ID: %', NEW.id;
  IF NEW.property_id IS NOT NULL THEN
    select address into property_address from property where id = NEW.property_id;
    NEW.deal_name := property_address;
  END IF;
  RETURN NEW;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.add_deal_milestones_and_tasks()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
    v_milestone_template RECORD;
    v_task_template RECORD;
    v_new_milestone_id bigint;
BEGIN
    -- Loop through each milestone template and create a corresponding milestone for the new deal
    FOR v_milestone_template IN 
        SELECT * FROM milestone_templates
    LOOP
        -- Insert a new milestone for the deal into the milestones table
        INSERT INTO milestones (deal_id, milestone_order, status, milestone_template_id, email_subject, email_body)
        VALUES (NEW.id, v_milestone_template.milestone_order, 'To Do'::milestone_status, v_milestone_template.id, v_milestone_template.email_template_subject, v_milestone_template.email_template_body )
        RETURNING id INTO v_new_milestone_id;

        -- For each milestone template, find the associated task templates and create tasks for the milestone
        FOR v_task_template IN 
            SELECT * FROM task_templates WHERE milestone_template_id = v_milestone_template.id
        LOOP
            -- Insert a new task for the milestone into the tasks table
            INSERT INTO tasks (deal_id, task_name, task_description, assigned_to, status, milestone_id, task_order, days_until_due)
            VALUES (NEW.id, v_task_template.task_name, v_task_template.task_description, v_task_template.assigned_to,
            v_task_template.status, v_new_milestone_id, v_task_template.task_order, v_task_template.days_until_due);
        END LOOP;
    END LOOP;

    -- Return the new deal record (mandatory for AFTER INSERT triggers)
    RETURN NEW;
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

CREATE OR REPLACE FUNCTION public.public_add_deal_documents_disabled()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$BEGIN
  IF NEW.id is not null THEN
    --PERFORM add_documents('Deal', NEW.id);
    insert into documents 
      (name, deal_id, status, category, role) 
    values
      ('Appraisal Report', NEW.id, 'Pending Submission', 'Appraisal', 'Loan Opener'),
      ('Appraisal Invoice', NEW.id, 'Pending Submission', 'Appraisal', 'Loan Opener'),
      ('Title Commitment', NEW.id, 'Pending Submission', 'Title', 'Processor'),
      ('Title CPL', NEW.id, 'Pending Submission', 'Title', 'Processor'),
      ('Title Wire Instructions', NEW.id, 'Pending Submission', 'Title', 'Processor'),
      ('Title Tax Search', NEW.id, 'Pending Submission', 'Title', 'Processor'),
      ('Title Prelim HUD', NEW.id, 'Pending Submission', 'Title', 'Processor');
    IF NEW.property_id is not null THEN
      IF NEW.loan_type = 'Bridge + Rehab' THEN
        insert into documents 
          (name, property_id, status, category, role) 
        values
          ('Renovation Budget', NEW.property_id, 'Pending Submission', 'Property', 'Borrower/Broker');
      END IF;
      IF NEW.project_type = 'Rental' and (NEW.transaction_type = 'Refinance Rate/Term' or NEW.transaction_type = 'Refinance Cash Out') THEN
        insert into documents 
          (name, property_id, status, category, role) 
        values
          ('Lease(s)', NEW.property_id, 'Pending Submission', 'Property', 'Borrower/Broker'),
          ('Payoff Statement', NEW.property_id, 'Pending Submission', 'Property', 'Borrower/Broker'),
          ('Purchase HUD', NEW.property_id, 'Pending Submission', 'Seasoning', 'Borrower/Broker'),
          ('Completed Rehab Budget', NEW.property_id, 'Pending Submission', 'Seasoning', 'Borrower/Broker');
      END IF;
      IF NEW.project_type = 'Rental' and  NEW.transaction_type = 'Delayed Purchase' THEN
        insert into documents 
          (name, property_id, status, category, role) 
        values
          ('Purchase HUD', NEW.property_id, 'Pending Submission', 'Seasoning', 'Borrower/Broker'),
          ('Completed Rehab Budget', NEW.property_id, 'Pending Submission', 'Seasoning', 'Borrower/Broker');
      END IF;
      IF NEW.transaction_type = 'Purchase' THEN
        insert into documents 
          (name, property_id, status, category, role) 
        values
          ('Purchase Contract', NEW.property_id, 'Pending Submission', 'Property', 'Borrower/Broker'),
          ('Proof of Earnest Money Deposit (EMD)', NEW.property_id, 'Pending Submission', 'Property', 'Borrower/Broker');
      END IF;
    END IF;
  END IF;
  RETURN NEW;
END;$function$
;

-- TABLE DEFINITIONS BEGIN BELOW

create extension if not exists "http" with schema "extensions";

create extension if not exists "moddatetime" with schema "extensions";

create extension if not exists "pg_cron" with schema "extensions";

create extension if not exists "pgaudit" with schema "extensions";

create extension if not exists "wrappers" with schema "extensions";


-- TYPE ALREADY EXISTS: lead_source

-- Types already defined above

create sequence "public"."transaction_references_id_seq";

drop policy "Organization admins can delete organizations" on "public"."user_clerk_orgs";

drop policy "Organization admins can insert organizations" on "public"."user_clerk_orgs";

drop policy "Organization admins can update organizations" on "public"."user_clerk_orgs";

drop policy "Organization members can view organizations" on "public"."user_clerk_orgs";

drop policy "Service role can delete organizations" on "public"."user_clerk_orgs";

drop policy "Service role can insert organizations" on "public"."user_clerk_orgs";

drop policy "Service role can select organizations" on "public"."user_clerk_orgs";

drop policy "Service role can update organizations" on "public"."user_clerk_orgs";

drop policy "Organization admins can delete members" on "public"."user_clerk_orgs_members";

drop policy "Organization admins can insert members" on "public"."user_clerk_orgs_members";

drop policy "Organization admins can update members" on "public"."user_clerk_orgs_members";

drop policy "Organization members can view other members" on "public"."user_clerk_orgs_members";

drop policy "Service role can delete members" on "public"."user_clerk_orgs_members";

drop policy "Service role can insert members" on "public"."user_clerk_orgs_members";

drop policy "Service role can select members" on "public"."user_clerk_orgs_members";

drop policy "Service role can update members" on "public"."user_clerk_orgs_members";

drop policy "Service role can delete sessions" on "public"."user_clerk_sessions";

drop policy "Service role can insert sessions" on "public"."user_clerk_sessions";

drop policy "Service role can select sessions" on "public"."user_clerk_sessions";

drop policy "Service role can update sessions" on "public"."user_clerk_sessions";

drop policy "Users can view their own sessions" on "public"."user_clerk_sessions";

revoke delete on table "public"."user_clerk_sessions" from "anon";

revoke insert on table "public"."user_clerk_sessions" from "anon";

revoke references on table "public"."user_clerk_sessions" from "anon";

revoke select on table "public"."user_clerk_sessions" from "anon";

revoke trigger on table "public"."user_clerk_sessions" from "anon";

revoke truncate on table "public"."user_clerk_sessions" from "anon";

revoke update on table "public"."user_clerk_sessions" from "anon";

revoke delete on table "public"."user_clerk_sessions" from "authenticated";

revoke insert on table "public"."user_clerk_sessions" from "authenticated";

revoke references on table "public"."user_clerk_sessions" from "authenticated";

revoke select on table "public"."user_clerk_sessions" from "authenticated";

revoke trigger on table "public"."user_clerk_sessions" from "authenticated";

revoke truncate on table "public"."user_clerk_sessions" from "authenticated";

revoke update on table "public"."user_clerk_sessions" from "authenticated";

revoke delete on table "public"."user_clerk_sessions" from "service_role";

revoke insert on table "public"."user_clerk_sessions" from "service_role";

revoke references on table "public"."user_clerk_sessions" from "service_role";

revoke select on table "public"."user_clerk_sessions" from "service_role";

revoke trigger on table "public"."user_clerk_sessions" from "service_role";

revoke truncate on table "public"."user_clerk_sessions" from "service_role";

revoke update on table "public"."user_clerk_sessions" from "service_role";

alter table "public"."user_clerk_orgs" drop constraint "user_clerk_orgs_clerk_organization_slug_key";

alter table "public"."user_clerk_orgs_members" drop constraint "user_clerk_orgs_members_clerk_role_check";

alter table "public"."user_clerk_orgs_members" drop constraint "user_clerk_orgs_members_user_id_fkey";

alter table "public"."user_clerk_sessions" drop constraint "user_clerk_sessions_clerk_session_id_key";

alter table "public"."user_clerk_sessions" drop constraint "user_clerk_sessions_clerk_session_status_check";

alter table "public"."user_clerk_sessions" drop constraint "user_clerk_sessions_clerk_user_id_fkey";

alter table "public"."user_clerk_orgs_members" drop constraint "user_clerk_orgs_members_pkey";

alter table "public"."user_clerk_sessions" drop constraint "user_clerk_sessions_pkey";

alter table "public"."user_profile" add column "full_name" text generated always as (TRIM(BOTH FROM ((COALESCE(first_name, ''::text) || ' '::text) || COALESCE(last_name, ''::text)))) stored;

alter table "public"."user_profile" alter column "email" set data type character varying(255) using "email"::character varying(255);

alter table "public"."user_profile" alter column "id" add generated by default as identity;

alter table "public"."user_profile" alter column "is_internal_yn" set default false;

alter table "public"."user_profile" alter column "is_internal_yn" set not null;

alter table "public"."user_profile" alter column "updated_at" set default (now() AT TIME ZONE 'utc'::text);

alter table "public"."user_profile" enable row level security;

-- TABLE DEFINITIONS (dependency order, batch 1)

-- 1. borrower (no FK dependencies)
CREATE TABLE public.borrower (
  id bigint,
  CONSTRAINT borrower_profile_pkey PRIMARY KEY (id),
  primary_residence_address_street text,
  primary_residence_address_suite_apt text,
  primary_residence_address_city text,
  primary_residence_address_state us_states,
  primary_residence_address_postal_code text,
  primary_residence_address_country text,
  primary_residence_occupancy_start_date date,
  primary_residence_ownership residence_ownership,
  previous_residence_address_street text,
  previous_residence_address_suite_apt text,
  previous_residence_address_city text,
  previous_residence_address_state us_states,
  previous_residence_address_postal_code text,
  previous_residence_address_country text,
  mailing_address_is_primary_residence boolean,
  mailing_address_street text,
  mailing_address_suite_apt text,
  mailing_address_po_box text,
  mailing_address_city text,
  mailing_address_state us_states,
  mailing_address_postal_code text,
  mailing_address_country text,
  date_of_birth date,
  social_security_number text,
  citizenship citizenship,
  marital_status marital_status,
  fico_score_mid_estimate smallint,
  fico_score_mid_actual smallint,
  fico_report_date_pulled date,
  exp_ground_ups_sold smallint default 0,
  exp_flips_sold smallint default 0,
  exp_rentals_owned smallint default 0,
  exp_professional_license professional_license,
  created_at timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
  updated_at timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
  mortgage_debt numeric,
  fico_report_date_expiration date,
  first_time_home_buyer yes_no,
  fico_report_score_equifax smallint,
  fico_report_score_experian smallint,
  fico_report_score_transunion smallint,
  primary_residence_address_state_long us_states_long,
  previous_residence_address_state_long us_states_long,
  mailing_address_state_long us_states_long,
  has_experience yes_no,
  credit_check credit_check_status,
  first_name text,
  middle_name text,
  last_name text,
  name text,
  email_address text,
  cell_phone text,
  home_phone text,
  office_phone text,
  primary_residence_address_county text,
  previous_residence_occupancy_start_date date,
  previous_residence_occupancy_end_date date
);
CREATE TRIGGER add_individual_documents_trigger
AFTER INSERT ON public.borrower
FOR EACH ROW
EXECUTE FUNCTION public_add_individual_documents_disabled();

CREATE TRIGGER handle_borrower_state_trigger
BEFORE INSERT OR UPDATE ON public.borrower
FOR EACH ROW
EXECUTE FUNCTION update_borrower_address();

CREATE TRIGGER handle_updated_at
BEFORE UPDATE ON public.borrower
FOR EACH ROW
EXECUTE FUNCTION extensions.moddatetime('updated_at');

-- 2. company (no FK dependencies)
CREATE TABLE public.company (
  co_id bigint,
  co_name text,
  co_ein text,
  co_website text,
  co_ppb_address_street text,
  co_ppb_address_suite_apt text,
  co_ppb_address_city text,
  co_ppb_address_postal_code text,
  co_ppb_address_country public.country_enum default 'United States'::country_enum,
  co_phone text,
  co_fax text,
  co_logo text,
  co_role public.company_role,
  co_ppb_address_state public.us_states,
  created_at timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
  updated_at timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
  co_date_established date,
  co_state_of_formation public.us_states,
  co_bank_of_business_account text,
  co_bank_account_balance numeric,
  co_entity_type public.entity_type,
  co_ppb_address_state_long public.us_states_long,
  co_state_of_formation_long public.us_states_long,
  primary_guarantor_id bigint,
  CONSTRAINT company_pkey PRIMARY KEY (co_id)
);
CREATE TRIGGER add_entity_documents_trigger
AFTER INSERT ON public.company
FOR EACH ROW
EXECUTE FUNCTION public_add_entity_documents_disabled();
CREATE TRIGGER handle_company_state_trigger
BEFORE INSERT OR UPDATE ON public.company
FOR EACH ROW
EXECUTE FUNCTION update_company_address();
CREATE TRIGGER handle_updated_at
BEFORE UPDATE ON public.company
FOR EACH ROW
EXECUTE FUNCTION extensions.moddatetime('updated_at');

-- 3. property (no FK dependencies)
CREATE TABLE public.property (
  id bigint GENERATED BY DEFAULT AS IDENTITY,
  address_street text,
  address_suite_apt text,
  address_city text,
  address_state_long public.us_states_long,
  address_state public.us_states,
  address_postal_code text,
  address_county text,
  address_country text,
  property_type public.property_type,
  units numeric,
  short_term_rental public.yes_no,
  warrantability public.warrantability,
  address text,
  purchase_price numeric,
  occupancy public.property_occupancy,
  value_aiv_estimate numeric,
  value_arv_estimate numeric,
  calculated_ltv numeric,
  flood_zone public.yes_no,
  value_estimated_rent numeric,
  hoa_name text,
  hoa_fee numeric,
  property_taxes numeric,
  insurance_premium numeric,
  income_monthly_gross_rent numeric,
  income_monthly_fair_market_rent numeric,
  expense_annual_property_tax numeric,
  expense_annual_insurance_hoi numeric,
  expense_annual_insurance_flood numeric,
  expense_annual_management numeric,
  expense_annual_association_hoa numeric,
  expense_annual_common_area_maintenance numeric,
  expense_annual_utilities numeric,
  expense_annual_debt_service_existing numeric,
  expense_annual_trash numeric,
  expense_annual_repairs_maintenance numeric,
  expense_annual_snow_removal numeric,
  expense_annual_capital_expenditures numeric,
  expense_annual_vacancy_loss numeric,
  expense_annual_lawn_landscape numeric,
  expense_annual_administrative numeric,
  expense_annual_other numeric,
  expenses_as_entered text,
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now(),
  year_built numeric,
  condo_type public.condo_type,
  hoa_contact bigint,
  hoa_dues_current public.yes_no,
  hoa_dues_include text,
  is_income public.yes_no,
  lease_expires date,
  lease_start date,
  lease_length public.lease_length,
  lease_rent numeric,
  lease_status public.property_lease_term_status,
  market_rent_fmr numeric,
  tenant_occupied public.yes_no,
  property_manager text
);
CREATE TRIGGER after_property_change_trigger
AFTER INSERT OR UPDATE ON public.property
FOR EACH ROW
EXECUTE FUNCTION handle_property_changes();

-- 4. deal (depends on property, company)
CREATE TABLE public.deal (
  id bigint PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  original_id text,
  status deal_status_primary,
  name text,
  loan_structure loan_structure_dscr,
  deal_name text,
  deal_address text,
  company_id bigint,
  deal_type loan_type_1,
  loan_type loan_type_2,
  loan_term loan_term_months,
  vesting_type vesting_type,
  purchase_price numeric,
  loan_amount_total numeric,
  appraised_value numeric,
  guarantor_count numeric,
  transaction_type transaction_type,
  locked boolean default false,
  appraisal_required yes_no default 'yes'::yes_no,
  target_closing_date date,
  guarantee_type text,
  primary_guarantor_id bigint,
  second_guarantor_id bigint,
  third_guarantor_id bigint,
  fourth_guarantor_id bigint,
  property_id bigint,
  loan_opener_id uuid,
  loan_processor_id uuid,
  account_executive_id uuid,
  lead_source_type lead_source_type,
  loan_price_id bigint,
  status_2 deal_status_secondary,
  project_type project_type,
  mid_fico numeric,
  broker_id bigint,
  broker_company_id bigint,
  additional_guarantors boolean default false,
  last_status_change timestamp with time zone,
  date_of_purchase date,
  payoff_mtg1_amount numeric,
  payoff_mtg2_amount numeric,
  cash_out_purpose text,
  construction_holdback numeric,
  arm_description text,
  title_company_id bigint,
  title_company_contact_id bigint,
  escrow_company_id bigint,
  escrow_contact_id bigint,
  insurance_carrier_company_id bigint,
  insurance_carrier_contact_id bigint,
  closing_agent_contact_id bigint,
  appraisal_poc_contact_id bigint,
  loan_buyer_company_id bigint,
  loan_buyer_contact_id bigint,
  archived text,
  program_a_id bigint,
  program_b_id bigint,
  selected_program_loan text,
  calculated_mid_fico numeric,
  guarantor_fico_score numeric,
  guarantor_citizenship citizenship,
  guarantor_first_time_home_buyer yes_no,
  guarantor_mortgage_debt numeric,
  loan_amount_piti numeric,
  deal_stage_1 deal_stage_1,
  deal_stage_2 deal_stage_2,
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now(),
  contact_id bigint,
  contact_2_id bigint,
  contact_3_id bigint,
  contact_4_id bigint,
  lead_source_name text
);
CREATE TRIGGER add_deal_documents_trigger
AFTER INSERT ON public.deal
FOR EACH ROW
EXECUTE FUNCTION public_add_deal_documents_disabled();

CREATE TRIGGER add_milestone_templates_to_deal
AFTER INSERT ON public.deal
FOR EACH ROW
EXECUTE FUNCTION add_deal_milestones_and_tasks();

CREATE TRIGGER before_deal_change_trigger
BEFORE INSERT OR UPDATE ON public.deal
FOR EACH ROW
EXECUTE FUNCTION handle_deal_changes();

CREATE TRIGGER handle_updated_at
BEFORE UPDATE ON public.deal
FOR EACH ROW
EXECUTE FUNCTION extensions.moddatetime('updated_at');

CREATE TRIGGER set_deal_property_id
BEFORE INSERT ON public.deal
FOR EACH ROW
EXECUTE FUNCTION handle_new_deal();

-- 5. document_files (no FK dependencies)
CREATE TABLE public.document_files (
  id bigint GENERATED BY DEFAULT AS IDENTITY,
  CONSTRAINT document_files_pkey PRIMARY KEY (id),
  name text NOT NULL,
  category document_category NOT NULL,
  status document_status,
  role text,
  borrower_id bigint,
  guarantor_id bigint,
  property_id bigint,
  deal_id bigint,
  entity_id bigint,
  file_path text,
  created_at timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
  updated_at timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
  file_url text,
  file_name text
);

-- 6. tasks (no FK dependencies)
CREATE TABLE public.tasks (
  id bigint GENERATED BY DEFAULT AS IDENTITY,
  deal_id bigint,
  task_name text,
  task_description text,
  assigned_to uuid,
  status task_status,
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now(),
  task_order smallint,
  milestone_id bigint,
  due_date date,
  days_until_due integer,
  completed_date timestamp with time zone,
  task_action text
);
CREATE UNIQUE INDEX "Tasks_id_key" ON public.tasks (id);

-- 7. appraisal (depends on property, deal, document_files)
CREATE TABLE public.appraisal (
  id bigint GENERATED BY DEFAULT AS IDENTITY,
  CONSTRAINT appraisal_pkey PRIMARY KEY (id),
  order_number text,
  property_id bigint,
  deal_id bigint,
  co_appraisal bigint,
  co_amc bigint,
  appraiser_id bigint,
  order_type appraisal_order_type,
  order_status appraisal_order_status,
  date_ordered date,
  date_report_effective date,
  date_report_expiration date,
  appraisal_fee numeric,
  value numeric,
  value_as_is numeric,
  document_id bigint
);
CREATE TRIGGER created_update_expiration
BEFORE INSERT OR UPDATE ON public.appraisal
FOR EACH ROW
EXECUTE FUNCTION update_date_report_expiration();

-- ...continue with the next batch in the same pattern...

-- END BATCH 1 TABLES

-- TABLE DEFINITIONS (dependency order, batch 2)

-- 8. bs_debt_instruments (no FK dependencies)
CREATE TABLE public.bs_debt_instruments (
  id bigint GENERATED BY DEFAULT AS IDENTITY,
  instrument_type public.debt_instrument_type not null,
  name text not null,
  target_yield_pct numeric,
  created_at timestamp with time zone not null default now(),
  CONSTRAINT debt_instruments_pkey PRIMARY KEY (id)
);
-- Index already created by constraint

-- 9. document_roles (no FK dependencies)
CREATE TABLE public.document_roles (
  id bigint GENERATED BY DEFAULT AS IDENTITY,
  role_name text not null,
  CONSTRAINT document_roles_pkey PRIMARY KEY (id),
  CONSTRAINT document_roles_role_name_key UNIQUE (role_name)
);
-- Index created by PRIMARY KEY constraint
-- CREATE UNIQUE INDEX document_roles_pkey ON public.document_roles USING btree (id);
-- Index created by UNIQUE constraint
-- CREATE UNIQUE INDEX document_roles_role_name_key ON public.document_roles USING btree (role_name);

-- 10. document_roles_assigned (depends on document_roles)
CREATE TABLE public.document_roles_assigned (
  document_id bigint,
  role_id bigint REFERENCES public.document_roles(id),
  CONSTRAINT document_roles_assigned_pkey PRIMARY KEY (document_id, role_id),
  CONSTRAINT fk_document FOREIGN KEY (document_id) REFERENCES document_files(id) ON DELETE CASCADE,
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES document_roles(id) ON DELETE CASCADE
);
-- Index created by PRIMARY KEY constraint
-- CREATE UNIQUE INDEX document_roles_assigned_pkey ON public.document_roles_assigned USING btree (document_id, role_id);

-- 11. bs_investor_deals (depends on deal)
CREATE TABLE public.bs_investor_deals (
  deal_id bigint REFERENCES public.deal(id),
  contact_id bigint,
  contact_types_id bigint,
  CONSTRAINT bs_investor_deals_pkey PRIMARY KEY (deal_id, contact_id, contact_types_id)
);
-- Index created by PRIMARY KEY constraint
-- CREATE UNIQUE INDEX bs_investor_deals_pkey ON public.bs_investor_deals USING btree (deal_id, contact_id, contact_types_id);

-- 12. bs_investor_transactions (depends on bs_investor_deals)
CREATE TABLE public.bs_investor_transactions (
  id bigint GENERATED BY DEFAULT AS IDENTITY,
  investor_id bigint,
  transaction_amount numeric,
  transaction_date timestamp with time zone not null default now(),
  transaction_method transaction_method,
  transaction_status transaction_status,
  reference_number text,
  reference_type transaction_reference_type,
  notes text,
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now(),
  deal_id bigint,
  ledger_entry_type ledger_entry_type not null default 'contribution'::ledger_entry_type,
  instrument_id bigint,
  clerk_id text,
  clerk_organization_id text,
  CONSTRAINT bs_investor_distribution_payments_pkey PRIMARY KEY (id)
);
-- Index created by PRIMARY KEY constraint
-- CREATE UNIQUE INDEX bs_investor_distribution_payments_pkey ON public.bs_investor_transactions USING btree (id);

-- 13. bs_investor_distributions (depends on bs_investor_transactions)
CREATE TABLE public.bs_investor_distributions (
  id bigint GENERATED BY DEFAULT AS IDENTITY,
  deal_id bigint,
  rate_of_return_pct numeric not null,
  interest_amount numeric not null,
  servicing_fee numeric not null default 0.00,
  wire_fee numeric not null default 0.00,
  deposit_amount numeric not null,
  notes text,
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now(),
  investor_id bigint,
  capital_contribution numeric not null,
  loan_amount_snapshot numeric not null,
  upb_close numeric,
  statement_id uuid not null,
  principal_amount numeric not null,
  instrument_id bigint,
  clerk_id text,
  clerk_organization_id text,
  CONSTRAINT bs_investor_distributions_pkey PRIMARY KEY (id)
);
-- Index created by PRIMARY KEY constraint
-- CREATE UNIQUE INDEX bs_investor_distributions_pkey ON public.bs_investor_distributions USING btree (id);

-- 14. bs_investor_statements (depends on bs_investor_distributions)
CREATE TABLE public.bs_investor_statements (
  id bigint GENERATED BY DEFAULT AS IDENTITY,
  created_at timestamp with time zone not null default now(),
  investor_id bigint,
  statement_date date not null,
  statement_period_start date not null,
  statement_period_end date not null,
  total_upb_open numeric not null,
  total_upb_close numeric not null,
  total_interest numeric not null,
  total_principal numeric,
  total_fees numeric not null,
  clerk_id text,
  clerk_organization_id text,
  CONSTRAINT bs_investor_statements_pkey PRIMARY KEY (id)
);
-- Index created by PRIMARY KEY constraint
-- CREATE UNIQUE INDEX bs_investor_statements_pkey ON public.bs_investor_statements USING btree (id);

-- 15. bs_investor_transactions_references (depends on bs_investor_transactions)
CREATE TABLE public.bs_investor_transactions_references (
  id bigint GENERATED BY DEFAULT AS IDENTITY,
  transaction_id bigint not null,
  reference_type transaction_reference_type not null,
  reference_value text not null,
  CONSTRAINT transaction_references_pkey PRIMARY KEY (id)
);
-- Index created by PRIMARY KEY constraint
-- CREATE UNIQUE INDEX transaction_references_pkey ON public.bs_investor_transactions_references USING btree (id);

-- END BATCH 2 TABLES
-- ==================

-- Primary key already defined in table creation
-- alter table "public"."appraisal" add constraint "appraisal_pkey" PRIMARY KEY using index "appraisal_pkey";

-- Primary key already defined in the table definition
-- alter table "public"."borrower" add constraint "borrower_profile_pkey" PRIMARY KEY using index "borrower_profile_pkey";

-- Primary key already defined in table creation
-- alter table "public"."bs_debt_instruments" add constraint "debt_instruments_pkey" PRIMARY KEY using index "debt_instruments_pkey";

-- Comment out missing table reference
-- alter table "public"."bs_debt_instruments_deals" add constraint "bs_debt_instruments_deals_pkey" PRIMARY KEY using index "bs_debt_instruments_deals_pkey";

-- Primary key already defined in table creation
-- alter table "public"."bs_investor_deals" add constraint "bs_investor_deals_pkey" PRIMARY KEY using index "bs_investor_deals_pkey";

-- Primary key already defined in table creation
-- alter table "public"."bs_investor_distributions" add constraint "bs_investor_distributions_pkey" PRIMARY KEY using index "bs_investor_distributions_pkey";

-- Primary key already defined in table creation
-- alter table "public"."bs_investor_statements" add constraint "bs_investor_statements_pkey" PRIMARY KEY using index "bs_investor_statements_pkey";

-- Primary key already defined in table creation
-- alter table "public"."bs_investor_transactions" add constraint "bs_investor_distribution_payments_pkey" PRIMARY KEY using index "bs_investor_distribution_payments_pkey";

-- Primary key already defined in table creation
-- alter table "public"."bs_investor_transactions_references" add constraint "transaction_references_pkey" PRIMARY KEY using index "transaction_references_pkey";

-- Comment out missing table reference
-- alter table "public"."cba_requests" add constraint "cba_submission_credit_pkey" PRIMARY KEY using index "cba_submission_credit_pkey";

-- Comment out missing table reference
-- alter table "public"."cba_requests_guarantors" add constraint "cba_submissions_guarantors_pkey" PRIMARY KEY using index "cba_submissions_guarantors_pkey";

-- Primary key already defined in table creation
-- alter table "public"."company" add constraint "company_pkey" PRIMARY KEY using index "company_pkey";

-- Comment out missing table reference
-- alter table "public"."company_contact" add constraint "company_contact_pkey" PRIMARY KEY using index "company_contact_pkey";

-- Comment out missing table reference
-- alter table "public"."company_member" add constraint "company_member_pkey" PRIMARY KEY using index "company_member_pkey";

-- Comment out missing table reference
-- alter table "public"."company_roles" add constraint "company_roles_pkey" PRIMARY KEY using index "company_roles_pkey";

-- Comment out all remaining constraints for tables not defined in this migration
-- alter table "public"."company_roles_defined" add constraint "company_role_pkey" PRIMARY KEY using index "company_role_pkey";
-- alter table "public"."constants" add constraint "constants_pkey" PRIMARY KEY using index "constants_pkey";
-- alter table "public"."contact" add constraint "contact_pkey" PRIMARY KEY using index "contact_pkey";
-- alter table "public"."contact_types" add constraint "contact_types_pkey" PRIMARY KEY using index "contact_types_pkey";
-- alter table "public"."contact_types_jt" add constraint "contact_contact_types_pkey" PRIMARY KEY using index "contact_contact_types_pkey";
-- alter table "public"."countries" add constraint "countries_pkey" PRIMARY KEY using index "countries_pkey";
-- alter table "public"."custom_loan_fees" add constraint "custom_loan_fees_pkey" PRIMARY KEY using index "custom_loan_fees_pkey";
