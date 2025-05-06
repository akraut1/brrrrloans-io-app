-- Enable required extensions
create extension if not exists "uuid-ossp";

-- Add email verification fields to user_profile
alter table "public"."user_profile" add column if not exists "email_verified" boolean default false;
alter table "public"."user_profile" add column if not exists "email_verified_at" timestamptz;

-- Create clerk_user_sessions table
create table if not exists "public"."clerk_user_sessions" (
    "id" uuid default gen_random_uuid() primary key,
    "clerk_user_id" text not null references "public"."user_profile"("clerk_id"),
    "clerk_session_id" text not null unique,
    "status" text not null check (status in ('active', 'ended')),
    "created_at" timestamptz default now() not null,
    "ended_at" timestamptz,
    "updated_at" timestamptz default now()
);

-- Create clerk_organizations table
create table if not exists "public"."clerk_organizations" (
    "id" uuid default gen_random_uuid() primary key,
    "clerk_org_id" text not null unique,
    "name" text not null,
    "slug" text not null unique,
    "created_by_clerk_id" text not null references "public"."user_profile"("clerk_id"),
    "status" text not null check (status in ('active', 'inactive')) default 'active',
    "created_at" timestamptz default now() not null,
    "updated_at" timestamptz default now()
);

-- Create clerk_organization_members table
create table if not exists "public"."clerk_organization_members" (
    "id" uuid default gen_random_uuid() primary key,
    "organization_id" uuid not null references "public"."clerk_organizations"("id"),
    "user_profile_id" bigint not null references "public"."user_profile"("id"),
    "role" text not null check (role in ('admin', 'member')),
    "created_at" timestamptz default now() not null,
    "updated_at" timestamptz default now(),
    unique("organization_id", "user_profile_id")
);

-- Enable RLS
alter table "public"."clerk_user_sessions" enable row level security;
alter table "public"."clerk_organizations" enable row level security;
alter table "public"."clerk_organization_members" enable row level security;

-- Create policies
-- User sessions policies
create policy "Users can view their own sessions"
    on "public"."clerk_user_sessions"
    for select
    using (
        clerk_user_id = (
            select clerk_id from "public"."user_profile" 
            where clerk_id = auth.uid()::text
        )
    );

-- Organizations policies
create policy "Organization members can view organizations"
    on "public"."clerk_organizations"
    for select
    using (
        id in (
            select organization_id from "public"."clerk_organization_members"
            where user_profile_id = (
                select id from "public"."user_profile" 
                where clerk_id = auth.uid()::text
            )
        )
    );

create policy "Organization admins can insert organizations"
    on "public"."clerk_organizations"
    for insert
    with check (created_by_clerk_id = auth.uid()::text);

create policy "Organization admins can update organizations"
    on "public"."clerk_organizations"
    for update
    using (
        id in (
            select organization_id from "public"."clerk_organization_members"
            where user_profile_id = (
                select id from "public"."user_profile" 
                where clerk_id = auth.uid()::text
            ) and role = 'admin'
        )
    );

create policy "Organization admins can delete organizations"
    on "public"."clerk_organizations"
    for delete
    using (
        id in (
            select organization_id from "public"."clerk_organization_members"
            where user_profile_id = (
                select id from "public"."user_profile" 
                where clerk_id = auth.uid()::text
            ) and role = 'admin'
        )
    );

-- Organization members policies
create policy "Organization members can view other members"
    on "public"."clerk_organization_members"
    for select
    using (
        organization_id in (
            select organization_id from "public"."clerk_organization_members"
            where user_profile_id = (
                select id from "public"."user_profile" 
                where clerk_id = auth.uid()::text
            )
        )
    );

create policy "Organization admins can insert members"
    on "public"."clerk_organization_members"
    for insert
    with check (
        organization_id in (
            select organization_id from "public"."clerk_organization_members"
            where user_profile_id = (
                select id from "public"."user_profile" 
                where clerk_id = auth.uid()::text
            ) and role = 'admin'
        )
    );

create policy "Organization admins can update members"
    on "public"."clerk_organization_members"
    for update
    using (
        organization_id in (
            select organization_id from "public"."clerk_organization_members"
            where user_profile_id = (
                select id from "public"."user_profile" 
                where clerk_id = auth.uid()::text
            ) and role = 'admin'
        )
    );

create policy "Organization admins can delete members"
    on "public"."clerk_organization_members"
    for delete
    using (
        organization_id in (
            select organization_id from "public"."clerk_organization_members"
            where user_profile_id = (
                select id from "public"."user_profile" 
                where clerk_id = auth.uid()::text
            ) and role = 'admin'
        )
    );

-- Service role policies
create policy "Service role can select sessions"
    on "public"."clerk_user_sessions"
    for select to service_role
    using (true);

create policy "Service role can insert sessions"
    on "public"."clerk_user_sessions"
    for insert to service_role
    with check (true);

create policy "Service role can update sessions"
    on "public"."clerk_user_sessions"
    for update to service_role
    using (true);

create policy "Service role can delete sessions"
    on "public"."clerk_user_sessions"
    for delete to service_role
    using (true);

create policy "Service role can select organizations"
    on "public"."clerk_organizations"
    for select to service_role
    using (true);

create policy "Service role can insert organizations"
    on "public"."clerk_organizations"
    for insert to service_role
    with check (true);

create policy "Service role can update organizations"
    on "public"."clerk_organizations"
    for update to service_role
    using (true);

create policy "Service role can delete organizations"
    on "public"."clerk_organizations"
    for delete to service_role
    using (true);

create policy "Service role can select members"
    on "public"."clerk_organization_members"
    for select to service_role
    using (true);

create policy "Service role can insert members"
    on "public"."clerk_organization_members"
    for insert to service_role
    with check (true);

create policy "Service role can update members"
    on "public"."clerk_organization_members"
    for update to service_role
    using (true);

create policy "Service role can delete members"
    on "public"."clerk_organization_members"
    for delete to service_role
    using (true);

-- Create indexes
create index if not exists "idx_clerk_user_sessions_clerk_user_id" on "public"."clerk_user_sessions" ("clerk_user_id");
create index if not exists "idx_clerk_user_sessions_status" on "public"."clerk_user_sessions" ("status");
create index if not exists "idx_clerk_organizations_status" on "public"."clerk_organizations" ("status");
create index if not exists "idx_clerk_organization_members_user_profile_id" on "public"."clerk_organization_members" ("user_profile_id");
create index if not exists "idx_clerk_organization_members_organization_id" on "public"."clerk_organization_members" ("organization_id"); 