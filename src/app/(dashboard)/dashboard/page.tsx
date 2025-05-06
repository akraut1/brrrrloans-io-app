"use client";

import { ChartAreaInteractive } from "@/components/data-chart-area-interactive";
import { DataTable } from "@/components/data-table";
import { SectionCards } from "@/components/section-cards";
import { SiteHeader } from "@/components/layout/site-header";
import data from "./data.json";

export default function Page() {
  return (
    <>
      <SiteHeader />
      <div className="@container/main flex flex-1 flex-col gap-2">
        <div className="flex flex-col gap-4 py-4 md:gap-6 md:py-6">
          <div className="px-4 lg:px-6 grid gap-4 md:grid-cols-2 lg:grid-cols-4">
            <SectionCards />
          </div>
          <div className="px-4 lg:px-6">
            <ChartAreaInteractive />
          </div>
          <DataTable data={data} />
        </div>
      </div>
    </>
  );
}
