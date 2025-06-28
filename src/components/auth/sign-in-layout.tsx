"use client";

import Image from "next/image";
import { ThemeDropdown } from "@/components/theme/theme-dropdown";
import type { ReactNode } from "react";

interface SignInLayoutProps {
  children: ReactNode;
}

export function SignInLayout({ children }: SignInLayoutProps) {
  return (
    <div className="bg-background min-h-screen md:flex">
      {/* Global Theme Dropdown - positioned absolutely over entire layout */}
      <div className="absolute top-4 right-4 z-50 md:right-6">
        <ThemeDropdown />
      </div>

      {/* Left side: Sign-in form */}
      <div className="relative items-center justify-center px-6 py-24 md:flex md:w-1/2">
        {/* Logo */}
        <div className="absolute top-4 left-1/2 -translate-x-1/2 md:left-4 md:translate-x-0">
          <a
            href="/dashboard"
            aria-label="Go to dashboard"
            className="flex items-center gap-2 font-medium"
          >
            <div className="flex h-8 w-8 items-center justify-center">
              <Image
                src="/logos/brrrr-icon-sq-black-192.png"
                alt="Brrrr Loans 1 Icon Black"
                width={32}
                height={32}
                className="block dark:hidden"
              />
              <Image
                src="/logos/brrrr-icon-sq-white-192.png"
                alt="Brrrr Loans 1 Icon White"
                width={32}
                height={32}
                className="hidden dark:block"
              />
            </div>
          </a>
        </div>

        {/* Sign-in form container */}
        <div className="m-auto w-full max-w-sm">{children}</div>
      </div>

      {/* Right side: Image */}
      <Image
        src="https://ui.shadcn.com/placeholder.svg"
        alt="Image"
        width="1800"
        height="1800"
        className="hidden max-w-[50%] object-cover md:block"
      />
    </div>
  );
}
