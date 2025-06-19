create extension if not exists "pg_cron" with schema "extensions";


drop policy "Balance Sheet Investor or Org Member can view investor deals" on "public"."bs_investor_deals";

drop policy "Balance Sheet Investor or Org Member can view distributions" on "public"."bs_investor_distributions";

drop policy "Investor or Org Member can view distributions" on "public"."bs_investor_distributions";

drop policy "User can view their own distributions" on "public"."bs_investor_distributions";

drop policy "Investors can view their own statements" on "public"."bs_investor_statements";

drop policy "Only admins can delete statements" on "public"."bs_investor_statements";

drop policy "Only admins can insert statements" on "public"."bs_investor_statements";

drop policy "Only admins can update statements" on "public"."bs_investor_statements";

revoke delete on table "public"."bs_investor_deals" from "anon";

revoke insert on table "public"."bs_investor_deals" from "anon";

revoke references on table "public"."bs_investor_deals" from "anon";

revoke select on table "public"."bs_investor_deals" from "anon";

revoke trigger on table "public"."bs_investor_deals" from "anon";

revoke truncate on table "public"."bs_investor_deals" from "anon";

revoke update on table "public"."bs_investor_deals" from "anon";

revoke delete on table "public"."bs_investor_deals" from "authenticated";

revoke insert on table "public"."bs_investor_deals" from "authenticated";

revoke references on table "public"."bs_investor_deals" from "authenticated";

revoke select on table "public"."bs_investor_deals" from "authenticated";

revoke trigger on table "public"."bs_investor_deals" from "authenticated";

revoke truncate on table "public"."bs_investor_deals" from "authenticated";

revoke update on table "public"."bs_investor_deals" from "authenticated";

revoke delete on table "public"."bs_investor_deals" from "service_role";

revoke insert on table "public"."bs_investor_deals" from "service_role";

revoke references on table "public"."bs_investor_deals" from "service_role";

revoke select on table "public"."bs_investor_deals" from "service_role";

revoke trigger on table "public"."bs_investor_deals" from "service_role";

revoke truncate on table "public"."bs_investor_deals" from "service_role";

revoke update on table "public"."bs_investor_deals" from "service_role";

revoke delete on table "public"."bs_investor_distributions" from "anon";

revoke insert on table "public"."bs_investor_distributions" from "anon";

revoke references on table "public"."bs_investor_distributions" from "anon";

revoke select on table "public"."bs_investor_distributions" from "anon";

revoke trigger on table "public"."bs_investor_distributions" from "anon";

revoke truncate on table "public"."bs_investor_distributions" from "anon";

revoke update on table "public"."bs_investor_distributions" from "anon";

revoke delete on table "public"."bs_investor_distributions" from "authenticated";

revoke insert on table "public"."bs_investor_distributions" from "authenticated";

revoke references on table "public"."bs_investor_distributions" from "authenticated";

revoke select on table "public"."bs_investor_distributions" from "authenticated";

revoke trigger on table "public"."bs_investor_distributions" from "authenticated";

revoke truncate on table "public"."bs_investor_distributions" from "authenticated";

revoke update on table "public"."bs_investor_distributions" from "authenticated";

revoke delete on table "public"."bs_investor_distributions" from "service_role";

revoke insert on table "public"."bs_investor_distributions" from "service_role";

revoke references on table "public"."bs_investor_distributions" from "service_role";

revoke select on table "public"."bs_investor_distributions" from "service_role";

revoke trigger on table "public"."bs_investor_distributions" from "service_role";

revoke truncate on table "public"."bs_investor_distributions" from "service_role";

revoke update on table "public"."bs_investor_distributions" from "service_role";

revoke delete on table "public"."bs_investor_statements" from "anon";

revoke insert on table "public"."bs_investor_statements" from "anon";

revoke references on table "public"."bs_investor_statements" from "anon";

revoke select on table "public"."bs_investor_statements" from "anon";

