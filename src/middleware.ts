// middleware.ts
import { clerkMiddleware } from "@clerk/nextjs/server";
import { NextRequest, NextResponse } from "next/server";

export default clerkMiddleware((auth, req: NextRequest) => {
  // Allow public access to the /builder page (for both direct access and Builder.io)
  if (req.nextUrl.pathname === "/builder") {
    return NextResponse.next();
  }

  // Check if this is a Builder.io request by looking at various headers and patterns
  const userAgent = req.headers.get("user-agent") || "";
  const referer = req.headers.get("referer") || "";
  const builderHeader = req.headers.get("x-builder-io") || "";

  const isBuilderRequest =
    userAgent.includes("builder.io") ||
    userAgent.includes("Builder.io") ||
    referer.includes("builder.io") ||
    builderHeader === "true" ||
    // Also check for localhost requests that might be from Builder.io
    (req.headers.get("host")?.includes("localhost") &&
      req.headers.get("sec-fetch-site") === "cross-site");

  // Allow Builder.io requests to pass through without authentication
  if (isBuilderRequest) {
    return NextResponse.next();
  }

  // Let Clerk handle authentication for all other requests
});

export const config = {
  matcher: [
    // Skip Next.js internals and all static files, unless found in search params
    "/((?!_next|[^?]*\\.(?:html?|css|js(?!on)|jpe?g|webp|png|gif|svg|ttf|woff2?|ico|csv|docx?|xlsx?|zip|webmanifest)).*)",
    // Always run for API routes
    "/(api|trpc)(.*)",
  ],
};
