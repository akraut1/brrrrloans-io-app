create extension if not exists "http" with schema "extensions";

create extension if not exists "moddatetime" with schema "extensions";

create extension if not exists "pg_cron" with schema "extensions";

create extension if not exists "pgaudit" with schema "extensions";

create extension if not exists "wrappers" with schema "extensions";


revoke delete on table "public"."loan_price" from "anon";

revoke insert on table "public"."loan_price" from "anon";

revoke references on table "public"."loan_price" from "anon";

revoke select on table "public"."loan_price" from "anon";

revoke trigger on table "public"."loan_price" from "anon";

revoke truncate on table "public"."loan_price" from "anon";

revoke update on table "public"."loan_price" from "anon";

revoke delete on table "public"."loan_price" from "authenticated";

revoke insert on table "public"."loan_price" from "authenticated";

revoke references on table "public"."loan_price" from "authenticated";

revoke select on table "public"."loan_price" from "authenticated";

revoke trigger on table "public"."loan_price" from "authenticated";

revoke truncate on table "public"."loan_price" from "authenticated";

revoke update on table "public"."loan_price" from "authenticated";

revoke delete on table "public"."loan_price" from "service_role";

revoke insert on table "public"."loan_price" from "service_role";

revoke references on table "public"."loan_price" from "service_role";

revoke select on table "public"."loan_price" from "service_role";

revoke trigger on table "public"."loan_price" from "service_role";

revoke truncate on table "public"."loan_price" from "service_role";

revoke update on table "public"."loan_price" from "service_role";

revoke delete on table "public"."loan_price_saved" from "anon";

revoke insert on table "public"."loan_price_saved" from "anon";

revoke references on table "public"."loan_price_saved" from "anon";

revoke select on table "public"."loan_price_saved" from "anon";

revoke trigger on table "public"."loan_price_saved" from "anon";

revoke truncate on table "public"."loan_price_saved" from "anon";

revoke update on table "public"."loan_price_saved" from "anon";

revoke delete on table "public"."loan_price_saved" from "authenticated";

revoke insert on table "public"."loan_price_saved" from "authenticated";

revoke references on table "public"."loan_price_saved" from "authenticated";

revoke select on table "public"."loan_price_saved" from "authenticated";

revoke trigger on table "public"."loan_price_saved" from "authenticated";

revoke truncate on table "public"."loan_price_saved" from "authenticated";

revoke update on table "public"."loan_price_saved" from "authenticated";

revoke delete on table "public"."loan_price_saved" from "service_role";

revoke insert on table "public"."loan_price_saved" from "service_role";

revoke references on table "public"."loan_price_saved" from "service_role";

revoke select on table "public"."loan_price_saved" from "service_role";

revoke trigger on table "public"."loan_price_saved" from "service_role";

revoke truncate on table "public"."loan_price_saved" from "service_role";

revoke update on table "public"."loan_price_saved" from "service_role";

revoke delete on table "public"."loan_program_a" from "anon";

revoke insert on table "public"."loan_program_a" from "anon";

revoke references on table "public"."loan_program_a" from "anon";

revoke select on table "public"."loan_program_a" from "anon";

revoke trigger on table "public"."loan_program_a" from "anon";

revoke truncate on table "public"."loan_program_a" from "anon";

revoke update on table "public"."loan_program_a" from "anon";

revoke delete on table "public"."loan_program_a" from "authenticated";

revoke insert on table "public"."loan_program_a" from "authenticated";

revoke references on table "public"."loan_program_a" from "authenticated";

revoke select on table "public"."loan_program_a" from "authenticated";

revoke trigger on table "public"."loan_program_a" from "authenticated";

revoke truncate on table "public"."loan_program_a" from "authenticated";

revoke update on table "public"."loan_program_a" from "authenticated";

revoke delete on table "public"."loan_program_a" from "service_role";

revoke insert on table "public"."loan_program_a" from "service_role";

revoke references on table "public"."loan_program_a" from "service_role";

revoke select on table "public"."loan_program_a" from "service_role";

revoke trigger on table "public"."loan_program_a" from "service_role";

revoke truncate on table "public"."loan_program_a" from "service_role";

revoke update on table "public"."loan_program_a" from "service_role";

revoke delete on table "public"."loan_program_b" from "anon";

revoke insert on table "public"."loan_program_b" from "anon";

revoke references on table "public"."loan_program_b" from "anon";

revoke select on table "public"."loan_program_b" from "anon";

revoke trigger on table "public"."loan_program_b" from "anon";

revoke truncate on table "public"."loan_program_b" from "anon";

revoke update on table "public"."loan_program_b" from "anon";

revoke delete on table "public"."loan_program_b" from "authenticated";

revoke insert on table "public"."loan_program_b" from "authenticated";

revoke references on table "public"."loan_program_b" from "authenticated";

revoke select on table "public"."loan_program_b" from "authenticated";

revoke trigger on table "public"."loan_program_b" from "authenticated";

revoke truncate on table "public"."loan_program_b" from "authenticated";

revoke update on table "public"."loan_program_b" from "authenticated";

revoke delete on table "public"."loan_program_b" from "service_role";

revoke insert on table "public"."loan_program_b" from "service_role";

revoke references on table "public"."loan_program_b" from "service_role";

revoke select on table "public"."loan_program_b" from "service_role";

revoke trigger on table "public"."loan_program_b" from "service_role";

revoke truncate on table "public"."loan_program_b" from "service_role";

revoke update on table "public"."loan_program_b" from "service_role";

revoke delete on table "public"."ltv_band" from "anon";

revoke insert on table "public"."ltv_band" from "anon";

revoke references on table "public"."ltv_band" from "anon";

revoke select on table "public"."ltv_band" from "anon";

revoke trigger on table "public"."ltv_band" from "anon";

revoke truncate on table "public"."ltv_band" from "anon";

revoke update on table "public"."ltv_band" from "anon";

revoke delete on table "public"."ltv_band" from "authenticated";

revoke insert on table "public"."ltv_band" from "authenticated";

revoke references on table "public"."ltv_band" from "authenticated";

revoke select on table "public"."ltv_band" from "authenticated";

revoke trigger on table "public"."ltv_band" from "authenticated";

revoke truncate on table "public"."ltv_band" from "authenticated";

revoke update on table "public"."ltv_band" from "authenticated";

revoke delete on table "public"."ltv_band" from "service_role";

revoke insert on table "public"."ltv_band" from "service_role";

revoke references on table "public"."ltv_band" from "service_role";

revoke select on table "public"."ltv_band" from "service_role";

revoke trigger on table "public"."ltv_band" from "service_role";

revoke truncate on table "public"."ltv_band" from "service_role";

revoke update on table "public"."ltv_band" from "service_role";

revoke delete on table "public"."max_ltv" from "anon";

revoke insert on table "public"."max_ltv" from "anon";

revoke references on table "public"."max_ltv" from "anon";

revoke select on table "public"."max_ltv" from "anon";

revoke trigger on table "public"."max_ltv" from "anon";

revoke truncate on table "public"."max_ltv" from "anon";

revoke update on table "public"."max_ltv" from "anon";

revoke delete on table "public"."max_ltv" from "authenticated";

revoke insert on table "public"."max_ltv" from "authenticated";

revoke references on table "public"."max_ltv" from "authenticated";

revoke select on table "public"."max_ltv" from "authenticated";

revoke trigger on table "public"."max_ltv" from "authenticated";

revoke truncate on table "public"."max_ltv" from "authenticated";

revoke update on table "public"."max_ltv" from "authenticated";

revoke delete on table "public"."max_ltv" from "service_role";

revoke insert on table "public"."max_ltv" from "service_role";

revoke references on table "public"."max_ltv" from "service_role";

revoke select on table "public"."max_ltv" from "service_role";

revoke trigger on table "public"."max_ltv" from "service_role";

revoke truncate on table "public"."max_ltv" from "service_role";

revoke update on table "public"."max_ltv" from "service_role";

revoke delete on table "public"."rate_adjustment" from "anon";

revoke insert on table "public"."rate_adjustment" from "anon";

revoke references on table "public"."rate_adjustment" from "anon";

revoke select on table "public"."rate_adjustment" from "anon";

revoke trigger on table "public"."rate_adjustment" from "anon";

revoke truncate on table "public"."rate_adjustment" from "anon";

revoke update on table "public"."rate_adjustment" from "anon";

revoke delete on table "public"."rate_adjustment" from "authenticated";

revoke insert on table "public"."rate_adjustment" from "authenticated";

revoke references on table "public"."rate_adjustment" from "authenticated";

revoke select on table "public"."rate_adjustment" from "authenticated";

revoke trigger on table "public"."rate_adjustment" from "authenticated";

revoke truncate on table "public"."rate_adjustment" from "authenticated";

revoke update on table "public"."rate_adjustment" from "authenticated";

revoke delete on table "public"."rate_adjustment" from "service_role";

revoke insert on table "public"."rate_adjustment" from "service_role";

revoke references on table "public"."rate_adjustment" from "service_role";

revoke select on table "public"."rate_adjustment" from "service_role";

revoke trigger on table "public"."rate_adjustment" from "service_role";

revoke truncate on table "public"."rate_adjustment" from "service_role";

revoke update on table "public"."rate_adjustment" from "service_role";