revoke trigger on table "public"."bs_investor_statements" from "anon";

revoke truncate on table "public"."bs_investor_statements" from "anon";

revoke update on table "public"."bs_investor_statements" from "anon";

revoke delete on table "public"."bs_investor_statements" from "authenticated";

revoke insert on table "public"."bs_investor_statements" from "authenticated";

revoke references on table "public"."bs_investor_statements" from "authenticated";

revoke select on table "public"."bs_investor_statements" from "authenticated";

revoke trigger on table "public"."bs_investor_statements" from "authenticated";

revoke truncate on table "public"."bs_investor_statements" from "authenticated";

revoke update on table "public"."bs_investor_statements" from "authenticated";

revoke delete on table "public"."bs_investor_statements" from "service_role";

revoke insert on table "public"."bs_investor_statements" from "service_role";

revoke references on table "public"."bs_investor_statements" from "service_role";

revoke select on table "public"."bs_investor_statements" from "service_role";

revoke trigger on table "public"."bs_investor_statements" from "service_role";

revoke truncate on table "public"."bs_investor_statements" from "service_role";

revoke update on table "public"."bs_investor_statements" from "service_role";

revoke delete on table "public"."bs_investor_transactions" from "anon";

revoke insert on table "public"."bs_investor_transactions" from "anon";

revoke references on table "public"."bs_investor_transactions" from "anon";

revoke select on table "public"."bs_investor_transactions" from "anon";

revoke trigger on table "public"."bs_investor_transactions" from "anon";

revoke truncate on table "public"."bs_investor_transactions" from "anon";

revoke update on table "public"."bs_investor_transactions" from "anon";

revoke delete on table "public"."bs_investor_transactions" from "authenticated";

revoke insert on table "public"."bs_investor_transactions" from "authenticated";

revoke references on table "public"."bs_investor_transactions" from "authenticated";

revoke select on table "public"."bs_investor_transactions" from "authenticated";

revoke trigger on table "public"."bs_investor_transactions" from "authenticated";

revoke truncate on table "public"."bs_investor_transactions" from "authenticated";

revoke update on table "public"."bs_investor_transactions" from "authenticated";

revoke delete on table "public"."bs_investor_transactions" from "service_role";

revoke insert on table "public"."bs_investor_transactions" from "service_role";

revoke references on table "public"."bs_investor_transactions" from "service_role";

revoke select on table "public"."bs_investor_transactions" from "service_role";

revoke trigger on table "public"."bs_investor_transactions" from "service_role";

revoke truncate on table "public"."bs_investor_transactions" from "service_role";

revoke update on table "public"."bs_investor_transactions" from "service_role";

revoke delete on table "public"."bs_investor_transactions_references" from "anon";

revoke insert on table "public"."bs_investor_transactions_references" from "anon";

revoke references on table "public"."bs_investor_transactions_references" from "anon";

revoke select on table "public"."bs_investor_transactions_references" from "anon";

revoke trigger on table "public"."bs_investor_transactions_references" from "anon";

revoke truncate on table "public"."bs_investor_transactions_references" from "anon";

revoke update on table "public"."bs_investor_transactions_references" from "anon";

revoke delete on table "public"."bs_investor_transactions_references" from "authenticated";

revoke insert on table "public"."bs_investor_transactions_references" from "authenticated";

revoke references on table "public"."bs_investor_transactions_references" from "authenticated";

revoke select on table "public"."bs_investor_transactions_references" from "authenticated";

revoke trigger on table "public"."bs_investor_transactions_references" from "authenticated";

revoke truncate on table "public"."bs_investor_transactions_references" from "authenticated";

revoke update on table "public"."bs_investor_transactions_references" from "authenticated";

revoke delete on table "public"."bs_investor_transactions_references" from "service_role";

revoke insert on table "public"."bs_investor_transactions_references" from "service_role";

revoke references on table "public"."bs_investor_transactions_references" from "service_role";

