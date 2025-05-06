-- Allow service role to insert new users
CREATE POLICY "Service role can insert new users"
ON public.user_profile
FOR INSERT
TO service_role
WITH CHECK (true);

-- Allow service role to update user profiles
CREATE POLICY "Service role can update user profiles"
ON public.user_profile
FOR UPDATE
TO service_role
USING (true)
WITH CHECK (true);

-- Allow service role to read all profiles
CREATE POLICY "Service role can read all profiles"
ON public.user_profile
FOR SELECT
TO service_role
USING (true); 