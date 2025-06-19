"use client";

import { Separator } from "@/components/ui/separator";
import { SidebarTrigger } from "@/components/ui/sidebar";
import { SearchForm } from "@/components/layout/search-form";
import { ThemeDropdown } from "@/components/theme/theme-dropdown";
import { UserButton } from "@/components/auth/clerk-components";

interface SiteHeaderProps {
  title?: string;
  breadcrumb?: any;
}

export function SiteHeader({
  title = "Documents",
  breadcrumb,
}: SiteHeaderProps) {
  return (
    <header className="group-has-data-[collapsible=icon]/sidebar-wrapper:h-12 flex h-12 shrink-0 items-center gap-2 border-b transition-[width,height] ease-linear rounded-t-xl">
      <div className="flex items-center w-full h-full px-4 lg:px-6 gap-2">
        {/* Left: SidebarTrigger, Separator, and Title/Breadcrumb */}
        <div className="flex items-center gap-2">
          <button
            className="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md border border-transparent text-sm font-medium transition-colors focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:pointer-events-none disabled:opacity-50 [&_svg]:pointer-events-none [&_svg]:size-5 [&_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-8 w-8 -ml-1 bg-background"
            data-sidebar="trigger"
            style={{ borderRadius: "6px" }}
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="20"
              height="20"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              strokeWidth="2"
              strokeLinecap="round"
              strokeLinejoin="round"
              className="lucide lucide-panel-left align-middle"
            >
              <rect width="18" height="18" x="3" y="3" rx="2"></rect>
              <path d="M9 3v18"></path>
            </svg>
            <span className="sr-only">Toggle Sidebar</span>
          </button>
          <div
            data-orientation="vertical"
            role="none"
            className="shrink-0 bg-border h-8 w-[1px] mx-2 self-center"
          ></div>
          {breadcrumb ? (
            <div className="flex items-center gap-2">{breadcrumb}</div>
          ) : (
            <h1 className="text-base font-medium leading-none">{title}</h1>
          )}
        </div>
        {/* Center: Search bar */}
        <div className="flex-1 flex justify-center">
          <div className="hidden md:block w-full max-w-md">
            <SearchForm className="w-full" />
          </div>
        </div>
        {/* Right: GitHub, Theme, UserButton */}
        <div className="flex items-center gap-x-4 ml-auto">
          <ThemeDropdown />
          <UserButton
            afterSignOutUrl="/sign-in"
            fallback={
              <div className="h-8 w-8 rounded-full bg-muted animate-pulse" />
            }
          />
        </div>
      </div>
    </header>
  );
}
