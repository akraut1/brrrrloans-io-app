create table if not exists "public"."bsi_deals" (
    "deal_id" bigint not null,
    "contact_id" bigint not null,
    "contact_types_id" bigint not null
);
 
alter table "public"."bsi_deals" enable row level security;

alter table "public"."bsi_deals" add constraint "bsi_deals_pkey" primary key ("deal_id", "contact_id", "contact_types_id");
alter table "public"."bsi_deals" add constraint "bsi_deals_deal_id_fkey" foreign key ("deal_id") references "public"."deal" ("id");
alter table "public"."bsi_deals" add constraint "bsi_deals_contact_id_fkey" foreign key ("contact_id") references "public"."contact" ("id");
alter table "public"."bsi_deals" add constraint "bsi_deals_contact_types_id_fkey" foreign key ("contact_types_id") references "public"."contact_types" ("id"); 