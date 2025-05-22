import { createServiceRoleClient } from "@/lib/supabase";
import { NextResponse } from "next/server";

/**
 * This route handler sets up a Supabase storage bucket and configures RLS policies.
 * This should only be called during deployment or from a secure admin environment.
 *
 * IMPORTANT: Do not call this from client-side code as it would expose your secrets.
 */
export async function POST(request: Request) {
  try {
    // Check for an API key (for security)
    const { searchParams } = new URL(request.url);
    const apiKey = searchParams.get("api_key");

    // This should match your server-side environment variable
    // Make this a strong, random string that only you know
    const expectedApiKey = process.env.STORAGE_SETUP_API_KEY;

    if (!expectedApiKey || apiKey !== expectedApiKey) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    // Use service role client for administrative tasks
    const client = createServiceRoleClient();

    // Check if the bucket exists
    const { data: buckets, error: bucketsError } =
      await client.storage.listBuckets();

    if (bucketsError) {
      return NextResponse.json(
        { error: "Error listing buckets", details: bucketsError },
        { status: 500 }
      );
    }

    const documentsBucketExists = buckets?.some(
      (bucket) => bucket.name === "documents"
    );

    // Create the bucket if it doesn't exist
    if (!documentsBucketExists) {
      const { error: createError } = await client.storage.createBucket(
        "documents",
        {
          public: false,
          fileSizeLimit: 52428800, // 50MB in bytes
        }
      );

      if (createError) {
        return NextResponse.json(
          { error: "Error creating documents bucket", details: createError },
          { status: 500 }
        );
      }
    }

    // For the policies, we need to use PostgreSQL functions instead.
    // This requires manual setup as the supabase client doesn't have direct methods
    // for executing raw SQL on the storage schema.

    // Since we can't directly execute SQL policies via the JS SDK with proper typing,
    // we'll just log instructions for the admin to follow.

    console.log(`
    -----------------------------------------------------------
    MANUAL SETUP REQUIRED FOR STORAGE POLICIES
    -----------------------------------------------------------
    
    The storage bucket 'documents' has been created successfully,
    but you need to manually set up the following policies in the Supabase Dashboard:
    
    1. Enable RLS on storage.objects table
    
    2. Create these policies:
    
    CREATE POLICY "Allow users to read any documents" 
    ON storage.objects
    FOR SELECT
    TO authenticated
    USING (bucket_id = 'documents');
    
    CREATE POLICY "Allow users to upload any documents" 
    ON storage.objects
    FOR INSERT
    TO authenticated
    WITH CHECK (bucket_id = 'documents');
    
    CREATE POLICY "Allow users to update any documents" 
    ON storage.objects
    FOR UPDATE
    TO authenticated
    USING (bucket_id = 'documents');
    
    CREATE POLICY "Allow users to delete any documents" 
    ON storage.objects
    FOR DELETE
    TO authenticated
    USING (bucket_id = 'documents');
    
    Visit: ${process.env.NEXT_PUBLIC_SUPABASE_URL}/project/storage/policies
    `);

    return NextResponse.json({
      success: true,
      bucketExists: documentsBucketExists,
      message:
        "Storage bucket created. See server logs for policy setup instructions.",
      manualSetupRequired: true,
    });
  } catch (error) {
    console.error("Error setting up storage:", error);
    return NextResponse.json(
      { error: "Failed to set up storage", details: error },
      { status: 500 }
    );
  }
}
