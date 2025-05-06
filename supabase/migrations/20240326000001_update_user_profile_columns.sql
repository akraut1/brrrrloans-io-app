-- Add all required columns to user_profile table
ALTER TABLE public.user_profile 
ADD COLUMN IF NOT EXISTS clerk_id TEXT UNIQUE,
ADD COLUMN IF NOT EXISTS email TEXT,
ADD COLUMN IF NOT EXISTS first_name TEXT,
ADD COLUMN IF NOT EXISTS last_name TEXT,
ADD COLUMN IF NOT EXISTS role TEXT CHECK (role IN ('ADMIN', 'MANAGER', 'STAFF', 'USER')),
ADD COLUMN IF NOT EXISTS status TEXT DEFAULT 'active',
ADD COLUMN IF NOT EXISTS is_internal_yn BOOLEAN DEFAULT false,
ADD COLUMN IF NOT EXISTS is_active_yn BOOLEAN DEFAULT true,
ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT now();

-- Create indexes for frequently accessed columns
CREATE INDEX IF NOT EXISTS idx_user_profile_clerk_id ON public.user_profile(clerk_id);
CREATE INDEX IF NOT EXISTS idx_user_profile_email ON public.user_profile(email);
CREATE INDEX IF NOT EXISTS idx_user_profile_role ON public.user_profile(role);
CREATE INDEX IF NOT EXISTS idx_user_profile_status ON public.user_profile(status);

-- Add helpful comments
COMMENT ON COLUMN public.user_profile.clerk_id IS 'The unique identifier from Clerk authentication service';
COMMENT ON COLUMN public.user_profile.role IS 'User role: ADMIN, MANAGER, STAFF, or USER';
COMMENT ON COLUMN public.user_profile.is_internal_yn IS 'Whether the user is an internal employee';
COMMENT ON COLUMN public.user_profile.is_active_yn IS 'Whether the user account is active'; 