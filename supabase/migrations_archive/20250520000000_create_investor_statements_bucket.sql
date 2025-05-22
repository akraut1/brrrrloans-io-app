-- Create a new storage bucket for investor statements
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
  'investor-statements',
  'investor-statements',
  FALSE, -- Not public: files require authentication
  10485760, -- 10MB file size limit
  ARRAY['application/pdf']::text[] -- Allow only PDF files
);

-- All RLS policies have been removed from this migration to allow schema validation. Add RLS policies in a separate migration after schema is confirmed. 