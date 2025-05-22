-- Enable RLS on the auth_user_profiles table
ALTER TABLE public.auth_user_profiles ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist
DROP POLICY IF EXISTS "Internal users can read all profiles" ON public.auth_user_profiles;
DROP POLICY IF EXISTS "Internal users can update their own profile" ON public.auth_user_profiles;

-- Create policy for reading user profiles (internal users only)
CREATE POLICY "Internal users can read all profiles"
ON public.auth_user_profiles
FOR SELECT
TO authenticated
USING (
  EXISTS (
    SELECT 1 
    FROM public.auth_user_profiles viewer 
    WHERE viewer.id::text = auth.uid() 
    AND viewer.is_internal_yn = true
    AND viewer.is_active_yn = true
  )
);

-- Create policy for updating own profile (internal users only)
CREATE POLICY "Internal users can update their own profile"
ON public.auth_user_profiles
FOR UPDATE
TO authenticated
USING (
  -- Check if the user trying to update is internal
  EXISTS (
    SELECT 1 
    FROM public.auth_user_profiles viewer 
    WHERE viewer.id::text = auth.uid() 
    AND viewer.is_internal_yn = true
    AND viewer.is_active_yn = true
  )
)
WITH CHECK (
  -- Can only update their own profile
  id::text = auth.uid()
);

-- Note: Insert/Delete operations should be handled by admin functions only
-- No direct insert/delete policies are created 