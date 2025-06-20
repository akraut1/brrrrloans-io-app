"use client";

import * as React from "react";
import { OrganizationSwitcher } from "@/components/auth/clerk-components";
import { usePathname } from "next/navigation";
import { Building, Home, FileText, File, DollarSign } from "lucide-react";
import { NavAI } from "./nav-ai";
import { NavMain } from "./nav-main";
import { NavDocuments } from "./nav-documents";
import { NavUser } from "./nav-user";

import {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarHeader,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarRail,
  SidebarSeparator,
} from "@/components/ui/sidebar";

export function AppSidebar(
  props: React.ComponentPropsWithoutRef<typeof Sidebar>
) {
  const pathname = usePathname();

  const mainNavItems = [
    {
      title: "Dashboard",
      url: "/dashboard",
      icon: Home,
      isActive: pathname === "/dashboard",
    },
    {
      title: "Deals",
      url: "/dashboard/deals",
      icon: Building,
      isActive: pathname.startsWith("/dashboard/deals"),
    },
    {
      title: "Distributions",
      url: "/dashboard/distributions",
      icon: DollarSign,
      isActive: pathname.startsWith("/dashboard/distributions"),
    },
    {
      title: "Documents",
      url: "/dashboard/documents",
      icon: File,
      isActive:
        pathname.startsWith("/dashboard/documents") ||
        pathname.startsWith("/dashboard/investor-statements"),
    },
    {
      title: "Reports",
      url: "/dashboard/reports",
      icon: FileText,
      isActive: pathname.startsWith("/dashboard/reports"),
    },
  ];

  const documentItems = [
    {
      name: "Statements",
      url: "/dashboard/documents",
      icon: FileText,
    },
    {
      name: "Reports",
      url: "/dashboard/reports",
      icon: File,
    },
    {
      name: "More",
      icon: File,
      disabled: true,
    },
  ];

  return (
    <Sidebar
      collapsible="offcanvas"
      variant="inset"
      className="h-screen w-64 min-w-[16rem] flex-shrink-0"
      {...props}
    >
      <SidebarHeader>
        <SidebarMenu>
          <SidebarMenuItem>
            <SidebarMenuButton
              size="lg"
              className="data-[state=open]:bg-sidebar-accent data-[state=open]:text-sidebar-accent-foreground [&_.cl-organizationSwitcherTrigger]:!flex [&_.cl-organizationSwitcherTrigger]:!items-center [&_.cl-organizationSwitcherTrigger]:!gap-2 [&_.cl-organizationSwitcherTrigger]:!w-full [&_.cl-organizationSwitcherTrigger]:!justify-start [&_.cl-organizationPreview]:!flex [&_.cl-organizationPreview]:!items-center [&_.cl-organizationPreview]:!gap-2 [&_.cl-organizationPreview]:!w-full [&_.cl-organizationPreview]:!justify-start [&_.cl-organizationPreviewAvatarBox]:!order-first [&_.cl-organizationPreviewAvatarBox]:!mr-2"
            >
              <OrganizationSwitcher
                appearance={{
                  elements: {
                    organizationSwitcherTrigger:
                      "flex items-center gap-2 w-full h-full p-0 border-0 bg-transparent hover:bg-transparent focus:bg-transparent active:bg-transparent justify-start",
                    organizationPreview:
                      "flex items-center gap-2 w-full justify-start",
                    organizationSwitcherTriggerIcon: "hidden",
                    organizationSwitcherPopoverCard:
                      "w-[--radix-dropdown-menu-trigger-width] min-w-56 rounded-lg",
                    organizationPreviewAvatarBox:
                      "h-8 w-8 rounded-lg shrink-0 order-first",
                    organizationPreviewAvatarImage:
                      "aspect-square h-full w-full rounded-lg",
                    organizationPreviewMainIdentifier:
                      "grid flex-1 text-left text-sm leading-tight ml-2",
                    organizationPreviewTextContainer:
                      "truncate font-semibold text-left",
                    organizationPreviewSecondaryIdentifier:
                      "truncate text-xs text-muted-foreground text-left",
                  },
                }}
              />
            </SidebarMenuButton>
          </SidebarMenuItem>
        </SidebarMenu>
      </SidebarHeader>

      <SidebarSeparator />

      <SidebarContent>
        <NavAI />
        <NavMain items={mainNavItems} />
        <NavDocuments items={documentItems} />
      </SidebarContent>

      <SidebarFooter>
        <NavUser />
      </SidebarFooter>
      <SidebarRail />
    </Sidebar>
  );
}
