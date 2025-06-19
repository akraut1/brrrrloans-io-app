create table if not exists "public"."bsi_statements" (
    "id" bigint not null,
    "created_at" timestamp with time zone not null default now(),
    "investor_id" bigint,
    "statement_date" date not null,
    "statement_period_start" date not null,
    "statement_period_end" date not null,
    "total_upb_open" numeric not null,
    "total_upb_close" numeric not null,
    "total_interest" numeric not null,
    "total_principal" numeric,
    "total_fees" numeric not null,
    "clerk_id" text,
    "clerk_organization_id" text
);

alter table "public"."bsi_statements" enable row level security;

alter table "public"."bsi_statements" add constraint "bsi_statements_pkey" primary key ("id");

alter table "public"."bsi_statements" add constraint "bsi_statements_investor_id_fkey" foreign key ("investor_id") references "public"."contact" ("id"); 