create table if not exists "public"."bsi_transactions_references" (
    "id" bigint not null,
    "transaction_id" bigint not null,
    "reference_type" transaction_reference_type not null,
    "reference_value" text not null
);

alter table "public"."bsi_transactions_references" enable row level security;

alter table "public"."bsi_transactions_references" add constraint "bsi_transactions_references_transaction_id_fkey" foreign key ("transaction_id") references "public"."bsi_transactions" ("id"); 