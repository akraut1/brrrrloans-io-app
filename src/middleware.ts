import { clerkMiddleware } from "@clerk/nextjs/server";
import { NextResponse } from "next/server";

const publicPaths = [
  "/",
  "/landing-page",
  "/api/webhooks(.*)",
  "/sign-in(.*)",
  "/sign-up(.*)",
  "/sso-callback(.*)",
];

function isPublic(path: string) {
  return publicPaths.some((publicPath) => {
    const regex = new RegExp(`^${publicPath.replace(/\(\.\*\)/, ".*")}$`);
    return regex.test(path);
  });
}

export default clerkMiddleware(async (auth, request) => {
  const { userId } = await auth();

  if (isPublic(request.nextUrl.pathname)) {
    return NextResponse.next();
  }

  if (!userId) {
    const signInUrl = new URL("/sign-in", request.url);
    signInUrl.searchParams.set("redirect_url", request.url);
    return NextResponse.redirect(signInUrl);
  }

  return NextResponse.next();
});

export const config = {
  matcher: ["/((?!.+\\.[\\w]+$|_next).*)", "/", "/(api|trpc)(.*)"],
};
