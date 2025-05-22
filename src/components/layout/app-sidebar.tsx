"use client";

import { UserButton } from "@/components/auth/clerk-components";
import Image from "next/image";
import Link from "next/link";
import { useTheme } from "next-themes";
import { usePathname } from "next/navigation";
import {
  Building,
  Home,
  FileText,
  File,
  Search,
  Sun,
  Moon,
  Laptop,
  DollarSign,
  BarChart,
} from "lucide-react";

import {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarGroup,
  SidebarGroupContent,
  SidebarGroupLabel,
  SidebarHeader,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarRail,
  SidebarSeparator,
  SidebarInput,
} from "@/components/ui/sidebar";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuTrigger,
  DropdownMenuRadioGroup,
  DropdownMenuRadioItem,
} from "@/components/ui/dropdown-menu";
import { Button } from "@/components/ui/button";

export function AppSidebar(
  props: React.ComponentPropsWithoutRef<typeof Sidebar>
) {
  const pathname = usePathname();
  const { theme, setTheme } = useTheme();

  const routes = [
    {
      href: "/dashboard",
      label: "Dashboard",
      icon: Home,
      isActive: pathname === "/dashboard",
    },
    {
      href: "/dashboard/deals",
      label: "Deals",
      icon: Building,
      isActive: pathname.startsWith("/dashboard/deals"),
    },
    {
      href: "/dashboard/distributions",
      label: "Distributions",
      icon: DollarSign,
      isActive: pathname.startsWith("/dashboard/distributions"),
    },
    {
      href: "/dashboard/documents",
      label: "Documents",
      icon: File,
      isActive:
        pathname.startsWith("/dashboard/documents") ||
        pathname.startsWith("/dashboard/investor-statements"),
    },
    {
      href: "/dashboard/reports",
      label: "Reports",
      icon: FileText,
      isActive: pathname.startsWith("/dashboard/reports"),
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
        <div className="flex items-center justify-between gap-2 px-2">
          <div className="flex items-center gap-2">
            <Image
              src="/logos/brrrr-icon-sq-black-192.png"
              alt="Brrrr Loans Logo"
              width={24}
              height={24}
              className="block dark:hidden"
            />
            <Image
              src="/logos/brrrr-icon-sq-white-192.png"
              alt="Brrrr Loans Logo"
              width={24}
              height={24}
              className="hidden dark:block"
            />
            <span className="font-medium">Lender Portal</span>
          </div>
          <DropdownMenu>
            <DropdownMenuTrigger asChild>
              <Button variant="ghost" size="icon" className="h-8 w-8">
                <Sun className="h-4 w-4 rotate-0 scale-100 transition-all dark:-rotate-90 dark:scale-0" />
                <Moon className="absolute h-4 w-4 rotate-90 scale-0 transition-all dark:rotate-0 dark:scale-100" />
                <span className="sr-only">Toggle theme</span>
              </Button>
            </DropdownMenuTrigger>
            <DropdownMenuContent align="end">
              <DropdownMenuRadioGroup value={theme} onValueChange={setTheme}>
                <DropdownMenuRadioItem value="light">
                  <Sun className="mr-2 h-4 w-4" />
                  <span>Light</span>
                </DropdownMenuRadioItem>
                <DropdownMenuRadioItem value="dark">
                  <Moon className="mr-2 h-4 w-4" />
                  <span>Dark</span>
                </DropdownMenuRadioItem>
                <DropdownMenuRadioItem value="system">
                  <Laptop className="mr-2 h-4 w-4" />
                  <span>System</span>
                </DropdownMenuRadioItem>
              </DropdownMenuRadioGroup>
            </DropdownMenuContent>
          </DropdownMenu>
        </div>
        <SidebarSeparator />
        <div className="px-2">
          <div className="relative">
            <Search className="absolute left-2.5 top-2.5 h-4 w-4 text-muted-foreground" />
            <SidebarInput
              type="search"
              placeholder="Search..."
              className="pl-8"
            />
          </div>
        </div>
      </SidebarHeader>
      <SidebarContent>
        <SidebarGroup>
          <SidebarGroupLabel>Navigation</SidebarGroupLabel>
          <SidebarGroupContent>
            <SidebarMenu>
              {routes.map((route) => (
                <SidebarMenuItem key={route.href}>
                  <SidebarMenuButton
                    asChild
                    isActive={route.isActive}
                    tooltip={route.label}
                  >
                    <Link href={route.href}>
                      <route.icon />
                      <span>{route.label}</span>
                    </Link>
                  </SidebarMenuButton>
                </SidebarMenuItem>
              ))}
            </SidebarMenu>
          </SidebarGroupContent>
        </SidebarGroup>
      </SidebarContent>
      <SidebarFooter>
        <SidebarSeparator />
        <SidebarMenu>
          <SidebarMenuItem>
            <div className="flex items-center justify-between px-2">
              <UserButton
                afterSignOutUrl="/sign-in"
                appearance={{
                  elements: {
                    avatarBox: "h-8 w-8",
                  },
                }}
              />
            </div>
          </SidebarMenuItem>
        </SidebarMenu>
      </SidebarFooter>
      <SidebarRail />
    </Sidebar>
  );
}
