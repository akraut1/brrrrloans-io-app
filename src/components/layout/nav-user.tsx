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
                  "flex items-center w-full h-full p-0 border-0 bg-transparent hover:bg-transparent focus:bg-transparent active:bg-transparent",
                userButtonAvatarBox:
                  "h-8 w-8 rounded-lg shrink-0 order-first mr-2",
                userButtonAvatarImage:
                  "aspect-square h-full w-full rounded-lg",
                userButtonOuterBox: "flex items-center w-full gap-2",
                userButtonInner:
                  "flex flex-col justify-start items-start text-left leading-tight gap-0.5 ml-2",
                userButtonIdentifier__username:
                  "truncate font-semibold text-sm text-left block",
                userButtonIdentifier__emailAddress:
                  "truncate text-xs text-muted-foreground text-left block",
              },
            }}
          />
        </SidebarMenuButton>
      </SidebarMenuItem>
    </SidebarMenu>
  );
}
