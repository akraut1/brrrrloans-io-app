import { createServerComponentClient } from "@supabase/auth-helpers-nextjs";
import { cookies } from "next/headers";
import { DealDetailsWrapper } from "@/components/deals/protected-deal-details";
import { DocumentsListWrapper } from "@/components/documents/protected-documents-list";
import { DistributionsListWrapper } from "@/components/distributions/protected-distributions-list";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { notFound } from "next/navigation";
import type { Database } from "@/types/supabase";

interface PageProps {
  params: {
    id: string;
  };
}

export default async function DealPage({ params }: PageProps) {
  const supabase = createServerComponentClient<Database>({ cookies });

  // Fetch basic deal data
  const { data: deal, error } = await supabase
    .from("deal")
    .select("*")
    .eq("id", params.id)
    .single();

  if (error || !deal) {
    notFound();
  }

  return (
    <div className="container mx-auto py-6 space-y-6">
      <DealDetailsWrapper dealId={params.id} deal={deal} />

      <Tabs defaultValue="documents" className="w-full">
        <TabsList>
          <TabsTrigger value="documents">Documents</TabsTrigger>
          <TabsTrigger value="distributions">Distributions</TabsTrigger>
        </TabsList>

        <TabsContent value="documents">
          <DocumentsListWrapper dealId={params.id} />
        </TabsContent>

        <TabsContent value="distributions">
          <DistributionsListWrapper dealId={params.id} />
        </TabsContent>
      </Tabs>
    </div>
  );
}
