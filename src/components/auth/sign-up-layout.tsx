"use client";

import * as motion from "motion/react-client";
import Image from "next/image";
import { ReactNode } from "react";
import { AuthCarousel } from "@/components/auth/auth-carousel";
import { ThemeDropdown } from "@/components/theme/theme-dropdown";

interface SignUpLayoutProps {
  children: ReactNode;
}

export function SignUpLayout({ children }: SignUpLayoutProps) {
  return (
    <div className="relative grid min-h-screen grid-cols-1 overflow-hidden md:grid-cols-2 lg:grid-cols-12">
      <div className="relative col-span-1 flex flex-col justify-center px-5 pt-8 md:col-span-1 md:px-6 lg:col-span-5 lg:px-8">
        <div className="absolute left-5 top-8 md:left-6 lg:left-8">
          <Image
            src="/logos/bl-logo.png"
            alt="Logo"
            width={40}
            height={40}
            className="h-10 w-auto"
          />
        </div>
        <div className="absolute right-5 top-8 md:right-6 lg:right-8">
          <ThemeDropdown />
        </div>
        <div className="mx-auto mt-16 w-full max-w-sm sm:mt-20 md:mt-24 lg:mr-0 lg:mt-20">
          {children}
        </div>
      </div>
      <div className="hidden bg-muted md:block md:col-span-1 lg:col-span-7">
        <AuthCarousel />
      </div>
    </div>
  );
}