revoke select on table "public"."bs_investor_transactions_references" from "service_role";

revoke trigger on table "public"."bs_investor_transactions_references" from "service_role";

revoke truncate on table "public"."bs_investor_transactions_references" from "service_role";

revoke update on table "public"."bs_investor_transactions_references" from "service_role";

revoke delete on table "public"."user_clerk_orgs" from "anon";

revoke insert on table "public"."user_clerk_orgs" from "anon";

revoke references on table "public"."user_clerk_orgs" from "anon";

revoke select on table "public"."user_clerk_orgs" from "anon";

revoke trigger on table "public"."user_clerk_orgs" from "anon";

revoke truncate on table "public"."user_clerk_orgs" from "anon";

revoke update on table "public"."user_clerk_orgs" from "anon";

revoke delete on table "public"."user_clerk_orgs" from "authenticated";

revoke insert on table "public"."user_clerk_orgs" from "authenticated";

revoke references on table "public"."user_clerk_orgs" from "authenticated";

revoke select on table "public"."user_clerk_orgs" from "authenticated";

revoke trigger on table "public"."user_clerk_orgs" from "authenticated";

revoke truncate on table "public"."user_clerk_orgs" from "authenticated";

revoke update on table "public"."user_clerk_orgs" from "authenticated";

revoke delete on table "public"."user_clerk_orgs" from "service_role";

revoke insert on table "public"."user_clerk_orgs" from "service_role";

revoke references on table "public"."user_clerk_orgs" from "service_role";

revoke select on table "public"."user_clerk_orgs" from "service_role";

revoke trigger on table "public"."user_clerk_orgs" from "service_role";

revoke truncate on table "public"."user_clerk_orgs" from "service_role";

revoke update on table "public"."user_clerk_orgs" from "service_role";

revoke delete on table "public"."user_clerk_orgs_members" from "anon";

revoke insert on table "public"."user_clerk_orgs_members" from "anon";

revoke references on table "public"."user_clerk_orgs_members" from "anon";

revoke select on table "public"."user_clerk_orgs_members" from "anon";

revoke trigger on table "public"."user_clerk_orgs_members" from "anon";

revoke truncate on table "public"."user_clerk_orgs_members" from "anon";

revoke update on table "public"."user_clerk_orgs_members" from "anon";

revoke delete on table "public"."user_clerk_orgs_members" from "authenticated";

revoke insert on table "public"."user_clerk_orgs_members" from "authenticated";

revoke references on table "public"."user_clerk_orgs_members" from "authenticated";

revoke select on table "public"."user_clerk_orgs_members" from "authenticated";

revoke trigger on table "public"."user_clerk_orgs_members" from "authenticated";

revoke truncate on table "public"."user_clerk_orgs_members" from "authenticated";

revoke update on table "public"."user_clerk_orgs_members" from "authenticated";

revoke delete on table "public"."user_clerk_orgs_members" from "service_role";

revoke insert on table "public"."user_clerk_orgs_members" from "service_role";

revoke references on table "public"."user_clerk_orgs_members" from "service_role";

revoke select on table "public"."user_clerk_orgs_members" from "service_role";

revoke trigger on table "public"."user_clerk_orgs_members" from "service_role";

revoke truncate on table "public"."user_clerk_orgs_members" from "service_role";

revoke update on table "public"."user_clerk_orgs_members" from "service_role";

alter table "public"."bs_investor_deals" drop constraint "bs_investor_deals_contact_id_fkey";

alter table "public"."bs_investor_deals" drop constraint "bs_investor_deals_contact_types_id_fkey";

alter table "public"."bs_investor_deals" drop constraint "bs_investor_deals_deal_id_fkey";

alter table "public"."bs_investor_distributions" drop constraint "bs_investor_distribution_details_deal_id_fkey";

alter table "public"."bs_investor_distributions" drop constraint "bs_investor_distributions_instrument_id_fkey";

