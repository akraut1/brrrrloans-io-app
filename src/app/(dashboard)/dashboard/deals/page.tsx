"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { SiteHeader } from "@/components/layout/site-header";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog";
import { Eye, Download, Plus } from "lucide-react";
import { DealDetails } from "@/components/deals/deal-details";
import { useDeals } from "@/hooks/use-deals";

export default function DealsPage() {
  const [searchTerm, setSearchTerm] = useState("");
  const [selectedType, setSelectedType] = useState("all");
  const [selectedStatus, setSelectedStatus] = useState("all-status");
  const router = useRouter();

  // Use the custom hook to fetch deals
  const { deals, loading, error } = useDeals({
    type: selectedType !== "all" ? selectedType : undefined,
    status: selectedStatus !== "all-status" ? selectedStatus : undefined,
    search: searchTerm || undefined,
  });

  return (
    <>
      <SiteHeader />
      <div className="@container/main flex flex-1 flex-col gap-2">
        <div className="flex flex-col gap-4 py-4 md:gap-6 md:py-6 px-4 lg:px-6">
          <div className="flex items-center justify-between">
            <h1 className="text-2xl font-bold tracking-tight">Deals</h1>
            <div className="flex gap-2">
              <Button variant="outline">
                <Download className="mr-2 h-4 w-4" />
                Export
              </Button>
              <Button onClick={() => router.push("/dashboard/deals/new")}>
                <Plus className="mr-2 h-4 w-4" />
                New Deal
              </Button>
            </div>
          </div>
          <Card>
            <CardHeader>
              <CardTitle>All Deals</CardTitle>
              <CardDescription>
                View and manage all investment deals
              </CardDescription>
            </CardHeader>
            <CardContent>
              <div className="flex items-center gap-2 mb-4">
                <Input
                  placeholder="Search deals..."
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  className="max-w-sm"
                />
                <Select value={selectedType} onValueChange={setSelectedType}>
                  <SelectTrigger className="w-[180px]">
                    <SelectValue placeholder="Filter by type" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="all">All Types</SelectItem>
                    <SelectItem value="Multi-Family">Multi-Family</SelectItem>
                    <SelectItem value="Commercial">Commercial</SelectItem>
                    <SelectItem value="Residential">Residential</SelectItem>
                    <SelectItem value="Land">Land</SelectItem>
                  </SelectContent>
                </Select>
                <Select
                  value={selectedStatus}
                  onValueChange={setSelectedStatus}
                >
                  <SelectTrigger className="w-[180px]">
                    <SelectValue placeholder="Filter by status" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="all-status">All Status</SelectItem>
                    <SelectItem value="Active">Active</SelectItem>
                    <SelectItem value="Pending">Pending</SelectItem>
                    <SelectItem value="Closed">Closed</SelectItem>
                  </SelectContent>
                </Select>
              </div>

              {loading ? (
                <div className="flex justify-center py-8">Loading deals...</div>
              ) : error ? (
                <div className="flex justify-center py-8 text-red-500">
                  Error loading deals: {error}
                </div>
              ) : deals.length === 0 ? (
                <div className="flex flex-col items-center justify-center py-8 text-center">
                  <p className="text-muted-foreground mb-4">No deals found</p>
                  <Button onClick={() => router.push("/dashboard/deals/new")}>
                    <Plus className="mr-2 h-4 w-4" />
                    Create Your First Deal
                  </Button>
                </div>
              ) : (
                <Table>
                  <TableHeader>
                    <TableRow>
                      <TableHead>ID</TableHead>
                      <TableHead>Name</TableHead>
                      <TableHead>Type</TableHead>
                      <TableHead>Amount</TableHead>
                      <TableHead>ROI</TableHead>
                      <TableHead>Location</TableHead>
                      <TableHead>Investors</TableHead>
                      <TableHead>Status</TableHead>
                      <TableHead className="text-right">Actions</TableHead>
                    </TableRow>
                  </TableHeader>
                  <TableBody>
                    {deals.map((deal) => (
                      <TableRow key={deal.id}>
                        <TableCell className="font-medium">{deal.id}</TableCell>
                        <TableCell>{deal.name}</TableCell>
                        <TableCell>{deal.type}</TableCell>
                        <TableCell>{deal.amount}</TableCell>
                        <TableCell>{deal.roi}</TableCell>
                        <TableCell>{deal.location}</TableCell>
                        <TableCell>{deal.investors}</TableCell>
                        <TableCell>
                          <Badge
                            variant={
                              deal.status === "Active" ? "default" : "secondary"
                            }
                          >
                            {deal.status}
                          </Badge>
                        </TableCell>
                        <TableCell className="text-right">
                          <Dialog>
                            <DialogTrigger asChild>
                              <Button variant="ghost" size="icon">
                                <Eye className="h-4 w-4" />
                                <span className="sr-only">View details</span>
                              </Button>
                            </DialogTrigger>
                            <DialogContent className="max-w-3xl">
                              <DialogHeader>
                                <DialogTitle>Deal Details</DialogTitle>
                                <DialogDescription>
                                  Comprehensive information about this
                                  investment deal
                                </DialogDescription>
                              </DialogHeader>
                              <DealDetails deal={deal} />
                            </DialogContent>
                          </Dialog>
                        </TableCell>
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
              )}
            </CardContent>
          </Card>
        </div>
      </div>
    </>
  );
}
