/// <reference types="node" />

declare namespace NodeJS {
  interface ProcessEnv {
    NEXT_PUBLIC_CLERK_FRONTEND_API: string;
    NEXT_PUBLIC_SUPABASE_URL: string;
    NEXT_PUBLIC_SUPABASE_ANON_KEY: string;
    // Optional:
    CLERK_SECRET_KEY?: string;
    SUPABASE_SERVICE_ROLE_KEY?: string;
  }
}
