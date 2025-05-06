-- Add status column if it doesn't exist
ALTER TABLE public.user_profile 
ADD COLUMN IF NOT EXISTS status TEXT DEFAULT 'active';

-- Create index for status column for better performance
CREATE INDEX IF NOT EXISTS idx_user_profile_status 
ON public.user_profile(status);

-- Add helpful comment
COMMENT ON COLUMN public.user_profile.status IS 'User account status (active, inactive, etc)';

-- Set default for is_active_yn if not already set
ALTER TABLE public.user_profile 
ALTER COLUMN is_active_yn SET DEFAULT true; 