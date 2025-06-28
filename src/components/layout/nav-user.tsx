"use client";

import { UserButton } from "@/components/auth/clerk-components";
import {
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
} from "@/components/ui/sidebar";

export function NavUser() {
  return (
    <SidebarMenu>
      <SidebarMenuItem>
        <SidebarMenuButton size="lg" asChild>
          <UserButton
            afterSignOutUrl="/sign-in"
            showName
            appearance={{
              elements: {
                userButtonBox: "flex items-center w-full h-full",
                userButtonTrigger:
                  "flex items-center w-full h-full p-0 border-0 bg-transparent hover:bg-sidebar-accent focus:bg-sidebar-accent rounded-md transition-colors",
                userButtonAvatarBox:
                  "h-8 w-8 rounded-lg shrink-0 mr-3 order-first",
                userButtonAvatarImage: "h-8 w-8 rounded-lg",
                userButtonOuterBox: "flex items-center w-full",
                userButtonInner: "grid flex-1 text-left text-sm leading-tight",
                userButtonIdentifier__username:
                  "truncate font-semibold text-sm",
                userButtonIdentifier__emailAddress:
                  "truncate text-xs text-muted-foreground",
              },
            }}
          />
        </SidebarMenuButton>
      </SidebarMenuItem>
    </SidebarMenu>
  );
}
