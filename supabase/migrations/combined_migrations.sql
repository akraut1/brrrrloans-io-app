-- Add status column if it doesn't exist
ALTER TABLE public.user_profile 
ADD COLUMN IF NOT EXISTS status TEXT DEFAULT 'active';

-- Create index for status column for better performance
CREATE INDEX IF NOT EXISTS idx_user_profile_status 
ON public.user_profile(status);

-- Add helpful comment for status
COMMENT ON COLUMN public.user_profile.status IS 'User account status (active, inactive, etc)';

-- Set default for is_active_yn if not already set
ALTER TABLE public.user_profile 
ALTER COLUMN is_active_yn SET DEFAULT true;

-- Create enum type for Clerk roles if it doesn't exist
DO $$ BEGIN
    CREATE TYPE public.clerk_role AS ENUM ('admin', 'member');
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

-- Add clerk_role column to user_profile table
ALTER TABLE public.user_profile 
ADD COLUMN IF NOT EXISTS clerk_role public.clerk_role DEFAULT 'member';

-- Create index for clerk_role for better performance
CREATE INDEX IF NOT EXISTS idx_user_profile_clerk_role 
ON public.user_profile(clerk_role);

-- Add helpful comment for clerk_role
COMMENT ON COLUMN public.user_profile.clerk_role IS 'User role from Clerk (admin/member) - separate from business roles'; 