alter table "public"."bs_investor_distributions" drop constraint "bs_investor_distributions_investor_id_fkey";

alter table "public"."bs_investor_distributions" drop constraint "bs_investor_distributions_statement_id_fkey";

alter table "public"."bs_investor_statements" drop constraint "bs_investor_statements_investor_id_fkey";

alter table "public"."bs_investor_statements" drop constraint "bs_investor_statements_user_clerk_orgs_id_fkey";

alter table "public"."bs_investor_transactions" drop constraint "bs_investor_distribution_payments_deal_id_fkey";

alter table "public"."bs_investor_transactions" drop constraint "bs_investor_transactions_instrument_id_fkey";

alter table "public"."bs_investor_transactions" drop constraint "bs_investor_transactions_investor_id_fkey";

alter table "public"."bs_investor_transactions_references" drop constraint "transaction_references_transaction_id_fkey";

alter table "public"."user_clerk_orgs" drop constraint "user_clerk_orgs_clerk_organization_id_key";

alter table "public"."user_clerk_orgs" drop constraint "user_clerk_orgs_created_by_clerk_id_fkey";

alter table "public"."user_clerk_orgs" drop constraint "user_clerk_orgs_slug_key";

alter table "public"."user_clerk_orgs_members" drop constraint "user_clerk_orgs_members_clerk_organization_fkey_fkey";

alter table "public"."user_clerk_orgs_members" drop constraint "user_org_memberships_user_id_fkey";

alter table "public"."auth_clerk_orgs" drop constraint "auth_clerk_orgs_pkey";

alter table "public"."auth_clerk_orgs_members" drop constraint "auth_clerk_orgs_members_pkey";

alter table "public"."bs_investor_deals" drop constraint "bs_investor_deals_pkey";

alter table "public"."bs_investor_distributions" drop constraint "bs_investor_distributions_pkey";

alter table "public"."bs_investor_statements" drop constraint "bs_investor_statements_pkey";

alter table "public"."bs_investor_transactions" drop constraint "bs_investor_distribution_payments_pkey";

alter table "public"."bs_investor_transactions_references" drop constraint "transaction_references_pkey";

alter table "public"."user_clerk_orgs" drop constraint "user_clerk_orgs_pkey";

alter table "public"."user_clerk_orgs_members" drop constraint "user_org_memberships_pkey";

drop index if exists "public"."auth_clerk_orgs_clerk_organization_id_key";

drop index if exists "public"."auth_clerk_orgs_members_pkey";

drop index if exists "public"."auth_clerk_orgs_pkey";

drop index if exists "public"."auth_clerk_orgs_slug_key";

drop index if exists "public"."bs_investor_deals_pkey";

drop index if exists "public"."bs_investor_distribution_payments_pkey";

drop index if exists "public"."bs_investor_distributions_pkey";

drop index if exists "public"."bs_investor_statements_pkey";

drop index if exists "public"."transaction_references_pkey";

drop index if exists "public"."user_clerk_orgs_clerk_organization_id_key";

drop index if exists "public"."user_clerk_orgs_pkey";

drop index if exists "public"."user_clerk_orgs_slug_key";

drop index if exists "public"."user_org_memberships_pkey";

drop table "public"."bs_investor_deals";

drop table "public"."bs_investor_distributions";

drop table "public"."bs_investor_statements";

drop table "public"."bs_investor_transactions";

drop table "public"."bs_investor_transactions_references";

drop table "public"."user_clerk_orgs";

drop table "public"."user_clerk_orgs_members";

alter table "public"."company" alter column "co_ppb_address_country" drop default;

alter type "public"."country_enum" rename to "country_enum__old_version_to_be_dropped";