alter table "public"."loan_price" drop constraint "loan_price_pkey";

alter table "public"."loan_price_saved" drop constraint "loan_price_saved_pkey";

alter table "public"."loan_program_a" drop constraint "loan_program_a_pkey";

alter table "public"."loan_program_b" drop constraint "loan_program_b_pkey";

alter table "public"."ltv_band" drop constraint "ltv_band_pkey";

alter table "public"."max_ltv" drop constraint "max_ltv_pkey";

alter table "public"."rate_adjustment" drop constraint "rate_adjustment_pkey";

drop index if exists "public"."deal_program_row_index_constraint";

drop index if exists "public"."loan_price_pkey";

drop index if exists "public"."loan_price_saved_pkey";

drop index if exists "public"."loan_program_a_deal_id_key";

drop index if exists "public"."loan_program_a_pkey";

drop index if exists "public"."loan_program_b_deal_id_key";

drop index if exists "public"."loan_program_b_pkey";

drop index if exists "public"."ltv_band_name_key";

drop index if exists "public"."ltv_band_pkey";

drop index if exists "public"."max_ltv_pkey";

drop index if exists "public"."rate_adjustment_pkey";

drop index if exists "public"."Documents_pkey";

drop table "public"."loan_price";

drop table "public"."loan_price_saved";

drop table "public"."loan_program_a";

drop table "public"."loan_program_b";

drop table "public"."ltv_band";

drop table "public"."max_ltv";

drop table "public"."rate_adjustment";

alter table "public"."company" alter column "co_ppb_address_country" drop default;

alter type "public"."country_enum" rename to "country_enum__old_version_to_be_dropped";

create type "public"."country_enum" as enum (
  'Afghanistan',
  'Albania',
  'Algeria',
  'American Samoa',
  'Andorra',
  'Angola',
  'Anguilla',
  'Antarctica',
  'Antigua and Barbuda',
  'Argentina',
  'Armenia',
  'Aruba',
  'Australia',
  'Austria',
  'Azerbaijan',
  'Bahamas',
  'Bahrain',
  'Bangladesh',
  'Barbados',
  'Belarus',
  'Belgium',
  'Belize',
  'Benin',
  'Bermuda',
  'Bhutan',
  'Bolivia',
  'Bosnia and Herzegovina',
  'Botswana',
  'Bouvet Island',
  'Brazil',
  'British Indian Ocean Territory',
  'Brunei Darussalam',
  'Bulgaria',
  'Burkina Faso',
  'Burundi',
  'Cabo Verde',
  'Cambodia',
  'Cameroon',
  'Canada',
  'Cayman Islands',
  'Central African Republic',
  'Chad',
  'Chile',
  'China',
  'Christmas Island',
  'Cocos (Keeling) Islands',
  'Colombia',
  'Comoros',
  'Congo',
  'Congo, the Democratic Republic of the',
  'Cook Islands',
  'Costa Rica',
  'Cote d''Ivoire',
  'Croatia',
  'Cuba',
  'Curaçao',
  'Cyprus',
  'Czech Republic',
  'Denmark',
  'Djibouti',
  'Dominica',
  'Dominican Republic',
  'Ecuador',
  'Egypt',
  'El Salvador',
  'Equatorial Guinea',
  'Eritrea',
  'Estonia',
  'Ethiopia',
  'Falkland Islands (Malvinas)',
  'Faroe Islands',
  'Fiji',
  'Finland',
  'France',
  'French Guiana',
  'French Polynesia',
  'French Southern Territories',
  'Gabon',
  'Gambia',
  'Georgia',
  'Germany',
  'Ghana',
  'Gibraltar',
  'Greece',
  'Greenland',
  'Grenada',
  'Guadeloupe',
  'Guam',
  'Guatemala',
  'Guernsey',
  'Guinea',
  'Guinea-Bissau',
  'Guyana',
  'Haiti',
  'Heard Island and McDonald Islands',
  'Holy See (Vatican City State)',
  'Honduras',
  'Hong Kong',
  'Hungary',
  'Iceland',
  'India',
  'Indonesia',
  'Iran, Islamic Republic of',
  'Iraq',
  'Ireland',
  'Isle of Man',
  'Israel',
  'Italy',
  'Jamaica',
  'Japan',
  'Jersey',
  'Jordan',
  'Kazakhstan',
  'Kenya',
  'Kiribati',
  'Korea, Democratic People''s Republic of',
  'Korea, Republic of',
  'Kuwait',
  'Kyrgyzstan',
  'Lao People''s Democratic Republic',
  'Latvia',
  'Lebanon',
  'Lesotho',
  'Liberia',
  'Libya',
  'Liechtenstein',
  'Lithuania',
  'Luxembourg',
  'Macao',
  'Macedonia, the Former Yugoslav Republic of',
  'Madagascar',
  'Malawi',
  'Malaysia',
  'Maldives',
  'Mali',
  'Malta',
  'Marshall Islands',
  'Martinique',
  'Mauritania',
  'Mauritius',
  'Mayotte',
  'Mexico',
  'Micronesia, Federated States of',
  'Moldova, Republic of',
  'Monaco',
  'Mongolia',
  'Montenegro',
  'Montserrat',
  'Morocco',
  'Mozambique',
  'Myanmar',
  'Namibia',
  'Nauru',
  'Nepal',
  'Netherlands',
  'New Caledonia',
  'New Zealand',
  'Nicaragua',
  'Niger',
  'Nigeria',
  'Niue',
  'Norfolk Island',
  'Northern Mariana Islands',
  'Norway',
  'Oman',
  'Pakistan',
  'Palau',
  'Palestine, State of',
  'Panama',
  'Papua New Guinea',
  'Paraguay',
  'Peru',
  'Philippines',
  'Pitcairn',
  'Poland',
  'Portugal',
  'Puerto Rico',
  'Qatar',
  'Reunion',
  'Romania',
  'Russian Federation',
  'Rwanda',
  'Saint Barthélemy',
  'Saint Helena, Ascension and Tristan da Cunha',
  'Saint Kitts and Nevis',
  'Saint Lucia',
  'Saint Martin (French part)',
  'Saint Pierre and Miquelon',
  'Saint Vincent and the Grenadines',
  'Samoa',
  'San Marino',
  'Sao Tome and Principe',
  'Saudi Arabia',
  'Senegal',
  'Serbia',
  'Seychelles',
  'Sierra Leone',
  'Singapore',
  'Sint Maarten (Dutch part)',
  'Slovakia',
  'Slovenia',
  'Solomon Islands',
  'Somalia',
  'South Africa',
  'South Georgia and the South Sandwich Islands',
  'South Sudan',
  'Spain',
  'Sri Lanka',
  'Sudan',
  'Suriname',
  'Svalbard and Jan Mayen',
  'Swaziland',
  'Sweden',
  'Switzerland',
  'Syrian Arab Republic',
  'Taiwan (Province of China)',
  'Tajikistan',
  'Tanzania, United Republic of',
  'Thailand',
  'Timor-Leste',
  'Togo',
  'Tokelau',
  'Tonga',
  'Trinidad and Tobago',
  'Tunisia',
  'Turkey',
  'Turkmenistan',
  'Turks and Caicos Islands',
  'Tuvalu',
  'Uganda',
  'Ukraine',
  'United Arab Emirates',
  'United Kingdom',
  'United States',
  'United States Minor Outlying Islands',
  'Uruguay',
  'Uzbekistan',
  'Vanuatu',
  'Venezuela',
  'Viet Nam',
  'Virgin Islands (British)',
  'Virgin Islands (U.S.)',
  'Wallis and Futuna',
  'Western Sahara',
  'Yemen',
  'Zambia',
  'Zimbabwe'
);

create table "public"."auth_user_profile" (
    "email" character varying(255),
    "updated_at" timestamp with time zone default (now() AT TIME ZONE 'utc'::text),
    "username" text,
    "first_name" text,
    "last_name" text,
    "full_name" text generated always as (TRIM(BOTH FROM ((COALESCE(first_name, ''::text) || ' '::text) || COALESCE(last_name, ''::text)))) stored,
    "avatar_url" text,
    "website" text,
    "role" user_role_internal,
    "is_active_yn" boolean default true,
    "deactivation_date" date,
    "invitation_date" date,
    "activated_date" date,
    "id" bigint generated by default as identity not null,
    "cell_phone" text,
    "office_phone_extension" text,
    "is_internal_yn" boolean not null default false,
    "office_phone" text,
    "clerk_id" text,
    "contact_id" bigint,
    "create_organization_enabled" boolean default false,
    "delete_self_enabled" boolean default false,
    "is_locked" boolean default false,
    "is_banned" boolean default false,
    "last_active_at" timestamp with time zone,
    "last_sign_in_at" timestamp with time zone,
    "legal_accepted_at" timestamp with time zone,
    "has_image" boolean default false,
    "image_url" text,
    "email_verified" boolean default false,
    "email_verified_at" timestamp with time zone
);


alter table "public"."auth_user_profile" enable row level security;

create table "public"."bs_investor_deals" (
    "deal_id" bigint not null,
    "contact_id" bigint not null,
    "contact_types_id" bigint not null
);


alter table "public"."bs_investor_deals" enable row level security;

