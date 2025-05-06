"use client";

import { Separator } from "@/components/ui/separator";
import { SidebarTrigger } from "@/components/ui/sidebar";
import { SearchForm } from "@/components/layout/search-form";
import { ThemeToggle } from "@/components/theme/theme-toggle";
import { UserButton } from "@/components/auth/clerk-components";

export function SiteHeader() {
  return (
    <header className="group-has-data-[collapsible=icon]/sidebar-wrapper:h-12 flex h-14 shrink-0 items-center border-b transition-[width,height] ease-linear px-4 lg:px-6">
      {/* Left: SidebarTrigger & Separator */}
      <div className="flex items-center gap-2 flex-1 min-w-0">
        <SidebarTrigger className="-ml-2" />
        <Separator
          orientation="vertical"
          className="mx-2 data-[orientation=vertical]:h-4"
        />
      </div>
      {/* Center: SearchForm */}
      <div className="flex justify-center flex-1 min-w-0">
        <SearchForm className="max-w-md w-full" />
      </div>
      {/* Right: ThemeToggle & UserButton */}
      <div className="flex items-center justify-end gap-4 flex-1 min-w-0">
        <ThemeToggle />
        <UserButton
          afterSignOutUrl="/sign-in"
          fallback={
            <div className="h-8 w-8 rounded-full bg-muted animate-pulse" />
          }
        />
      </div>
    </header>
  );
}
