CREATE TABLE IF NOT EXISTS public.auth_user_profiles (
    id bigint PRIMARY KEY,
    contact_id bigint,
    updated_at timestamptz DEFAULT now(),
    role TEXT NOT NULL CHECK (role IN ('admin', 'account_executive', 'loan_processor', 'balance_sheet_investor', 'loan_opener')),
    is_active_yn boolean DEFAULT true,
    deactivation_date date,
    invitation_date date,
    activated_date date,
    is_internal_yn boolean DEFAULT false,
    email varchar,
    office_phone text,
    clerk_id text UNIQUE,
    username text,
    first_name text,
    last_name text,
    cell_phone text,
    office_phone_extension text,
    is_locked BOOLEAN DEFAULT false,
    is_banned BOOLEAN DEFAULT false,
    last_active_at TIMESTAMPTZ,
    last_sign_in_at TIMESTAMPTZ,
    legal_accepted_at TIMESTAMPTZ,
    email_verified BOOLEAN DEFAULT false,
    email_verified_at TIMESTAMPTZ,
    create_organization_enabled BOOLEAN DEFAULT false,
    delete_self_enabled BOOLEAN DEFAULT false,
    has_image BOOLEAN DEFAULT false,
    image_url TEXT
);

-- RLS policies for auth_user_profiles
CREATE POLICY "Service role can insert new users"
ON public.auth_user_profiles
FOR INSERT
TO service_role
WITH CHECK (true);

CREATE POLICY "Service role can update user profiles"
ON public.auth_user_profiles
FOR UPDATE
TO service_role
USING (true)
WITH CHECK (true);

CREATE POLICY "Service role can read all profiles"
ON public.auth_user_profiles
FOR SELECT
TO service_role
USING (true);

CREATE POLICY "Users can read their own profile"
ON public.auth_user_profiles
FOR SELECT
TO authenticated
USING (
  clerk_id = auth.uid()::text
);

CREATE POLICY "Users can update their own profile"
ON public.auth_user_profiles
FOR UPDATE
TO authenticated
USING (
  clerk_id = auth.uid()::text
)
WITH CHECK (
  clerk_id = auth.uid()::text
);

CREATE POLICY "Admins can read all profiles"
ON public.auth_user_profiles
FOR SELECT
TO authenticated
USING (
  role = 'admin' OR clerk_id = auth.uid()::text
);

CREATE POLICY "Admins can update all profiles"
ON public.auth_user_profiles
FOR UPDATE
TO authenticated
USING (
  (role = 'admin' AND is_internal_yn = TRUE)
  OR clerk_id = auth.uid()::text
)
WITH CHECK (
  (role = 'admin' AND is_internal_yn = TRUE)
  OR clerk_id = auth.uid()::text
);

ALTER TABLE public.auth_user_profiles ENABLE ROW LEVEL SECURITY;