create table "public"."bs_investor_distributions" (
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
    "id" uuid not null default gen_random_uuid(),
    "statement_id" uuid not null,
    "principal_amount" numeric not null,
    "instrument_id" bigint,
    "clerk_id" text,
    "clerk_organization_id" text
);


alter table "public"."bs_investor_distributions" enable row level security;

create table "public"."bs_investor_statements" (
    "id" uuid not null default gen_random_uuid(),
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
    "clerk_organization_id" text,
    "file_path" text,
    "file_name" text,
    "file_type" text,
    "file_size" bigint,
    "file_url" text,
    "uploaded_at" timestamp with time zone default now(),
    "user_clerk_orgs_id" bigint
);


alter table "public"."bs_investor_statements" enable row level security;

create table "public"."bs_investor_transactions" (
    "investor_id" bigint,
    "transaction_amount" numeric(15,2),
    "transaction_date" timestamp with time zone not null default now(),
    "transaction_method" transaction_method,
    "transaction_status" transaction_status,
    "reference_number" text,
    "reference_type" transaction_reference_type,
    "notes" text,
    "created_at" timestamp with time zone default now(),
    "updated_at" timestamp with time zone default now(),
    "id" bigint generated by default as identity not null,
    "deal_id" bigint,
    "ledger_entry_type" ledger_entry_type not null default 'contribution'::ledger_entry_type,
    "instrument_id" bigint,
    "clerk_id" text,
    "clerk_organization_id" text
);


alter table "public"."bs_investor_transactions" enable row level security;

create table "public"."bs_investor_transactions_references" (
    "id" bigint not null default nextval('transaction_references_id_seq'::regclass),
    "transaction_id" bigint not null,
    "reference_type" transaction_reference_type not null,
    "reference_value" text not null
);


alter table "public"."bs_investor_transactions_references" enable row level security;

create table "public"."user_clerk_orgs" (
    "id" bigint generated by default as identity not null,
    "clerk_organization_id" text not null,
    "clerk_organization_name" text not null,
    "clerk_organization_slug" text not null,
    "created_by_clerk_id" text not null,
    "created_at" timestamp with time zone not null default now(),
    "updated_at" timestamp with time zone default now()
);


alter table "public"."user_clerk_orgs" enable row level security;

create table "public"."user_clerk_orgs_members" (
    "id" bigint generated by default as identity not null,
    "created_at" timestamp with time zone not null default now(),
    "clerk_id" text not null,
    "clerk_organization_id" text not null,
    "user_id" bigint,
    "clerk_organization_fkey" bigint,
    "clerk_role" clerk_role default 'member'::clerk_role
);


alter table "public"."user_clerk_orgs_members" enable row level security;

alter table "public"."company" alter column co_ppb_address_country type "public"."country_enum" using co_ppb_address_country::text::"public"."country_enum";

alter table "public"."company" alter column "co_ppb_address_country" set default 'United States'::country_enum;

drop type "public"."country_enum__old_version_to_be_dropped";

alter table "public"."deal" drop column "account_executive_id" cascade;

alter table "public"."deal" add column "account_executive_id" bigint;

alter table "public"."deal" drop column "loan_opener_id";
alter table "public"."deal" add column "loan_opener_id" bigint;

alter table "public"."deal" drop column "loan_processor_id";
alter table "public"."deal" add column "loan_processor_id" bigint;

alter table "public"."document_files" drop column "file_name";

alter table "public"."document_files" drop column "role";

alter table "public"."document_files" drop column "updated_at";

alter table "public"."tasks" drop column "assigned_to";
alter table "public"."tasks" add column "assigned_to" bigint;

CREATE UNIQUE INDEX bs_investor_deals_pkey ON public.bs_investor_deals USING btree (deal_id, contact_id, contact_types_id);

CREATE UNIQUE INDEX bs_investor_distribution_payments_pkey ON public.bs_investor_transactions USING btree (id);

CREATE UNIQUE INDEX bs_investor_distributions_pkey ON public.bs_investor_distributions USING btree (id);

CREATE UNIQUE INDEX bs_investor_statements_pkey ON public.bs_investor_statements USING btree (id);

CREATE INDEX idx_user_profile_clerk_id ON public.auth_user_profile USING btree (clerk_id);

CREATE INDEX idx_user_profile_email ON public.auth_user_profile USING btree (email);

CREATE INDEX idx_user_profile_is_active_yn ON public.auth_user_profile USING btree (is_active_yn);

CREATE INDEX idx_user_profile_is_banned ON public.auth_user_profile USING btree (is_banned);

CREATE INDEX idx_user_profile_is_internal_yn ON public.auth_user_profile USING btree (is_internal_yn);

CREATE INDEX idx_user_profile_is_locked ON public.auth_user_profile USING btree (is_locked);

CREATE INDEX idx_user_profile_last_active_at ON public.auth_user_profile USING btree (last_active_at);

CREATE INDEX idx_user_profile_last_sign_in_at ON public.auth_user_profile USING btree (last_sign_in_at);

CREATE INDEX idx_user_profile_legal_accepted_at ON public.auth_user_profile USING btree (legal_accepted_at);

CREATE INDEX idx_user_profile_role ON public.auth_user_profile USING btree (role);

CREATE UNIQUE INDEX profile_pkey ON public.auth_user_profile USING btree (id);

CREATE UNIQUE INDEX profiles_username_key ON public.auth_user_profile USING btree (username);

CREATE UNIQUE INDEX transaction_references_pkey ON public.bs_investor_transactions_references USING btree (id);

CREATE UNIQUE INDEX user_clerk_orgs_clerk_organization_id_key ON public.user_clerk_orgs USING btree (clerk_organization_id);

CREATE UNIQUE INDEX user_clerk_orgs_pkey ON public.user_clerk_orgs USING btree (id);

CREATE UNIQUE INDEX user_clerk_orgs_slug_key ON public.user_clerk_orgs USING btree (clerk_organization_slug);

CREATE UNIQUE INDEX user_org_memberships_pkey ON public.user_clerk_orgs_members USING btree (id);

CREATE UNIQUE INDEX user_profile_clerk_id_key ON public.auth_user_profile USING btree (clerk_id);

CREATE UNIQUE INDEX "Documents_pkey" ON public.document_files USING btree (id);

alter table "public"."auth_user_profile" add constraint "profile_pkey" PRIMARY KEY using index "profile_pkey";

alter table "public"."bs_investor_deals" add constraint "bs_investor_deals_pkey" PRIMARY KEY using index "bs_investor_deals_pkey";

alter table "public"."bs_investor_distributions" add constraint "bs_investor_distributions_pkey" PRIMARY KEY using index "bs_investor_distributions_pkey";

alter table "public"."bs_investor_statements" add constraint "bs_investor_statements_pkey" PRIMARY KEY using index "bs_investor_statements_pkey";

alter table "public"."bs_investor_transactions" add constraint "bs_investor_distribution_payments_pkey" PRIMARY KEY using index "bs_investor_distribution_payments_pkey";

alter table "public"."bs_investor_transactions_references" add constraint "transaction_references_pkey" PRIMARY KEY using index "transaction_references_pkey";

alter table "public"."document_files" add constraint "Documents_pkey" PRIMARY KEY using index "Documents_pkey";

alter table "public"."user_clerk_orgs" add constraint "user_clerk_orgs_pkey" PRIMARY KEY using index "user_clerk_orgs_pkey";

alter table "public"."user_clerk_orgs_members" add constraint "user_org_memberships_pkey" PRIMARY KEY using index "user_org_memberships_pkey";

alter table "public"."appraisal" add constraint "appraisal_appraiser_id_fkey" FOREIGN KEY (appraiser_id) REFERENCES contact(id) ON DELETE SET NULL not valid;

alter table "public"."appraisal" validate constraint "appraisal_appraiser_id_fkey";

alter table "public"."appraisal" add constraint "appraisal_co_amc_fkey" FOREIGN KEY (co_amc) REFERENCES company(co_id) ON DELETE SET NULL not valid;

alter table "public"."appraisal" validate constraint "appraisal_co_amc_fkey";

alter table "public"."appraisal" add constraint "appraisal_co_appraisal_fkey" FOREIGN KEY (co_appraisal) REFERENCES company(co_id) ON DELETE SET NULL not valid;

alter table "public"."appraisal" validate constraint "appraisal_co_appraisal_fkey";

alter table "public"."appraisal" add constraint "appraisal_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE SET NULL not valid;

alter table "public"."appraisal" validate constraint "appraisal_deal_id_fkey";

alter table "public"."appraisal" add constraint "appraisal_document_id_fkey" FOREIGN KEY (document_id) REFERENCES document_files(id) ON DELETE SET NULL not valid;

alter table "public"."appraisal" validate constraint "appraisal_document_id_fkey";

alter table "public"."appraisal" add constraint "appraisal_property_id_fkey" FOREIGN KEY (property_id) REFERENCES property(id) ON DELETE SET NULL not valid;

alter table "public"."appraisal" validate constraint "appraisal_property_id_fkey";

alter table "public"."auth_user_profile" add constraint "profiles_username_key" UNIQUE using index "profiles_username_key";

alter table "public"."auth_user_profile" add constraint "user_profile_clerk_id_key" UNIQUE using index "user_profile_clerk_id_key";

