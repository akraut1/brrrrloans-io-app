# Authentication & Security Review

## Executive Summary

Your Clerk + Supabase + Next.js App Router integration is **mostly well-implemented** but has several **critical security gaps** and inconsistencies that need immediate attention. This review covers middleware, route protection, RLS policies, role-based access control, and Clerk integration patterns.

## 🔴 Critical Issues

### 1. **Missing Route Protection in Dashboard Layout**
```typescript
// ❌ CURRENT: src/app/(dashboard)/dashboard/layout.tsx
export default function DashboardLayout({ children }: { children: ReactNode }) {
  return (
    <SidebarProvider>
      <AppSidebar />
      <SidebarInset>
        <main className="flex flex-1 flex-col border-radius: 12px bg-background">
          {children}
        </main>
      </SidebarInset>
    </SidebarProvider>
  );
}
```

**Problem**: The dashboard layout has **NO authentication checking**. This means unauthenticated users could potentially access dashboard routes if middleware fails.

**Solution**: Add authentication wrapper:
```typescript
"use client";

import { useAuth } from "@clerk/nextjs";
import { useRouter } from "next/navigation";
import { useEffect } from "react";

export default function DashboardLayout({ children }: { children: ReactNode }) {
  const { isLoaded, userId } = useAuth();
  const router = useRouter();

  useEffect(() => {
    if (isLoaded && !userId) {
      router.push("/sign-in");
    }
  }, [isLoaded, userId, router]);

  if (!isLoaded) {
    return <div>Loading...</div>;
  }

  if (!userId) {
    return null;
  }

  return (
    <SidebarProvider>
      <AppSidebar />
      <SidebarInset>
        <main className="flex flex-1 flex-col border-radius: 12px bg-background">
          {children}
        </main>
      </SidebarInset>
    </SidebarProvider>
  );
}
```

### 2. **Inconsistent Table Naming in RLS Policies**
Your RLS policies reference different table names:
- `auth_user_profile` (current/correct)
- `auth_user_profiles` (duplicate/incorrect)

**Critical Fix Needed**: Ensure all policies reference the correct table name.

### 3. **Vulnerable Permission Checking Logic**
```typescript
// ❌ PROBLEM: src/hooks/use-investor-permissions.ts
const hasAccess = !error && data;  // This is insufficient!
```

**Issue**: Simply checking `!error && data` doesn't validate if the user actually has permission—just that the query succeeded.

## 🟡 Security Improvements Needed

### 4. **RLS Policy Inconsistencies**

Found multiple conflicting policies for the same tables:

```sql
-- Policy 1: Too permissive
create policy "Users can select their own profile"
on "public"."user_profile"
using ((clerk_id = (auth.jwt() ->> 'sub'::text)));

-- Policy 2: More restrictive (better)
CREATE POLICY "Users can read their own profile"
ON public.auth_user_profiles
USING (clerk_id = auth.uid()::text);
```

**Recommendation**: Standardize on `auth.uid()` instead of `auth.jwt() ->> 'sub'` for better performance.

### 5. **Missing JWT Template Configuration**

Your environment shows you're using Clerk's native Supabase integration, but your server code uses:
```typescript
const token = await getToken({ template: "supabase" });
```

**Verify**: Ensure you have the Supabase integration enabled in Clerk dashboard, not just a JWT template.

## 🟢 Well-Implemented Areas

### ✅ Middleware Configuration
Your middleware is correctly implemented:
```typescript
// ✅ GOOD: src/middleware.ts
import { clerkMiddleware } from '@clerk/nextjs/server'
export default clerkMiddleware();
```

### ✅ Clerk Provider Setup
```typescript
// ✅ GOOD: src/app/layout.tsx
<ClerkProvider>
  <html lang="en" suppressHydrationWarning>
    <body className={inter.className}>
      <ThemeProvider>
        <RootLayoutClient>{children}</RootLayoutClient>
      </ThemeProvider>
    </body>
  </html>
</ClerkProvider>
```

### ✅ Server-Side Supabase Integration
```typescript
// ✅ GOOD: src/lib/supabase-server.ts
export async function getSupabaseClient(): Promise<SupabaseClient<Database>> {
  const { getToken } = await auth();
  const token = await getToken({ template: "supabase" });
  
  const client = createClient<Database>(supabaseUrl, supabaseAnonKey, {
    global: {
      headers: {
        authorization: `Bearer ${token}`,
      },
    },
  });
  return client;
}
```

## 📋 Detailed Security Analysis

### **API Route Protection**
- ✅ **Good**: All API routes properly check `userId` from `auth()`
- ✅ **Good**: Return 401 for unauthenticated requests
- ⚠️ **Improve**: Add role-based checks where needed

### **RLS Policies Review**

