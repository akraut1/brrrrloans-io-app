-- Add email verification fields to user_profile
ALTER TABLE user_profile
ADD COLUMN IF NOT EXISTS email_verified boolean DEFAULT false,
ADD COLUMN IF NOT EXISTS email_verified_at timestamptz;

-- Create clerk_user_sessions table
CREATE TABLE IF NOT EXISTS clerk_user_sessions (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    clerk_user_id text NOT NULL REFERENCES user_profile(clerk_id),
    clerk_session_id text NOT NULL UNIQUE,
    status text NOT NULL CHECK (status IN ('active', 'ended')),
    created_at timestamptz NOT NULL DEFAULT now(),
    ended_at timestamptz,
    updated_at timestamptz DEFAULT now()
);

-- Create clerk_organizations table
CREATE TABLE IF NOT EXISTS clerk_organizations (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    clerk_org_id text NOT NULL UNIQUE,
    name text NOT NULL,
    slug text NOT NULL UNIQUE,
    created_by_clerk_id text NOT NULL REFERENCES user_profile(clerk_id),
    status text NOT NULL CHECK (status IN ('active', 'inactive')) DEFAULT 'active',
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz DEFAULT now()
);

-- Create clerk_organization_members table
CREATE TABLE IF NOT EXISTS clerk_organization_members (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    organization_id uuid NOT NULL REFERENCES clerk_organizations(id),
    user_profile_id bigint NOT NULL REFERENCES user_profile(id),
    role text NOT NULL CHECK (role IN ('admin', 'member')),
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz DEFAULT now(),
    UNIQUE(organization_id, user_profile_id)
);

-- Add RLS policies
ALTER TABLE clerk_user_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE clerk_organizations ENABLE ROW LEVEL SECURITY;
ALTER TABLE clerk_organization_members ENABLE ROW LEVEL SECURITY;

-- User sessions policies
CREATE POLICY "Users can view their own sessions"
    ON clerk_user_sessions FOR SELECT
    USING (clerk_user_id = (
        SELECT clerk_id FROM user_profile 
        WHERE clerk_id = auth.uid()::text
    ));

-- Organizations policies
CREATE POLICY "Organization members can view organizations"
    ON clerk_organizations FOR SELECT
    USING (id IN (
        SELECT organization_id FROM clerk_organization_members
        WHERE user_profile_id = (
            SELECT id FROM user_profile 
            WHERE clerk_id = auth.uid()::text
        )
    ));

CREATE POLICY "Organization admins can insert organizations"
    ON clerk_organizations FOR INSERT
    WITH CHECK (created_by_clerk_id = auth.uid()::text);

CREATE POLICY "Organization admins can update organizations"
    ON clerk_organizations FOR UPDATE
    USING (id IN (
        SELECT organization_id FROM clerk_organization_members
        WHERE user_profile_id = (
            SELECT id FROM user_profile 
            WHERE clerk_id = auth.uid()::text
        ) AND role = 'admin'
    ));

CREATE POLICY "Organization admins can delete organizations"
    ON clerk_organizations FOR DELETE
    USING (id IN (
        SELECT organization_id FROM clerk_organization_members
        WHERE user_profile_id = (
            SELECT id FROM user_profile 
            WHERE clerk_id = auth.uid()::text
        ) AND role = 'admin'
    ));

-- Organization members policies
CREATE POLICY "Organization members can view other members"
    ON clerk_organization_members FOR SELECT
    USING (organization_id IN (
        SELECT organization_id FROM clerk_organization_members
        WHERE user_profile_id = (
            SELECT id FROM user_profile 
            WHERE clerk_id = auth.uid()::text
        )
    ));

CREATE POLICY "Organization admins can insert members"
    ON clerk_organization_members FOR INSERT
    WITH CHECK (organization_id IN (
        SELECT organization_id FROM clerk_organization_members
        WHERE user_profile_id = (
            SELECT id FROM user_profile 
            WHERE clerk_id = auth.uid()::text
        ) AND role = 'admin'
    ));

CREATE POLICY "Organization admins can update members"
    ON clerk_organization_members FOR UPDATE
    USING (organization_id IN (
        SELECT organization_id FROM clerk_organization_members
        WHERE user_profile_id = (
            SELECT id FROM user_profile 
            WHERE clerk_id = auth.uid()::text
        ) AND role = 'admin'
    ));

CREATE POLICY "Organization admins can delete members"
    ON clerk_organization_members FOR DELETE
    USING (organization_id IN (
        SELECT organization_id FROM clerk_organization_members
        WHERE user_profile_id = (
            SELECT id FROM user_profile 
            WHERE clerk_id = auth.uid()::text
        ) AND role = 'admin'
    ));

-- Add service role policies
CREATE POLICY "Service role can select sessions"
    ON clerk_user_sessions FOR SELECT TO service_role
    USING (true);

CREATE POLICY "Service role can insert sessions"
    ON clerk_user_sessions FOR INSERT TO service_role
    WITH CHECK (true);

CREATE POLICY "Service role can update sessions"
    ON clerk_user_sessions FOR UPDATE TO service_role
    USING (true);

CREATE POLICY "Service role can delete sessions"
    ON clerk_user_sessions FOR DELETE TO service_role
    USING (true);

CREATE POLICY "Service role can select organizations"
    ON clerk_organizations FOR SELECT TO service_role
    USING (true);

CREATE POLICY "Service role can insert organizations"
    ON clerk_organizations FOR INSERT TO service_role
    WITH CHECK (true);

CREATE POLICY "Service role can update organizations"
    ON clerk_organizations FOR UPDATE TO service_role
    USING (true);

CREATE POLICY "Service role can delete organizations"
    ON clerk_organizations FOR DELETE TO service_role
    USING (true);

CREATE POLICY "Service role can select members"
    ON clerk_organization_members FOR SELECT TO service_role
    USING (true);

CREATE POLICY "Service role can insert members"
    ON clerk_organization_members FOR INSERT TO service_role
    WITH CHECK (true);

CREATE POLICY "Service role can update members"
    ON clerk_organization_members FOR UPDATE TO service_role
    USING (true);

CREATE POLICY "Service role can delete members"
    ON clerk_organization_members FOR DELETE TO service_role
    USING (true);

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_clerk_user_sessions_clerk_user_id ON clerk_user_sessions(clerk_user_id);
CREATE INDEX IF NOT EXISTS idx_clerk_user_sessions_status ON clerk_user_sessions(status);
CREATE INDEX IF NOT EXISTS idx_clerk_organizations_status ON clerk_organizations(status);
CREATE INDEX IF NOT EXISTS idx_clerk_organization_members_user_profile_id ON clerk_organization_members(user_profile_id);
CREATE INDEX IF NOT EXISTS idx_clerk_organization_members_organization_id ON clerk_organization_members(organization_id); 