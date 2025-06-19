-- Drop unused tables
DROP TABLE IF EXISTS public.fee CASCADE;
DROP TABLE IF EXISTS public.loan_price CASCADE;
DROP TABLE IF EXISTS public.loan_price_saved CASCADE;
DROP TABLE IF EXISTS public.loan_program_a CASCADE;
DROP TABLE IF EXISTS public.loan_program_b CASCADE;
DROP TABLE IF EXISTS public.ltv_band CASCADE;
DROP TABLE IF EXISTS public.max_ltv CASCADE;
DROP TABLE IF EXISTS public.rate_adjustment CASCADE;
DROP TABLE IF EXISTS public.bsi_deals CASCADE;
DROP TABLE IF EXISTS public.bsi_distributions CASCADE;
DROP TABLE IF EXISTS public.bsi_statements CASCADE;
DROP TABLE IF EXISTS public.bsi_transactions CASCADE;
DROP TABLE IF EXISTS public.bsi_transactions_references CASCADE;
DROP TABLE IF EXISTS public.auth_user_profiles CASCADE;
DROP TABLE IF EXISTS public.auth_clerk_orgs CASCADE;
DROP TABLE IF EXISTS public.auth_clerk_orgs_members CASCADE;

-- Rename bs_investor_ tables to bsi_
ALTER TABLE IF EXISTS public.bs_investor_deals RENAME TO bsi_deals;
ALTER TABLE IF EXISTS public.bs_investor_statements RENAME TO bsi_statements;
ALTER TABLE IF EXISTS public.bs_investor_distributions RENAME TO bsi_distributions;
ALTER TABLE IF EXISTS public.bs_investor_transactions RENAME TO bsi_transactions;
ALTER TABLE IF EXISTS public.bs_investor_transactions_references RENAME TO bsi_transactions_references;

-- Rename user_clerk_orgs to auth_clerk_orgs and user_clerk_orgs_members to auth_clerk_orgs_members
ALTER TABLE IF EXISTS public.user_clerk_orgs RENAME TO auth_clerk_orgs;
ALTER TABLE IF EXISTS public.user_clerk_orgs_members RENAME TO auth_clerk_orgs_members; 