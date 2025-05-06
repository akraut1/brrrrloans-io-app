-- Enable RLS on the user_profile table
ALTER TABLE public.user_profile ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist
DROP POLICY IF EXISTS "Internal users can read all profiles" ON public.user_profile;
DROP POLICY IF EXISTS "Internal users can update their own profile" ON public.user_profile;

-- Create policy for reading user profiles (internal users only)
CREATE POLICY "Internal users can read all profiles"
ON public.user_profile
FOR SELECT
TO authenticated
USING (
  EXISTS (
    SELECT 1 
    FROM public.user_profile viewer 
    WHERE viewer.id::text = auth.uid() 
    AND viewer.is_internal_yn = true
    AND viewer.is_active_yn = true
  )
);

-- Create policy for updating own profile (internal users only)
CREATE POLICY "Internal users can update their own profile"
ON public.user_profile
FOR UPDATE
TO authenticated
USING (
  -- Check if the user trying to update is internal
  EXISTS (
    SELECT 1 
    FROM public.user_profile viewer 
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