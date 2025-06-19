create table if not exists "public"."bsi_distributions" (
    "id" bigint not null,
    "deal_id" bigint,
    "rate_of_return_pct" numeric(5,4) not null,
    "interest_amount" numeric(15,2) not null,
    "servicing_fee" numeric(15,2) not null default 0.00,
    "wire_fee" numeric(15,2) not null default 0.00,
    "deposit_amount" numeric(15,2) not null,
    "notes" text,
    "created_at" timestamp with time zone default now(),
    "updated_at" timestamp with time zone default now(),
    "investor_id" bigint,
    "capital_contribution" numeric not null,
    "loan_amount_snapshot" numeric not null,
    "upb_close" numeric,
    "statement_id" uuid not null,
    "principal_amount" numeric not null,
    "instrument_id" bigint,
    "clerk_id" text,
    "clerk_organization_id" text
);

alter table "public"."bsi_distributions" enable row level security;

alter table "public"."bsi_distributions" add constraint "bsi_distributions_pkey" primary key ("id");
alter table "public"."bsi_distributions" add constraint "bsi_distributions_deal_id_fkey" foreign key ("deal_id") references "public"."deal" ("id");
alter table "public"."bsi_distributions" add constraint "bsi_distributions_investor_id_fkey" foreign key ("investor_id") references "public"."contact" ("id");
alter table "public"."bsi_distributions" add constraint "bsi_distributions_statement_id_fkey" foreign key ("statement_id") references "public"."bsi_statements" ("id");
alter table "public"."bsi_distributions" add constraint "bsi_distributions_instrument_id_fkey" foreign key ("instrument_id") references "public"."bs_debt_instruments" ("id");
alter table "public"."bsi_distributions" add constraint "bsi_distributions_clerk_organization_id_fkey" foreign key ("clerk_organization_id") references "public"."auth_clerk_orgs" ("id");
alter table "public"."bsi_distributions" add constraint "bsi_distributions_clerk_id_fkey" foreign key ("clerk_id") references "public"."auth_user_profiles" ("id"); 