create type "public"."country_enum" as enum ('Bonaire, Sint Eustatius and Saba', 'Curaçao', 'Guernsey', 'Isle of Man', 'Jersey', 'Åland Islands', 'Montenegro', 'Saint Barthélemy', 'Saint Martin (French part)', 'Serbia', 'Sint Maarten (Dutch part)', 'South Sudan', 'Timor-Leste', 'American Samoa', 'Andorra', 'Angola', 'Anguilla', 'Antarctica', 'Antigua and Barbuda', 'Argentina', 'Armenia', 'Aruba', 'Australia', 'Austria', 'Azerbaijan', 'Bahamas', 'Bahrain', 'Bangladesh', 'Barbados', 'Belarus', 'Belgium', 'Belize', 'Benin', 'Bermuda', 'Bhutan', 'Bolivia', 'Bosnia and Herzegovina', 'Botswana', 'Bouvet Island', 'Brazil', 'British Indian Ocean Territory', 'Brunei Darussalam', 'Bulgaria', 'Burkina Faso', 'Burundi', 'Cambodia', 'Cameroon', 'Canada', 'Cape Verde', 'Cayman Islands', 'Central African Republic', 'Chad', 'Chile', 'China', 'Christmas Island', 'Cocos (Keeling) Islands', 'Colombia', 'Comoros', 'Congo', 'Congo, the Democratic Republic of the', 'Cook Islands', 'Costa Rica', 'Cote DIvoire', 'Croatia', 'Cuba', 'Cyprus', 'Czech Republic', 'Denmark', 'Djibouti', 'Dominica', 'Dominican Republic', 'Ecuador', 'Egypt', 'El Salvador', 'Equatorial Guinea', 'Eritrea', 'Estonia', 'Ethiopia', 'Falkland Islands (Malvinas)', 'Faroe Islands', 'Fiji', 'Finland', 'France', 'French Guiana', 'French Polynesia', 'French Southern Territories', 'Gabon', 'Gambia', 'Georgia', 'Germany', 'Ghana', 'Gibraltar', 'Greece', 'Greenland', 'Grenada', 'Guadeloupe', 'Guam', 'Guatemala', 'Guinea', 'Guinea-Bissau', 'Guyana', 'Haiti', 'Heard Island and Mcdonald Islands', 'Holy See (Vatican City State)', 'Honduras', 'Hong Kong', 'Hungary', 'Iceland', 'India', 'Indonesia', 'Iran, Islamic Republic of', 'Iraq', 'Ireland', 'Israel', 'Italy', 'Jamaica', 'Japan', 'Jordan', 'Kazakhstan', 'Kenya', 'Kiribati', 'Korea, Democratic People's Republic of', 'Korea, Republic of', 'Kuwait', 'Kyrgyzstan', 'Lao People's Democratic Republic', 'Latvia', 'Lebanon', 'Lesotho', 'Liberia', 'Libya', 'Liechtenstein', 'Lithuania', 'Luxembourg', 'Macao', 'Macedonia, the Former Yugoslav Republic of', 'Madagascar', 'Malawi', 'Malaysia', 'Maldives', 'Mali', 'Malta', 'Marshall Islands', 'Martinique', 'Mauritania', 'Mauritius', 'Mayotte', 'Mexico', 'Micronesia, Federated States of', 'Moldova, Republic of', 'Monaco', 'Mongolia', 'Albania', 'Montserrat', 'Morocco', 'Mozambique', 'Myanmar', 'Namibia', 'Nauru', 'Nepal', 'Netherlands', 'New Caledonia', 'New Zealand', 'Nicaragua', 'Niger', 'Nigeria', 'Niue', 'Norfolk Island', 'Northern Mariana Islands', 'Norway', 'Oman', 'Pakistan', 'Palau', 'Palestine, State of', 'Panama', 'Papua New Guinea', 'Paraguay', 'Peru', 'Philippines', 'Pitcairn', 'Poland', 'Portugal', 'Puerto Rico', 'Qatar', 'Reunion', 'Romania', 'Russian Federation', 'Rwanda', 'Saint Helena, Ascension and Tristan da Cunha', 'Saint Kitts and Nevis', 'Saint Lucia', 'Saint Pierre and Miquelon', 'Saint Vincent and the Grenadines', 'Samoa', 'San Marino', 'Sao Tome and Principe', 'Saudi Arabia', 'Senegal', 'Seychelles', 'Sierra Leone', 'Singapore', 'Slovakia', 'Slovenia', 'Solomon Islands', 'Somalia', 'South Africa', 'South Georgia and the South Sandwich Islands', 'Spain', 'Sri Lanka', 'Sudan', 'Suriname', 'Svalbard and Jan Mayen', 'Swaziland', 'Sweden', 'Switzerland', 'Syrian Arab Republic', 'Taiwan (Province of China)', 'Tajikistan', 'Tanzania, United Republic of', 'Thailand', 'Togo', 'Tokelau', 'Tonga', 'Trinidad and Tobago', 'Tunisia', 'Turkey', 'Turkmenistan', 'Turks and Caicos Islands', 'Tuvalu', 'Uganda', 'Ukraine', 'United Arab Emirates', 'United Kingdom', 'United States', 'United States Minor Outlying Islands', 'Uruguay', 'Uzbekistan', 'Vanuatu', 'Venezuela', 'Viet Nam', 'Virgin Islands (British)', 'Virgin Islands (U.S.)', 'Wallis and Futuna', 'Western Sahara', 'Yemen', 'Zambia', 'Zimbabwe', 'Afghanistan', 'Algeria');

