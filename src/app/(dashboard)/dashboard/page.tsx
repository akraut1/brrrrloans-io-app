"use client";

import { SiteHeader } from "@/components/layout/site-header";

export default function Page() {
  return (
    <>
      <SiteHeader
        title="Dashboard"
        breadcrumb={
          <div className="flex items-center gap-2">
            <span className="text-muted-foreground">Dashboard</span>
            <span className="mx-1">/</span>
          </div>
        }
      />
      <div className="flex flex-col gap-4 py-4 md:gap-6 md:py-6 px-4 lg:px-6">
        <div className="rounded-xl bg-background border shadow p-6 flex flex-col gap-4">
          <h1 className="text-2xl md:text-3xl font-bold tracking-tight">
            Welcome to your dashboard!
          </h1>
          <div className="rounded-lg border p-6 text-muted-foreground bg-muted/40">
            Add your dashboard widgets, charts, and tables here to match the
            shadcn-admin-1.0.0 layout.
          </div>
          {/* Example responsive grid for widgets/charts */}
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mt-4">
            {/* Add widgets here */}
            <div className="rounded-lg bg-white border p-4 shadow-sm min-h-[120px]" />
            <div className="rounded-lg bg-white border p-4 shadow-sm min-h-[120px]" />
            <div className="rounded-lg bg-white border p-4 shadow-sm min-h-[120px]" />
            <div className="rounded-lg bg-white border p-4 shadow-sm min-h-[120px]" />
          </div>
        </div>
      </div>
    </>
  );
}