alter table "public"."auth_user_profile" add constraint "user_profile_contact_id_fkey" FOREIGN KEY (contact_id) REFERENCES contact(id) not valid;

alter table "public"."auth_user_profile" validate constraint "user_profile_contact_id_fkey";

alter table "public"."auth_user_profile" add constraint "username_length" CHECK ((char_length(username) >= 3)) not valid;

alter table "public"."auth_user_profile" validate constraint "username_length";

alter table "public"."bs_debt_instruments_deals" add constraint "bs_debt_instruments_deals_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) not valid;

alter table "public"."bs_debt_instruments_deals" validate constraint "bs_debt_instruments_deals_deal_id_fkey";

alter table "public"."bs_debt_instruments_deals" add constraint "bs_debt_instruments_deals_instrument_id_fkey" FOREIGN KEY (instrument_id) REFERENCES bs_debt_instruments(id) not valid;

alter table "public"."bs_debt_instruments_deals" validate constraint "bs_debt_instruments_deals_instrument_id_fkey";

alter table "public"."bs_investor_deals" add constraint "bs_investor_deals_contact_id_fkey" FOREIGN KEY (contact_id) REFERENCES contact(id) ON DELETE CASCADE not valid;

alter table "public"."bs_investor_deals" validate constraint "bs_investor_deals_contact_id_fkey";

alter table "public"."bs_investor_deals" add constraint "bs_investor_deals_contact_types_id_fkey" FOREIGN KEY (contact_types_id) REFERENCES contact_types(id) ON DELETE CASCADE not valid;

alter table "public"."bs_investor_deals" validate constraint "bs_investor_deals_contact_types_id_fkey";

alter table "public"."bs_investor_deals" add constraint "bs_investor_deals_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE CASCADE not valid;

alter table "public"."bs_investor_deals" validate constraint "bs_investor_deals_deal_id_fkey";

alter table "public"."bs_investor_distributions" add constraint "bs_investor_distribution_details_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) not valid;

alter table "public"."bs_investor_distributions" validate constraint "bs_investor_distribution_details_deal_id_fkey";

alter table "public"."bs_investor_distributions" add constraint "bs_investor_distributions_instrument_id_fkey" FOREIGN KEY (instrument_id) REFERENCES bs_debt_instruments(id) not valid;

alter table "public"."bs_investor_distributions" validate constraint "bs_investor_distributions_instrument_id_fkey";

alter table "public"."bs_investor_distributions" add constraint "bs_investor_distributions_investor_id_fkey" FOREIGN KEY (investor_id) REFERENCES contact(id) not valid;

alter table "public"."bs_investor_distributions" validate constraint "bs_investor_distributions_investor_id_fkey";

alter table "public"."bs_investor_distributions" add constraint "bs_investor_distributions_statement_id_fkey" FOREIGN KEY (statement_id) REFERENCES bs_investor_statements(id) ON DELETE CASCADE not valid;

alter table "public"."bs_investor_distributions" validate constraint "bs_investor_distributions_statement_id_fkey";

alter table "public"."bs_investor_statements" add constraint "bs_investor_statements_investor_id_fkey" FOREIGN KEY (investor_id) REFERENCES contact(id) ON DELETE RESTRICT not valid;

alter table "public"."bs_investor_statements" validate constraint "bs_investor_statements_investor_id_fkey";

alter table "public"."bs_investor_statements" add constraint "bs_investor_statements_user_clerk_orgs_id_fkey" FOREIGN KEY (user_clerk_orgs_id) REFERENCES user_clerk_orgs(id) not valid;

alter table "public"."bs_investor_statements" validate constraint "bs_investor_statements_user_clerk_orgs_id_fkey";

alter table "public"."bs_investor_transactions" add constraint "bs_investor_distribution_payments_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON UPDATE CASCADE not valid;

alter table "public"."bs_investor_transactions" validate constraint "bs_investor_distribution_payments_deal_id_fkey";

alter table "public"."bs_investor_transactions" add constraint "bs_investor_transactions_instrument_id_fkey" FOREIGN KEY (instrument_id) REFERENCES bs_debt_instruments(id) not valid;

alter table "public"."bs_investor_transactions" validate constraint "bs_investor_transactions_instrument_id_fkey";

alter table "public"."bs_investor_transactions" add constraint "bs_investor_transactions_investor_id_fkey" FOREIGN KEY (investor_id) REFERENCES contact(id) not valid;

alter table "public"."bs_investor_transactions" validate constraint "bs_investor_transactions_investor_id_fkey";

alter table "public"."bs_investor_transactions_references" add constraint "transaction_references_transaction_id_fkey" FOREIGN KEY (transaction_id) REFERENCES bs_investor_transactions(id) ON DELETE CASCADE not valid;

alter table "public"."bs_investor_transactions_references" validate constraint "transaction_references_transaction_id_fkey";

alter table "public"."cba_requests" add constraint "cba_submission_credit_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) not valid;

alter table "public"."cba_requests" validate constraint "cba_submission_credit_deal_id_fkey";

alter table "public"."cba_requests" add constraint "cba_submission_credit_id_key" UNIQUE using index "cba_submission_credit_id_key";

alter table "public"."cba_requests" add constraint "cba_submission_credit_submitted_by_fkey" FOREIGN KEY (submitted_by) REFERENCES auth_user_profile(id) not valid;

alter table "public"."cba_requests" validate constraint "cba_submission_credit_submitted_by_fkey";

alter table "public"."cba_requests" add constraint "cba_submission_credit_uw_prequal_result_background_fkey" FOREIGN KEY (uw_prequal_result_background) REFERENCES select_uw_outcomes(id) not valid;

alter table "public"."cba_requests" validate constraint "cba_submission_credit_uw_prequal_result_background_fkey";

alter table "public"."cba_requests" add constraint "cba_submission_credit_uw_prequal_result_credit_fkey" FOREIGN KEY (uw_prequal_result_credit) REFERENCES select_uw_outcomes(id) not valid;

alter table "public"."cba_requests" validate constraint "cba_submission_credit_uw_prequal_result_credit_fkey";

alter table "public"."company" add constraint "company_primary_guarantor_id_fkey" FOREIGN KEY (primary_guarantor_id) REFERENCES company_member(member_id) ON UPDATE CASCADE not valid;

alter table "public"."company" validate constraint "company_primary_guarantor_id_fkey";

alter table "public"."company_contact" add constraint "company_contact_co_id_fkey" FOREIGN KEY (co_id) REFERENCES company(co_id) ON DELETE CASCADE not valid;

alter table "public"."company_contact" validate constraint "company_contact_co_id_fkey";

alter table "public"."company_contact" add constraint "company_contact_contact_id_fkey" FOREIGN KEY (contact_id) REFERENCES contact(id) ON DELETE CASCADE not valid;

alter table "public"."company_contact" validate constraint "company_contact_contact_id_fkey";

alter table "public"."company_contact" add constraint "company_contact_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE SET NULL not valid;

alter table "public"."company_contact" validate constraint "company_contact_deal_id_fkey";

alter table "public"."company_contact" add constraint "unique_company_contact" UNIQUE using index "unique_company_contact";

alter table "public"."company_member" add constraint "company_member_member_borrower_id_fkey" FOREIGN KEY (member_borrower_id) REFERENCES borrower(id) ON DELETE CASCADE not valid;

alter table "public"."company_member" validate constraint "company_member_member_borrower_id_fkey";

alter table "public"."company_member" add constraint "company_member_member_company_id_fkey" FOREIGN KEY (member_company_id) REFERENCES company(co_id) ON DELETE CASCADE not valid;

alter table "public"."company_member" validate constraint "company_member_member_company_id_fkey";

alter table "public"."company_member" add constraint "company_member_member_owning_company_id_fkey" FOREIGN KEY (member_owning_company_id) REFERENCES company(co_id) ON DELETE SET NULL not valid;

alter table "public"."company_member" validate constraint "company_member_member_owning_company_id_fkey";

alter table "public"."company_roles" add constraint "company_roles_co_id_fkey" FOREIGN KEY (co_id) REFERENCES company(co_id) ON DELETE CASCADE not valid;

alter table "public"."company_roles" validate constraint "company_roles_co_id_fkey";

alter table "public"."company_roles" add constraint "company_roles_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON UPDATE CASCADE ON DELETE SET NULL not valid;

alter table "public"."company_roles" validate constraint "company_roles_deal_id_fkey";

alter table "public"."company_roles" add constraint "company_roles_role_id_fkey" FOREIGN KEY (role_id) REFERENCES company_roles_defined(id) ON DELETE CASCADE not valid;

alter table "public"."company_roles" validate constraint "company_roles_role_id_fkey";

alter table "public"."company_roles" add constraint "unique_company_role_deal" UNIQUE using index "unique_company_role_deal";

alter table "public"."company_roles_defined" add constraint "company_role_mm_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."company_roles_defined" validate constraint "company_role_mm_deal_id_fkey";

alter table "public"."company_roles_defined" add constraint "company_role_name_key" UNIQUE using index "company_role_name_key";

alter table "public"."constants" add constraint "constants_name_key" UNIQUE using index "constants_name_key";

alter table "public"."contact" add constraint "contact_company_id_fkey" FOREIGN KEY (company_id) REFERENCES company(co_id) not valid;

alter table "public"."contact" validate constraint "contact_company_id_fkey";

