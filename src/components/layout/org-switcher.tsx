"use client";

import { OrganizationSwitcher } from "@/components/auth/clerk-components";
import {
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
} from "@/components/ui/sidebar";

export function OrgSwitcher() {
  return (
    <SidebarMenu>
      <SidebarMenuItem>
        <SidebarMenuButton size="lg" asChild>
          <OrganizationSwitcher
            hidePersonal
            appearance={{
              elements: {
                organizationSwitcherTrigger:
                  "flex items-center w-full h-full p-0 border-0 bg-transparent hover:bg-sidebar-accent focus:bg-sidebar-accent rounded-md transition-colors",
                organizationSwitcherTriggerIcon: "ml-auto size-4",
                organizationPreview: "flex items-center w-full gap-3",
                organizationPreviewAvatarBox:
                  "flex aspect-square size-8 items-center justify-center rounded-lg bg-sidebar-primary text-sidebar-primary-foreground shrink-0",
                organizationPreviewAvatarImage: "size-8 rounded-lg",
                organizationPreviewMainIdentifier:
                  "grid flex-1 text-left text-sm leading-tight",
                organizationPreviewPrimaryIdentifier:
                  "truncate font-semibold text-sm",
                organizationPreviewSecondaryIdentifier:
                  "truncate text-xs text-muted-foreground",
              },
            }}
            createOrganizationMode="modal"
            organizationProfileMode="modal"
          />
        </SidebarMenuButton>
      </SidebarMenuItem>
    </SidebarMenu>
  );
}