alter table "public"."company" alter column co_ppb_address_country type "public"."country_enum" using co_ppb_address_country::text::"public"."country_enum";

alter table "public"."company" alter column "co_ppb_address_country" set default 'United States'::country_enum;

drop type "public"."country_enum__old_version_to_be_dropped";

CREATE UNIQUE INDEX user_clerk_orgs_clerk_organization_id_key ON public.auth_clerk_orgs USING btree (clerk_organization_id);

CREATE UNIQUE INDEX user_clerk_orgs_pkey ON public.auth_clerk_orgs USING btree (id);

CREATE UNIQUE INDEX user_clerk_orgs_slug_key ON public.auth_clerk_orgs USING btree (clerk_organization_slug);

CREATE UNIQUE INDEX user_org_memberships_pkey ON public.auth_clerk_orgs_members USING btree (id);

alter table "public"."auth_clerk_orgs" add constraint "user_clerk_orgs_pkey" PRIMARY KEY using index "user_clerk_orgs_pkey";

alter table "public"."auth_clerk_orgs_members" add constraint "user_org_memberships_pkey" PRIMARY KEY using index "user_org_memberships_pkey";

alter table "public"."auth_clerk_orgs" add constraint "user_clerk_orgs_clerk_organization_id_key" UNIQUE using index "user_clerk_orgs_clerk_organization_id_key";

alter table "public"."auth_clerk_orgs" add constraint "user_clerk_orgs_created_by_clerk_id_fkey" FOREIGN KEY (created_by_clerk_id) REFERENCES auth_user_profile(clerk_id) not valid;

alter table "public"."auth_clerk_orgs" validate constraint "user_clerk_orgs_created_by_clerk_id_fkey";

alter table "public"."auth_clerk_orgs" add constraint "user_clerk_orgs_slug_key" UNIQUE using index "user_clerk_orgs_slug_key";

alter table "public"."auth_clerk_orgs_members" add constraint "user_clerk_orgs_members_clerk_organization_fkey_fkey" FOREIGN KEY (clerk_organization_fkey) REFERENCES auth_clerk_orgs(id) not valid;

alter table "public"."auth_clerk_orgs_members" validate constraint "user_clerk_orgs_members_clerk_organization_fkey_fkey";

alter table "public"."auth_clerk_orgs_members" add constraint "user_org_memberships_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth_user_profile(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."auth_clerk_orgs_members" validate constraint "user_org_memberships_user_id_fkey";


