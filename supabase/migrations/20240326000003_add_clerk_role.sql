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

-- Add helpful comment
COMMENT ON COLUMN public.user_profile.clerk_role IS 'User role from Clerk (admin/member) - separate from business roles'; 