alter table "public"."contact" add constraint "contact_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth_user_profile(id) not valid;

alter table "public"."contact" validate constraint "contact_user_id_fkey";

alter table "public"."contact_types_jt" add constraint "contact_types_jt_id_key" UNIQUE using index "contact_types_jt_id_key";

alter table "public"."contact_types_jt" add constraint "public_contact_contact_types_contact_id_fkey" FOREIGN KEY (contact_id) REFERENCES contact(id) ON DELETE CASCADE not valid;

alter table "public"."contact_types_jt" validate constraint "public_contact_contact_types_contact_id_fkey";

alter table "public"."contact_types_jt" add constraint "public_contact_contact_types_contact_types_id_fkey" FOREIGN KEY (contact_types_id) REFERENCES contact_types(id) ON DELETE CASCADE not valid;

alter table "public"."contact_types_jt" validate constraint "public_contact_contact_types_contact_types_id_fkey";

alter table "public"."custom_loan_fees" add constraint "public_custom_loan_fees_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) not valid;

alter table "public"."custom_loan_fees" validate constraint "public_custom_loan_fees_deal_id_fkey";

alter table "public"."deal" add constraint "deal_appraisal_poc_contact_id_fkey" FOREIGN KEY (appraisal_poc_contact_id) REFERENCES contact(id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_appraisal_poc_contact_id_fkey";

alter table "public"."deal" add constraint "deal_broker_company_id_fkey" FOREIGN KEY (broker_company_id) REFERENCES company(co_id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_broker_company_id_fkey";

alter table "public"."deal" add constraint "deal_closing_agent_contact_id_fkey" FOREIGN KEY (closing_agent_contact_id) REFERENCES contact(id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_closing_agent_contact_id_fkey";

alter table "public"."deal" add constraint "deal_escrow_company_id_fkey" FOREIGN KEY (escrow_company_id) REFERENCES company(co_id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_escrow_company_id_fkey";

alter table "public"."deal" add constraint "deal_escrow_contact_id_fkey" FOREIGN KEY (escrow_contact_id) REFERENCES contact(id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_escrow_contact_id_fkey";

alter table "public"."deal" add constraint "deal_fourth_guarantor_id_fkey" FOREIGN KEY (fourth_guarantor_id) REFERENCES guarantor(guarantor_id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_fourth_guarantor_id_fkey";

alter table "public"."deal" add constraint "deal_insurance_carrier_company_id_fkey" FOREIGN KEY (insurance_carrier_company_id) REFERENCES company(co_id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_insurance_carrier_company_id_fkey";

alter table "public"."deal" add constraint "deal_insurance_carrier_contact_id_fkey" FOREIGN KEY (insurance_carrier_contact_id) REFERENCES contact(id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_insurance_carrier_contact_id_fkey";

alter table "public"."deal" add constraint "deal_loan_buyer_company_id_fkey" FOREIGN KEY (loan_buyer_company_id) REFERENCES company(co_id) not valid;

alter table "public"."deal" validate constraint "deal_loan_buyer_company_id_fkey";

alter table "public"."deal" add constraint "deal_loan_buyer_contact_id_fkey" FOREIGN KEY (loan_buyer_contact_id) REFERENCES contact(id) not valid;

alter table "public"."deal" validate constraint "deal_loan_buyer_contact_id_fkey";

alter table "public"."deal" add constraint "deal_loan_opener_id_fkey" FOREIGN KEY (loan_opener_id) REFERENCES auth_user_profile(id) not valid;

alter table "public"."deal" validate constraint "deal_loan_opener_id_fkey";

alter table "public"."deal" add constraint "deal_loan_processor_id_fkey" FOREIGN KEY (loan_processor_id) REFERENCES auth_user_profile(id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_loan_processor_id_fkey";

alter table "public"."deal" add constraint "deal_primary_guarantor_id_fkey" FOREIGN KEY (primary_guarantor_id) REFERENCES guarantor(guarantor_id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_primary_guarantor_id_fkey";

alter table "public"."deal" add constraint "deal_second_guarantor_id_fkey" FOREIGN KEY (second_guarantor_id) REFERENCES guarantor(guarantor_id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_second_guarantor_id_fkey";

alter table "public"."deal" add constraint "deal_third_guarantor_id_fkey" FOREIGN KEY (third_guarantor_id) REFERENCES guarantor(guarantor_id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_third_guarantor_id_fkey";

alter table "public"."deal" add constraint "deal_title_company_id_fkey" FOREIGN KEY (title_company_id) REFERENCES company(co_id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "deal_title_company_id_fkey";

alter table "public"."deal" add constraint "public_deal_account_executive_id_fkey" FOREIGN KEY (account_executive_id) REFERENCES auth_user_profile(id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "public_deal_account_executive_id_fkey";

alter table "public"."deal" add constraint "public_deal_broker_id_fkey" FOREIGN KEY (broker_id) REFERENCES contact(id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "public_deal_broker_id_fkey";

alter table "public"."deal" add constraint "public_deal_company_id_fkey" FOREIGN KEY (company_id) REFERENCES company(co_id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "public_deal_company_id_fkey";

alter table "public"."deal" add constraint "public_deal_property_id_fkey" FOREIGN KEY (property_id) REFERENCES property(id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "public_deal_property_id_fkey";

alter table "public"."deal" add constraint "public_deal_title_company_contact_id_fkey" FOREIGN KEY (title_company_contact_id) REFERENCES contact(id) ON DELETE SET NULL not valid;

alter table "public"."deal" validate constraint "public_deal_title_company_contact_id_fkey";

alter table "public"."deal_appraisals" add constraint "deal_appraisals_appraisal_id_fkey" FOREIGN KEY (appraisal_id) REFERENCES appraisal(id) ON DELETE SET NULL not valid;

alter table "public"."deal_appraisals" validate constraint "deal_appraisals_appraisal_id_fkey";

alter table "public"."deal_appraisals" add constraint "deal_appraisals_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE SET NULL not valid;

alter table "public"."deal_appraisals" validate constraint "deal_appraisals_deal_id_fkey";

alter table "public"."deal_appraisals" add constraint "deal_appraisals_property_Id_fkey" FOREIGN KEY ("property_Id") REFERENCES property(id) ON DELETE SET NULL not valid;

alter table "public"."deal_appraisals" validate constraint "deal_appraisals_property_Id_fkey";

alter table "public"."deal_appraisals" add constraint "unique_deal_appraisal" UNIQUE using index "unique_deal_appraisal";

alter table "public"."deal_property" add constraint "public_deal_property_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE CASCADE not valid;

alter table "public"."deal_property" validate constraint "public_deal_property_deal_id_fkey";

alter table "public"."deal_property" add constraint "public_deal_property_property_id_fkey" FOREIGN KEY (property_id) REFERENCES property(id) not valid;

alter table "public"."deal_property" validate constraint "public_deal_property_property_id_fkey";

alter table "public"."deal_roles" add constraint "public_deal_roles_contact_id_fkey" FOREIGN KEY (contact_id) REFERENCES contact(id) ON DELETE CASCADE not valid;

alter table "public"."deal_roles" validate constraint "public_deal_roles_contact_id_fkey";

alter table "public"."deal_roles" add constraint "public_deal_roles_contact_types_id_fkey" FOREIGN KEY (contact_types_id) REFERENCES contact_types(id) ON DELETE CASCADE not valid;

alter table "public"."deal_roles" validate constraint "public_deal_roles_contact_types_id_fkey";

alter table "public"."deal_roles" add constraint "public_deal_roles_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE CASCADE not valid;

alter table "public"."deal_roles" validate constraint "public_deal_roles_deal_id_fkey";

alter table "public"."document_files" add constraint "documents_borrower_id_fkey" FOREIGN KEY (borrower_id) REFERENCES borrower(id) ON DELETE CASCADE not valid;

alter table "public"."document_files" validate constraint "documents_borrower_id_fkey";

alter table "public"."document_files" add constraint "documents_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE CASCADE not valid;

alter table "public"."document_files" validate constraint "documents_deal_id_fkey";

alter table "public"."document_files" add constraint "documents_entity_id_fkey" FOREIGN KEY (entity_id) REFERENCES company(co_id) ON DELETE CASCADE not valid;

alter table "public"."document_files" validate constraint "documents_entity_id_fkey";

alter table "public"."document_files" add constraint "documents_guarantor_id_fkey" FOREIGN KEY (guarantor_id) REFERENCES guarantor(guarantor_id) not valid;

alter table "public"."document_files" validate constraint "documents_guarantor_id_fkey";

alter table "public"."document_files" add constraint "documents_property_id_fkey" FOREIGN KEY (property_id) REFERENCES property(id) not valid;

alter table "public"."document_files" validate constraint "documents_property_id_fkey";

alter table "public"."document_roles" add constraint "document_roles_role_name_key" UNIQUE using index "document_roles_role_name_key";

alter table "public"."document_roles_assigned" add constraint "fk_document" FOREIGN KEY (document_id) REFERENCES document_files(id) ON DELETE CASCADE not valid;

alter table "public"."document_roles_assigned" validate constraint "fk_document";

alter table "public"."document_roles_assigned" add constraint "fk_role" FOREIGN KEY (role_id) REFERENCES document_roles(id) ON DELETE CASCADE not valid;

alter table "public"."document_roles_assigned" validate constraint "fk_role";

alter table "public"."guarantor" add constraint "guarantor_borrower_id_fkey" FOREIGN KEY (borrower_id) REFERENCES borrower(id) ON DELETE CASCADE not valid;

alter table "public"."guarantor" validate constraint "guarantor_borrower_id_fkey";

alter table "public"."guarantor" add constraint "guarantor_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE CASCADE not valid;

alter table "public"."guarantor" validate constraint "guarantor_deal_id_fkey";

alter table "public"."loan_application" add constraint "loan_application_application_deal_id_fkey" FOREIGN KEY (application_deal_id) REFERENCES deal(id) ON DELETE SET NULL not valid;

alter table "public"."loan_application" validate constraint "loan_application_application_deal_id_fkey";

alter table "public"."milestones" add constraint "milestones_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE CASCADE not valid;

alter table "public"."milestones" validate constraint "milestones_deal_id_fkey";

alter table "public"."milestones" add constraint "milestones_milestone_template_id_fkey" FOREIGN KEY (milestone_template_id) REFERENCES milestone_templates(id) not valid;

alter table "public"."milestones" validate constraint "milestones_milestone_template_id_fkey";

alter table "public"."payroll_submission" add constraint "payroll_submission_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON UPDATE CASCADE ON DELETE SET NULL not valid;

alter table "public"."payroll_submission" validate constraint "payroll_submission_deal_id_fkey";

alter table "public"."payroll_submission_fees_1099" add constraint "payroll_submission_fees_1099_broker_id_fkey" FOREIGN KEY (broker_id) REFERENCES contact(id) ON UPDATE CASCADE ON DELETE SET NULL not valid;

alter table "public"."payroll_submission_fees_1099" validate constraint "payroll_submission_fees_1099_broker_id_fkey";

alter table "public"."payroll_submission_fees_1099" add constraint "payroll_submission_fees_1099_payroll_submission_id_fkey" FOREIGN KEY (payroll_submission_id) REFERENCES payroll_submission(id) ON UPDATE CASCADE ON DELETE SET NULL not valid;

alter table "public"."payroll_submission_fees_1099" validate constraint "payroll_submission_fees_1099_payroll_submission_id_fkey";

alter table "public"."property" add constraint "property_hoa_contact_fkey" FOREIGN KEY (hoa_contact) REFERENCES contact(id) ON UPDATE CASCADE ON DELETE SET NULL not valid;

alter table "public"."property" validate constraint "property_hoa_contact_fkey";

alter table "public"."property_income" add constraint "property_income_property_id_fkey" FOREIGN KEY (property_id) REFERENCES property(id) not valid;

alter table "public"."property_income" validate constraint "property_income_property_id_fkey";

alter table "public"."property_reapi" add constraint "property_reapi_address_zip5_check" CHECK ((length(address_zip5) = 5)) not valid;

alter table "public"."property_reapi" validate constraint "property_reapi_address_zip5_check";

alter table "public"."property_reapi" add constraint "property_reapi_id_key" UNIQUE using index "property_reapi_id_key";

alter table "public"."property_reapi" add constraint "property_reapi_pinfo_address_zip4_check" CHECK ((length(address_zip4) = 4)) not valid;

alter table "public"."property_reapi" validate constraint "property_reapi_pinfo_address_zip4_check";

alter table "public"."property_reapi" add constraint "property_reapi_property_id_fkey" FOREIGN KEY (property_id) REFERENCES property(id) not valid;

alter table "public"."property_reapi" validate constraint "property_reapi_property_id_fkey";

alter table "public"."property_reapi" add constraint "property_reapi_tax_year_check" CHECK ((tax_year = 4)) not valid;

alter table "public"."property_reapi" validate constraint "property_reapi_tax_year_check";

alter table "public"."select_uw_outcomes" add constraint "uw_result_id_key" UNIQUE using index "uw_result_id_key";

alter table "public"."task_templates" add constraint "task_templates_assigned_to_fkey" FOREIGN KEY (assigned_to) REFERENCES auth_user_profile(id) not valid;

alter table "public"."task_templates" validate constraint "task_templates_assigned_to_fkey";

alter table "public"."task_templates" add constraint "task_templates_milestone_template_id_fkey" FOREIGN KEY (milestone_template_id) REFERENCES milestone_templates(id) not valid;

alter table "public"."task_templates" validate constraint "task_templates_milestone_template_id_fkey";

alter table "public"."tasks" add constraint "Tasks_id_key" UNIQUE using index "Tasks_id_key";

alter table "public"."tasks" add constraint "tasks_assigned_to_fkey" FOREIGN KEY (assigned_to) REFERENCES auth_user_profile(id) not valid;

alter table "public"."tasks" validate constraint "tasks_assigned_to_fkey";

alter table "public"."tasks" add constraint "tasks_deal_id_fkey" FOREIGN KEY (deal_id) REFERENCES deal(id) ON DELETE SET NULL not valid;

alter table "public"."tasks" validate constraint "tasks_deal_id_fkey";

alter table "public"."tasks" add constraint "tasks_milestone_id_fkey" FOREIGN KEY (milestone_id) REFERENCES milestones(id) ON DELETE CASCADE not valid;

alter table "public"."tasks" validate constraint "tasks_milestone_id_fkey";

alter table "public"."user_clerk_orgs" add constraint "user_clerk_orgs_clerk_organization_id_key" UNIQUE using index "user_clerk_orgs_clerk_organization_id_key";

alter table "public"."user_clerk_orgs" add constraint "user_clerk_orgs_created_by_clerk_id_fkey" FOREIGN KEY (created_by_clerk_id) REFERENCES auth_user_profile(clerk_id) not valid;

alter table "public"."user_clerk_orgs" validate constraint "user_clerk_orgs_created_by_clerk_id_fkey";

alter table "public"."user_clerk_orgs" add constraint "user_clerk_orgs_slug_key" UNIQUE using index "user_clerk_orgs_slug_key";

alter table "public"."user_clerk_orgs_members" add constraint "user_clerk_orgs_members_clerk_organization_fkey_fkey" FOREIGN KEY (clerk_organization_fkey) REFERENCES user_clerk_orgs(id) not valid;

alter table "public"."user_clerk_orgs_members" validate constraint "user_clerk_orgs_members_clerk_organization_fkey_fkey";

alter table "public"."user_clerk_orgs_members" add constraint "user_org_memberships_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth_user_profile(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."user_clerk_orgs_members" validate constraint "user_org_memberships_user_id_fkey";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.update_property_address()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$declare 
  new_address text;
begin
  IF length(new.address_state_long::text) > 2 THEN
    new.address_state := get_state_code(new.address_state_long::text);
  END IF;

  new_address := format_address(new.address_street, new.address_suite_apt, new.address_city, new.address_state::text, new.address_postal_code, new.address_country, null);
  
  new.address = new_address;
  return new;
end;$function$
;

grant delete on table "public"."auth_user_profile" to "anon";

grant insert on table "public"."auth_user_profile" to "anon";

grant references on table "public"."auth_user_profile" to "anon";

grant select on table "public"."auth_user_profile" to "anon";

grant trigger on table "public"."auth_user_profile" to "anon";

grant truncate on table "public"."auth_user_profile" to "anon";

grant update on table "public"."auth_user_profile" to "anon";

grant delete on table "public"."auth_user_profile" to "authenticated";

grant insert on table "public"."auth_user_profile" to "authenticated";

grant references on table "public"."auth_user_profile" to "authenticated";

grant select on table "public"."auth_user_profile" to "authenticated";

grant trigger on table "public"."auth_user_profile" to "authenticated";

grant truncate on table "public"."auth_user_profile" to "authenticated";

grant update on table "public"."auth_user_profile" to "authenticated";

grant delete on table "public"."auth_user_profile" to "service_role";

grant insert on table "public"."auth_user_profile" to "service_role";

grant references on table "public"."auth_user_profile" to "service_role";

grant select on table "public"."auth_user_profile" to "service_role";

grant trigger on table "public"."auth_user_profile" to "service_role";

grant truncate on table "public"."auth_user_profile" to "service_role";

grant update on table "public"."auth_user_profile" to "service_role";

grant delete on table "public"."bs_investor_deals" to "anon";

grant insert on table "public"."bs_investor_deals" to "anon";

grant references on table "public"."bs_investor_deals" to "anon";

grant select on table "public"."bs_investor_deals" to "anon";

grant trigger on table "public"."bs_investor_deals" to "anon";

grant truncate on table "public"."bs_investor_deals" to "anon";

grant update on table "public"."bs_investor_deals" to "anon";

grant delete on table "public"."bs_investor_deals" to "authenticated";

grant insert on table "public"."bs_investor_deals" to "authenticated";

grant references on table "public"."bs_investor_deals" to "authenticated";

grant select on table "public"."bs_investor_deals" to "authenticated";

grant trigger on table "public"."bs_investor_deals" to "authenticated";

grant truncate on table "public"."bs_investor_deals" to "authenticated";

grant update on table "public"."bs_investor_deals" to "authenticated";

grant delete on table "public"."bs_investor_deals" to "service_role";

grant insert on table "public"."bs_investor_deals" to "service_role";

grant references on table "public"."bs_investor_deals" to "service_role";

grant select on table "public"."bs_investor_deals" to "service_role";

grant trigger on table "public"."bs_investor_deals" to "service_role";

grant truncate on table "public"."bs_investor_deals" to "service_role";

grant update on table "public"."bs_investor_deals" to "service_role";

grant delete on table "public"."bs_investor_distributions" to "anon";

grant insert on table "public"."bs_investor_distributions" to "anon";

grant references on table "public"."bs_investor_distributions" to "anon";

grant select on table "public"."bs_investor_distributions" to "anon";

grant trigger on table "public"."bs_investor_distributions" to "anon";

grant truncate on table "public"."bs_investor_distributions" to "anon";

grant update on table "public"."bs_investor_distributions" to "anon";

grant delete on table "public"."bs_investor_distributions" to "authenticated";

grant insert on table "public"."bs_investor_distributions" to "authenticated";

grant references on table "public"."bs_investor_distributions" to "authenticated";

grant select on table "public"."bs_investor_distributions" to "authenticated";

grant trigger on table "public"."bs_investor_distributions" to "authenticated";

grant truncate on table "public"."bs_investor_distributions" to "authenticated";

grant update on table "public"."bs_investor_distributions" to "authenticated";

grant delete on table "public"."bs_investor_distributions" to "service_role";

grant insert on table "public"."bs_investor_distributions" to "service_role";

grant references on table "public"."bs_investor_distributions" to "service_role";

grant select on table "public"."bs_investor_distributions" to "service_role";

grant trigger on table "public"."bs_investor_distributions" to "service_role";

grant truncate on table "public"."bs_investor_distributions" to "service_role";

grant update on table "public"."bs_investor_distributions" to "service_role";

grant delete on table "public"."bs_investor_statements" to "anon";

grant insert on table "public"."bs_investor_statements" to "anon";

grant references on table "public"."bs_investor_statements" to "anon";

grant select on table "public"."bs_investor_statements" to "anon";

grant trigger on table "public"."bs_investor_statements" to "anon";

grant truncate on table "public"."bs_investor_statements" to "anon";

grant update on table "public"."bs_investor_statements" to "anon";

grant delete on table "public"."bs_investor_statements" to "authenticated";

grant insert on table "public"."bs_investor_statements" to "authenticated";

grant references on table "public"."bs_investor_statements" to "authenticated";

grant select on table "public"."bs_investor_statements" to "authenticated";

grant trigger on table "public"."bs_investor_statements" to "authenticated";

grant truncate on table "public"."bs_investor_statements" to "authenticated";

grant update on table "public"."bs_investor_statements" to "authenticated";

grant delete on table "public"."bs_investor_statements" to "service_role";

grant insert on table "public"."bs_investor_statements" to "service_role";

grant references on table "public"."bs_investor_statements" to "service_role";

grant select on table "public"."bs_investor_statements" to "service_role";

grant trigger on table "public"."bs_investor_statements" to "service_role";

grant truncate on table "public"."bs_investor_statements" to "service_role";

grant update on table "public"."bs_investor_statements" to "service_role";

grant delete on table "public"."bs_investor_transactions" to "anon";

grant insert on table "public"."bs_investor_transactions" to "anon";

grant references on table "public"."bs_investor_transactions" to "anon";

grant select on table "public"."bs_investor_transactions" to "anon";

grant trigger on table "public"."bs_investor_transactions" to "anon";

grant truncate on table "public"."bs_investor_transactions" to "anon";

grant update on table "public"."bs_investor_transactions" to "anon";

grant delete on table "public"."bs_investor_transactions" to "authenticated";

grant insert on table "public"."bs_investor_transactions" to "authenticated";

grant references on table "public"."bs_investor_transactions" to "authenticated";

grant select on table "public"."bs_investor_transactions" to "authenticated";

grant trigger on table "public"."bs_investor_transactions" to "authenticated";

grant truncate on table "public"."bs_investor_transactions" to "authenticated";

grant update on table "public"."bs_investor_transactions" to "authenticated";

grant delete on table "public"."bs_investor_transactions" to "service_role";

grant insert on table "public"."bs_investor_transactions" to "service_role";

grant references on table "public"."bs_investor_transactions" to "service_role";

grant select on table "public"."bs_investor_transactions" to "service_role";

grant trigger on table "public"."bs_investor_transactions" to "service_role";

grant truncate on table "public"."bs_investor_transactions" to "service_role";

grant update on table "public"."bs_investor_transactions" to "service_role";

grant delete on table "public"."bs_investor_transactions_references" to "anon";

grant insert on table "public"."bs_investor_transactions_references" to "anon";

grant references on table "public"."bs_investor_transactions_references" to "anon";

grant select on table "public"."bs_investor_transactions_references" to "anon";

grant trigger on table "public"."bs_investor_transactions_references" to "anon";

grant truncate on table "public"."bs_investor_transactions_references" to "anon";

grant update on table "public"."bs_investor_transactions_references" to "anon";

grant delete on table "public"."bs_investor_transactions_references" to "authenticated";

grant insert on table "public"."bs_investor_transactions_references" to "authenticated";

grant references on table "public"."bs_investor_transactions_references" to "authenticated";

grant select on table "public"."bs_investor_transactions_references" to "authenticated";

grant trigger on table "public"."bs_investor_transactions_references" to "authenticated";

grant truncate on table "public"."bs_investor_transactions_references" to "authenticated";

grant update on table "public"."bs_investor_transactions_references" to "authenticated";

grant delete on table "public"."bs_investor_transactions_references" to "service_role";

grant insert on table "public"."bs_investor_transactions_references" to "service_role";

grant references on table "public"."bs_investor_transactions_references" to "service_role";

grant select on table "public"."bs_investor_transactions_references" to "service_role";

grant trigger on table "public"."bs_investor_transactions_references" to "service_role";

grant truncate on table "public"."bs_investor_transactions_references" to "service_role";

grant update on table "public"."bs_investor_transactions_references" to "service_role";

grant delete on table "public"."user_clerk_orgs" to "anon";

grant insert on table "public"."user_clerk_orgs" to "anon";

grant references on table "public"."user_clerk_orgs" to "anon";

grant select on table "public"."user_clerk_orgs" to "anon";

grant trigger on table "public"."user_clerk_orgs" to "anon";

grant truncate on table "public"."user_clerk_orgs" to "anon";

grant update on table "public"."user_clerk_orgs" to "anon";

grant delete on table "public"."user_clerk_orgs" to "authenticated";

grant insert on table "public"."user_clerk_orgs" to "authenticated";

grant references on table "public"."user_clerk_orgs" to "authenticated";

grant select on table "public"."user_clerk_orgs" to "authenticated";

grant trigger on table "public"."user_clerk_orgs" to "authenticated";

grant truncate on table "public"."user_clerk_orgs" to "authenticated";

grant update on table "public"."user_clerk_orgs" to "authenticated";

grant delete on table "public"."user_clerk_orgs" to "service_role";

grant insert on table "public"."user_clerk_orgs" to "service_role";

grant references on table "public"."user_clerk_orgs" to "service_role";

grant select on table "public"."user_clerk_orgs" to "service_role";

grant trigger on table "public"."user_clerk_orgs" to "service_role";

grant truncate on table "public"."user_clerk_orgs" to "service_role";

grant update on table "public"."user_clerk_orgs" to "service_role";

grant delete on table "public"."user_clerk_orgs_members" to "anon";

grant insert on table "public"."user_clerk_orgs_members" to "anon";

grant references on table "public"."user_clerk_orgs_members" to "anon";

grant select on table "public"."user_clerk_orgs_members" to "anon";

grant trigger on table "public"."user_clerk_orgs_members" to "anon";

grant truncate on table "public"."user_clerk_orgs_members" to "anon";

grant update on table "public"."user_clerk_orgs_members" to "anon";

grant delete on table "public"."user_clerk_orgs_members" to "authenticated";

grant insert on table "public"."user_clerk_orgs_members" to "authenticated";

grant references on table "public"."user_clerk_orgs_members" to "authenticated";

grant select on table "public"."user_clerk_orgs_members" to "authenticated";

grant trigger on table "public"."user_clerk_orgs_members" to "authenticated";

grant truncate on table "public"."user_clerk_orgs_members" to "authenticated";

grant update on table "public"."user_clerk_orgs_members" to "authenticated";

grant delete on table "public"."user_clerk_orgs_members" to "service_role";

grant insert on table "public"."user_clerk_orgs_members" to "service_role";

grant references on table "public"."user_clerk_orgs_members" to "service_role";

grant select on table "public"."user_clerk_orgs_members" to "service_role";

grant trigger on table "public"."user_clerk_orgs_members" to "service_role";

grant truncate on table "public"."user_clerk_orgs_members" to "service_role";

grant update on table "public"."user_clerk_orgs_members" to "service_role";

create policy "Service role can insert new users"
on "public"."auth_user_profile"
as permissive
for insert
to service_role
with check (true);


create policy "Service role can read all profiles"
on "public"."auth_user_profile"
as permissive
for select
to service_role
using (true);


create policy "Service role can update user profiles"
on "public"."auth_user_profile"
as permissive
for update
to service_role
using (true)
with check (true);


create policy "Users can select their own profile"
on "public"."auth_user_profile"
as permissive
for select
to authenticated
using ((clerk_id = (auth.jwt() ->> 'sub'::text)));


create policy "Allow auth select"
on "public"."borrower"
as permissive
for select
to authenticated, anon
using (true);


create policy "Balance Sheet Investor or Org Member can view investor deals"
on "public"."bs_investor_deals"
as permissive
for select
to authenticated
using (((EXISTS ( SELECT 1
   FROM (contact c
     JOIN auth_user_profile up ON ((c.user_id = up.id)))
  WHERE ((c.id = bs_investor_deals.contact_id) AND (up.clerk_id = (auth.jwt() ->> 'sub'::text)) AND (up.role = 'balance_sheet_investor'::user_role_internal)))) OR ((EXISTS ( SELECT 1
   FROM (auth_user_profile up2
     JOIN user_clerk_orgs_members uom2 ON ((up2.id = uom2.user_id)))
  WHERE ((up2.clerk_id = (auth.jwt() ->> 'sub'::text)) AND (up2.role = 'balance_sheet_investor'::user_role_internal)))) AND (EXISTS ( SELECT 1
   FROM ((contact c
     JOIN auth_user_profile up ON ((c.user_id = up.id)))
     JOIN user_clerk_orgs_members uom ON ((up.id = uom.user_id)))
  WHERE ((c.id = bs_investor_deals.contact_id) AND (up.role = 'balance_sheet_investor'::user_role_internal) AND (uom.clerk_organization_id IN ( SELECT uom2.clerk_organization_id
           FROM (auth_user_profile up2
             JOIN user_clerk_orgs_members uom2 ON ((up2.id = uom2.user_id)))
          WHERE ((up2.clerk_id = (auth.jwt() ->> 'sub'::text)) AND (up2.role = 'balance_sheet_investor'::user_role_internal))))))))));


create policy "Balance Sheet Investor or Org Member can view distributions"
on "public"."bs_investor_distributions"
as permissive
for select
to authenticated
using (((EXISTS ( SELECT 1
   FROM ((bs_investor_deals bid
     JOIN contact c ON ((bid.contact_id = c.id)))
     JOIN auth_user_profile up ON ((c.user_id = up.id)))
  WHERE ((bid.deal_id = bs_investor_distributions.deal_id) AND (up.clerk_id = (auth.jwt() ->> 'sub'::text)) AND (up.role = 'balance_sheet_investor'::user_role_internal)))) OR ((EXISTS ( SELECT 1
   FROM (((bs_investor_deals bid
     JOIN contact c ON ((bid.contact_id = c.id)))
     JOIN auth_user_profile up ON ((c.user_id = up.id)))
     JOIN user_clerk_orgs_members uom ON ((up.id = uom.user_id)))
  WHERE ((bid.deal_id = bs_investor_distributions.deal_id) AND (uom.clerk_organization_id = bs_investor_distributions.clerk_organization_id) AND (up.role = 'balance_sheet_investor'::user_role_internal)))) AND (EXISTS ( SELECT 1
   FROM (auth_user_profile up2
     JOIN user_clerk_orgs_members uom2 ON ((up2.id = uom2.user_id)))
  WHERE ((up2.clerk_id = (auth.jwt() ->> 'sub'::text)) AND (up2.role = 'balance_sheet_investor'::user_role_internal) AND (uom2.clerk_organization_id = bs_investor_distributions.clerk_organization_id)))))));


create policy "Investor or Org Member can view distributions"
on "public"."bs_investor_distributions"
as permissive
for select
to authenticated
using (((EXISTS ( SELECT 1
   FROM (contact
     JOIN auth_user_profile ON ((contact.user_id = auth_user_profile.id)))
  WHERE ((contact.id = bs_investor_distributions.investor_id) AND (auth_user_profile.clerk_id = (auth.jwt() ->> 'sub'::text))))) OR ((clerk_organization_id = (auth.jwt() ->> 'org_id'::text)) AND (EXISTS ( SELECT 1
   FROM auth_user_profile
  WHERE ((auth_user_profile.clerk_id = (auth.jwt() ->> 'sub'::text)) AND (auth_user_profile.role = 'balance_sheet_investor'::user_role_internal)))))));


create policy "User can view their own distributions"
on "public"."bs_investor_distributions"
as permissive
for select
to authenticated
using ((EXISTS ( SELECT 1
   FROM (contact
     JOIN auth_user_profile ON ((contact.user_id = auth_user_profile.id)))
  WHERE ((contact.id = bs_investor_distributions.investor_id) AND (auth_user_profile.clerk_id = (auth.jwt() ->> 'sub'::text))))));


create policy "Investors can view their own statements"
on "public"."bs_investor_statements"
as permissive
for select
to authenticated
using ((((clerk_id IS NOT NULL) AND ((( SELECT auth.uid() AS uid))::text = clerk_id)) OR ((clerk_organization_id IS NOT NULL) AND ((( SELECT auth.uid() AS uid))::text IN ( SELECT user_clerk_orgs_members.clerk_id
   FROM user_clerk_orgs_members
  WHERE (user_clerk_orgs_members.clerk_organization_fkey = (user_clerk_orgs_members.clerk_organization_id)::bigint)))) OR ((( SELECT auth.uid() AS uid))::text IN ( SELECT (auth_user_profile.id)::text AS id
   FROM auth_user_profile
  WHERE (auth_user_profile.role = 'admin'::user_role_internal)))));


create policy "Only admins can delete statements"
on "public"."bs_investor_statements"
as permissive
for delete
to authenticated
using (((( SELECT auth.uid() AS uid))::text IN ( SELECT (auth_user_profile.id)::text AS id
   FROM auth_user_profile
  WHERE (auth_user_profile.role = 'admin'::user_role_internal))));


create policy "Only admins can insert statements"
on "public"."bs_investor_statements"
as permissive
for insert
to authenticated
with check (((( SELECT auth.uid() AS uid))::text IN ( SELECT (auth_user_profile.id)::text AS id
   FROM auth_user_profile
  WHERE (auth_user_profile.role = 'admin'::user_role_internal))));


create policy "Only admins can update statements"
on "public"."bs_investor_statements"
as permissive
for update
to authenticated
using (((( SELECT auth.uid() AS uid))::text IN ( SELECT (auth_user_profile.id)::text AS id
   FROM auth_user_profile
  WHERE (auth_user_profile.role = 'admin'::user_role_internal))))
with check (((( SELECT auth.uid() AS uid))::text IN ( SELECT (auth_user_profile.id)::text AS id
   FROM auth_user_profile
  WHERE (auth_user_profile.role = 'admin'::user_role_internal))));


create policy "Allow API Insert"
on "public"."company"
as permissive
for insert
to anon
with check (true);


create policy "Return data for API insert"
on "public"."company"
as permissive
for select
to public
using (true);


create policy "Users can select their own contact"
on "public"."contact"
as permissive
for select
to authenticated
using ((email_address = (auth.jwt() ->> 'email'::text)));


create policy "Enable read access for all users"
on "public"."deal"
as permissive
for select
to public
using (true);


create policy "Users can select their own documents"
on "public"."document_files"
as permissive
for select
to authenticated
using ((uploaded_by = (auth.uid())::text));


create policy "Allow auth select"
on "public"."guarantor"
as permissive
for select
to authenticated, anon
using (true);


create policy "Allow API Insert"
on "public"."loan_application"
as permissive
for insert
to anon
with check (true);


create policy "Allow auth select"
on "public"."property"
as permissive
for select
to authenticated, anon
using (true);


create policy "Allow authenticated users to select all property_reapi records"
on "public"."property_reapi"
as permissive
for select
to authenticated
using (true);


create policy "Allow users to insert property records"
on "public"."property_reapi"
as permissive
for insert
to authenticated
with check (true);


CREATE TRIGGER handle_updated_at BEFORE UPDATE ON public.auth_user_profile FOR EACH ROW EXECUTE FUNCTION moddatetime('updated_at');

CREATE TRIGGER handle_borrower_profile_changes_trigger AFTER UPDATE OF citizenship, first_time_home_buyer, mortgage_debt, fico_score_mid_actual ON public.borrower FOR EACH ROW EXECUTE FUNCTION handle_user_profile_changes();

CREATE TRIGGER handle_updated_at BEFORE UPDATE ON public.borrower FOR EACH ROW EXECUTE FUNCTION moddatetime('updated_at');

CREATE TRIGGER handle_updated_at BEFORE UPDATE ON public.company FOR EACH ROW EXECUTE FUNCTION moddatetime('updated_at');

CREATE TRIGGER handle_updated_at BEFORE UPDATE ON public.company_member FOR EACH ROW EXECUTE FUNCTION moddatetime('member_updated_at');
ALTER TABLE "public"."company_member" DISABLE TRIGGER "handle_updated_at";

CREATE TRIGGER handle_updated_at BEFORE UPDATE ON public.contact FOR EACH ROW EXECUTE FUNCTION moddatetime('updated_at');

CREATE TRIGGER handle_updated_at BEFORE UPDATE ON public.deal FOR EACH ROW EXECUTE FUNCTION moddatetime('updated_at');

CREATE TRIGGER handle_updated_at BEFORE UPDATE ON public.property FOR EACH ROW EXECUTE FUNCTION moddatetime('updated_at');


