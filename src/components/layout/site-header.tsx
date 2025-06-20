"use client";

import { Separator } from "@/components/ui/separator";
import { SidebarTrigger } from "@/components/ui/sidebar";
import { SearchForm } from "@/components/layout/search-form";
import { ThemeDropdown } from "@/components/theme/theme-dropdown";

interface SiteHeaderProps {
  title?: string;
  breadcrumb?: React.ReactNode;
}

export function SiteHeader({
  title = "Documents",
  breadcrumb,
}: SiteHeaderProps) {
  return (
    <header className="bg-background z-50 flex h-16 shrink-0 items-center gap-2 border-b px-4 sticky top-0">
      <SidebarTrigger className="-ml-1" />
      <Separator
        orientation="vertical"
        className="bg-border shrink-0 w-[1px] mr-2 h-4"
      />
      {breadcrumb ? (
        <div className="flex items-center gap-2">{breadcrumb}</div>
      ) : (
        <h1 className="text-base font-medium">{title}</h1>
      )}
      <div className="flex w-full justify-between ml-4">
        <SearchForm className="w-full max-w-56 xl:max-w-64" />
        <ThemeDropdown />
      </div>
    </header>
  );
}
