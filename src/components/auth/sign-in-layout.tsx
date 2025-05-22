"use client";

import Image from "next/image";
import { AuthCarousel } from "@/components/auth/auth-carousel";
import { ThemeDropdown } from "@/components/theme/theme-dropdown";
import type { ReactNode } from "react";

interface SignInLayoutProps {
  children: ReactNode;
}

export function SignInLayout({ children }: SignInLayoutProps) {
  return (
    <div className="grid min-h-svh lg:grid-cols-2">
      <div className="flex flex-col gap-4 p-6 md:p-10">
        <div className="flex justify-between items-center">
          <a href="#" className="flex items-center gap-2 font-medium">
            <div className="flex h-6 w-6 items-center justify-center rounded-md">
              <Image
                src="/logos/brrrr-icon-sq-black-192.png"
                alt="Brrrr Loans 1 Icon Black"
                width={30}
                height={30}
                className="block dark:hidden"
              />
              <Image
                src="/logos/brrrr-icon-sq-white-192.png"
                alt="Brrrr Loans 1 Icon White"
                width={30}
                height={30}
                className="hidden dark:block"
              />
            </div>
            Brrrr Loans 1
          </a>
          <ThemeDropdown />
        </div>
        <div className="flex flex-1 items-center justify-center">
          <div className="w-full max-w-xs">{children}</div>
        </div>
      </div>
      <div className="flex flex-1 items-center justify-center bg-muted">
        <AuthCarousel />
      </div>
    </div>
  );
}
