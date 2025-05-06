-- Add clerk_id column to user_profile table
ALTER TABLE public.user_profile 
ADD COLUMN IF NOT EXISTS clerk_id TEXT UNIQUE;

-- Create an index on clerk_id for faster lookups
CREATE INDEX IF NOT EXISTS idx_user_profile_clerk_id 
ON public.user_profile(clerk_id);

-- Add a comment to explain the column's purpose
COMMENT ON COLUMN public.user_profile.clerk_id IS 'The unique identifier from Clerk authentication service'; 