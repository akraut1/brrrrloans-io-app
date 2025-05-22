-- Add all required columns to auth_user_profiles table
ALTER TABLE public.auth_user_profiles 
ADD COLUMN IF NOT EXISTS clerk_id TEXT UNIQUE,
ADD COLUMN IF NOT EXISTS email TEXT,
ADD COLUMN IF NOT EXISTS first_name TEXT,
ADD COLUMN IF NOT EXISTS last_name TEXT,
ADD COLUMN IF NOT EXISTS cell_phone TEXT,
ADD COLUMN IF NOT EXISTS office_phone TEXT,
ADD COLUMN IF NOT EXISTS office_phone_extension TEXT,
ADD COLUMN IF NOT EXISTS role TEXT NOT NULL CHECK (role IN ('admin', 'account_executive', 'loan_processor', 'balance_sheet_investor', 'loan_opener')),
ADD COLUMN IF NOT EXISTS is_internal_yn BOOLEAN DEFAULT false,
ADD COLUMN IF NOT EXISTS is_active_yn BOOLEAN DEFAULT true,
ADD COLUMN IF NOT EXISTS is_locked BOOLEAN DEFAULT false,
ADD COLUMN IF NOT EXISTS is_banned BOOLEAN DEFAULT false,
ADD COLUMN IF NOT EXISTS last_active_at TIMESTAMPTZ,
ADD COLUMN IF NOT EXISTS last_sign_in_at TIMESTAMPTZ,
ADD COLUMN IF NOT EXISTS legal_accepted_at TIMESTAMPTZ,
ADD COLUMN IF NOT EXISTS email_verified BOOLEAN DEFAULT false,
ADD COLUMN IF NOT EXISTS email_verified_at TIMESTAMPTZ,
ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT now(),
ADD COLUMN IF NOT EXISTS create_organization_enabled BOOLEAN DEFAULT false,
ADD COLUMN IF NOT EXISTS delete_self_enabled BOOLEAN DEFAULT false,
ADD COLUMN IF NOT EXISTS has_image BOOLEAN DEFAULT false,
ADD COLUMN IF NOT EXISTS image_url TEXT;

-- Create indexes for frequently accessed columns
CREATE INDEX IF NOT EXISTS idx_auth_user_profiles_clerk_id ON public.auth_user_profiles(clerk_id);
CREATE INDEX IF NOT EXISTS idx_auth_user_profiles_email ON public.auth_user_profiles(email);
CREATE INDEX IF NOT EXISTS idx_auth_user_profiles_role ON public.auth_user_profiles(role);
CREATE INDEX IF NOT EXISTS idx_auth_user_profiles_is_internal_yn ON public.auth_user_profiles(is_internal_yn);
CREATE INDEX IF NOT EXISTS idx_auth_user_profiles_is_active_yn ON public.auth_user_profiles(is_active_yn);
CREATE INDEX IF NOT EXISTS idx_auth_user_profiles_is_locked ON public.auth_user_profiles(is_locked);
CREATE INDEX IF NOT EXISTS idx_auth_user_profiles_is_banned ON public.auth_user_profiles(is_banned);
CREATE INDEX IF NOT EXISTS idx_auth_user_profiles_last_active_at ON public.auth_user_profiles(last_active_at);
CREATE INDEX IF NOT EXISTS idx_auth_user_profiles_last_sign_in_at ON public.auth_user_profiles(last_sign_in_at);
CREATE INDEX IF NOT EXISTS idx_auth_user_profiles_legal_accepted_at ON public.auth_user_profiles(legal_accepted_at);

-- Add helpful comments
COMMENT ON COLUMN public.auth_user_profiles.clerk_id IS 'The unique identifier from Clerk authentication service';
COMMENT ON COLUMN public.auth_user_profiles.role IS 'User role: ADMIN, ACCOUNT_EXECUTIVE, LOAN_PROCESSOR, BALANCE_SHEET_INVESTOR, or LOAN_OPENER';
COMMENT ON COLUMN public.auth_user_profiles.is_internal_yn IS 'Whether the user is an internal employee';
COMMENT ON COLUMN public.auth_user_profiles.is_active_yn IS 'Whether the user account is active'; 