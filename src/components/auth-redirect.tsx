'use client';

import React from 'react';
import { useUser } from "@clerk/nextjs"
import { useRouter, usePathname } from "next/navigation"
import { useEffect } from "react"

export function AuthRedirect({ children }: { children: React.ReactNode }) {
  const { isLoaded, isSignedIn } = useUser();
  const router = useRouter();
  const pathname = usePathname();

  useEffect(() => {
    if (isLoaded && isSignedIn && (pathname === "/sign-in" || pathname === "/sign-up")) {
      router.push("/dashboard");
    }
  }, [isLoaded, isSignedIn, pathname, router]);

  // Always render children to avoid hydration mismatch
  return <>{children}</>;
} 