#### User Profile Access:
```sql
-- ✅ GOOD: Self-access policy
CREATE POLICY "Users can read their own profile"
ON public.auth_user_profiles
FOR SELECT TO authenticated
USING (clerk_id = auth.uid()::text);

-- ✅ GOOD: Admin access policy  
CREATE POLICY "Admins can read all profiles"
ON public.auth_user_profiles
FOR SELECT TO authenticated
USING (role = 'admin' OR clerk_id = auth.uid()::text);
```

#### Investment Data Access:
```sql
-- ✅ COMPLEX BUT SECURE: Multi-org access
create policy "Balance Sheet Investor or Org Member can view investor deals"
on "public"."bs_investor_deals"
as permissive for select to authenticated
using (
  -- Direct investor access OR org member access
  (EXISTS (SELECT 1 FROM contact c JOIN user_profile up ON (c.user_id = up.id)
   WHERE c.id = bs_investor_deals.contact_id 
   AND up.clerk_id = (auth.jwt() ->> 'sub'::text)
   AND up.role = 'balance_sheet_investor'))
  OR 
  (EXISTS (-- Complex org membership check...))
);
```

### **Permission System Architecture**

#### Current Implementation:
```typescript
// ❌ PROBLEMATIC: Too simple permission check
const canViewDeal = async (dealId: string): Promise<boolean> => {
  const { data, error } = await supabase
    .from("bs_investor_deals")
    .select("deal_id")
    .eq("deal_id", Number(dealId))
    .single();

  const hasAccess = !error && data;  // ⚠️ Insufficient validation
  return hasAccess;
};
```

#### Recommended Improvement:
```typescript
const canViewDeal = async (dealId: string): Promise<boolean> => {
  try {
    const { data, error, count } = await supabase
      .from("bs_investor_deals")
      .select("deal_id", { count: 'exact' })
      .eq("deal_id", Number(dealId))
      .single();

    // Explicitly check for successful authorization
    if (error?.code === 'PGRST116') return false; // No rows (permission denied)
    if (error) throw error;
    
    return data !== null && count === 1;
  } catch (error) {
    console.error("Permission check failed:", error);
    return false; // Fail closed
  }
};
```

## 🎯 Priority Recommendations

### **Immediate (Critical)**
1. **Add authentication wrapper to dashboard layout**
2. **Fix RLS policy table name inconsistencies**
3. **Improve permission checking logic to validate actual access**
4. **Verify Clerk Supabase integration is properly configured**

### **High Priority**
1. **Standardize RLS policies to use `auth.uid()` consistently**
2. **Add role-based route protection for admin pages**
3. **Implement proper error handling for permission failures**
4. **Add logging for security events**

### **Medium Priority**
1. **Optimize RLS policy performance with proper indexing**
2. **Add comprehensive permission testing**
3. **Implement session management improvements**
4. **Add rate limiting to sensitive endpoints**

## 🔧 Implementation Examples

### Enhanced Route Protection:
```typescript
// src/app/(dashboard)/dashboard/admin/layout.tsx
import { auth } from "@clerk/nextjs/server";
import { redirect } from "next/navigation";
import { getSupabaseClient } from "@/lib/supabase-server";

export default async function AdminLayout({ children }: { children: ReactNode }) {
  const { userId } = await auth();
  
  if (!userId) {
    redirect("/sign-in");
  }

  const supabase = await getSupabaseClient();
  const { data: profile } = await supabase
    .from("auth_user_profile")
    .select("role, is_internal_yn, is_active_yn")
    .eq("clerk_id", userId)
    .single();

  if (!profile?.is_internal_yn || !profile?.is_active_yn || profile?.role !== 'admin') {
    redirect("/dashboard");
  }

  return <>{children}</>;
}
```

### Improved Permission Hook:
```typescript
// Enhanced permission validation with proper error handling
const canViewResource = async (resourceType: string, resourceId: string): Promise<boolean> => {
  try {
    const { data, error, count } = await supabase
      .from(getTableForResource(resourceType))
      .select("id", { count: 'exact' })
      .eq("id", resourceId)
      .maybeSingle(); // Use maybeSingle for optional results

    // Handle specific error codes
    if (error?.code === 'PGRST116') return false; // Permission denied
    if (error?.code === '42501') return false; // Insufficient privileges  
    if (error) throw error;

    return data !== null;
  } catch (error) {
    // Log security events
    console.error(`Permission denied for ${resourceType}:${resourceId}`, error);
    return false; // Always fail closed
  }
};
```

## 📊 Current Security Score: **7/10**

**Strengths:**
- Proper Clerk integration
- Comprehensive RLS policies  
- Server-side authentication
- Multi-role support

**Weaknesses:**
- Missing route protection
- Inconsistent table references
- Overly permissive permission checks
- Potential security gaps

## Next Steps

1. **Fix critical issues immediately**
2. **Run security audit on all RLS policies**
3. **Test authentication flows thoroughly**
4. **Implement monitoring for failed permission checks**
5. **Document security architecture**

Would you like me to help implement any of these fixes or dive deeper into specific areas?