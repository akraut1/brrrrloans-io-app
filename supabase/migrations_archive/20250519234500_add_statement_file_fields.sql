-- Add file storage fields to bs_investor_statements table
ALTER TABLE "public"."bs_investor_statements" ADD COLUMN "file_path" TEXT;
ALTER TABLE "public"."bs_investor_statements" ADD COLUMN "file_name" TEXT;
ALTER TABLE "public"."bs_investor_statements" ADD COLUMN "file_type" TEXT;
ALTER TABLE "public"."bs_investor_statements" ADD COLUMN "file_size" BIGINT;
ALTER TABLE "public"."bs_investor_statements" ADD COLUMN "file_url" TEXT;
ALTER TABLE "public"."bs_investor_statements" ADD COLUMN "uploaded_at" TIMESTAMP WITH TIME ZONE DEFAULT NOW();
ALTER TABLE "public"."bs_investor_statements" ADD COLUMN "user_clerk_orgs_id" BIGINT REFERENCES auth_clerk_orgs(id);

-- All RLS policies have been removed from this migration to allow schema validation. Add RLS policies in a separate migration after schema is confirmed. 