'use client';

import React, { useState, useEffect } from 'react';
import { SignInButton, SignUpButton } from "@clerk/nextjs";
import { Button, buttonVariants } from '../components/ui/button.tsx';
import { Badge } from '../components/ui/badge.tsx';
import { cn } from '../lib/utils.ts';
import { Logo } from '../components/logos/logo-react-1.tsx';
import { useTheme } from 'next-themes';

// TODO: Fix image optimization and TypeScript issues
// - Replace next/legacy/image with next/image once TypeScript types are resolved
// - Add proper image optimization configuration
// - Consider using a custom image loader for external images
// - Add proper error handling for failed image loads

export default function Home() {
  // Default to the black logo for initial render to ensure SSR consistency
  const [logoSrc, setLogoSrc] = useState("https://api.app.brrrrloans.com/storage/v1/object/public/assets_public/brrrr/brrrr-mark-black-large.png");
  const { theme, resolvedTheme } = useTheme();
  
  // Update logo only on the client side after hydration
  useEffect(() => {
    const isDark = theme === 'dark' || resolvedTheme === 'dark';
    setLogoSrc(isDark 
      ? "https://api.app.brrrrloans.com/storage/v1/object/public/assets_public/brrrr/brrrr-mark-white.png"
      : "https://api.app.brrrrloans.com/storage/v1/object/public/assets_public/brrrr/brrrr-mark-black-large.png");
  }, [theme, resolvedTheme]);

  return (
    <section className="relative min-h-screen w-full overflow-hidden py-32">
      <div className="fixed inset-0 w-full h-full">
        <img
          alt="Decorative background pattern with subtle gradient"
          src="https://shadcnblocks.com/images/block/hero12/background.svg"
          className="animate-background-fade [mask-image:radial-gradient(ellipse_at_center,white,transparent)] w-full h-full object-cover object-center"
          role="presentation"
        />
      </div>
      <div className="relative z-10 container">
        <div className="mx-auto flex max-w-5xl flex-col items-center">
          <div className="flex flex-col items-center gap-6 text-center">
            <div className="flex items-center gap-2">
              <img 
                src={logoSrc}
                alt="BRRRR Loans Logo"
                className="h-12 w-auto"
              />
              <span className="text-5xl font-semibold tracking-tight ml-2 leading-[48px]">Repeat</span>
            </div>
            <div>
              <p className="text-muted-foreground lg:text-xl whitespace-nowrap">
                Open source, enterprise grade infrastructure for business purpose lending at scale.
              </p>
            </div>
            <div className="mt-4 flex justify-center gap-4">
              <SignInButton mode="modal">
                <Button size="lg" variant="outline">Sign In</Button>
              </SignInButton>
              <SignUpButton mode="modal">
                <Button size="lg">Sign Up</Button>
              </SignUpButton>
            </div>
            <div className="mt-20 flex flex-col items-center gap-4">
              <Badge 
                variant="secondary" 
                className="mb-2 text-secondary-foreground bg-secondary border-transparent"
              >
                Open Source
              </Badge>
              <p className="text-center text-muted-foreground lg:text-left">
                Featuring cutting edge, best-in-class infrastructure
              </p>
              <div className="flex flex-wrap items-center justify-center gap-4">
                <a
                  href="https://ui.shadcn.com"
                  className={cn(buttonVariants({ variant: "outline" }), "group px-3")}
                  target="_blank"
                  rel="noopener noreferrer"
                  aria-label="Visit shadcn/ui component library"
                >
                  <Logo width={24} height={24} />
                </a>
                <a
                  href="https://nextjs.org"
                  className={cn(buttonVariants({ variant: "outline" }), "group px-3")}
                  target="_blank"
                  rel="noopener noreferrer"
                  aria-label="Visit Next.js website"
                >
                  <img
                    src="https://assets.vercel.com/image/upload/v1662130559/nextjs/Icon_light_background.png"
                    alt="Next.js Framework Logo"
                    className="h-6 w-auto saturate-0 transition-all group-hover:saturate-100"
                  />
                </a>
                <a
                  href="https://supabase.com"
                  className={cn(buttonVariants({ variant: "outline" }), "group px-3")}
                  target="_blank"
                  rel="noopener noreferrer"
                  aria-label="Visit Supabase website"
                >
                  <img
                    src="https://supabase.com/dashboard/img/supabase-logo.svg"
                    alt="Supabase Database Logo"
                    className="h-6 w-auto saturate-0 transition-all group-hover:saturate-100"
                  />
                </a>
                <a
                  href="https://www.typescriptlang.org"
                  className={cn(buttonVariants({ variant: "outline" }), "group px-3")}
                  target="_blank"
                  rel="noopener noreferrer"
                  aria-label="Visit TypeScript website"
                >
                  <img
                    src="https://shadcnblocks.com/images/block/logos/typescript-icon.svg"
                    alt="TypeScript Programming Language Logo"
                    className="h-6 w-auto saturate-0 transition-all group-hover:saturate-100"
                  />
                </a>
                <a
                  href="https://react.dev"
                  className={cn(buttonVariants({ variant: "outline" }), "group px-3")}
                  target="_blank"
                  rel="noopener noreferrer"
                  aria-label="Visit React website"
                >
                  <img
                    src="https://shadcnblocks.com/images/block/logos/react-icon.svg"
                    alt="React JavaScript Library Logo"
                    className="h-6 w-auto saturate-0 transition-all group-hover:saturate-100"
                  />
                </a>
                <a
                  href="https://vercel.com"
                  className={cn(buttonVariants({ variant: "outline" }), "group px-3")}
                  target="_blank"
                  rel="noopener noreferrer"
                  aria-label="Visit Vercel website"
                >
                  <svg
                    width="24"
                    height="24"
                    viewBox="0 0 76 65"
                    fill="none"
                    xmlns="http://www.w3.org/2000/svg"
                    className="h-6 saturate-0 transition-all group-hover:saturate-100"
                    aria-label="Vercel Deployment Platform Logo"
                  >
                    <path d="M37.5274 0L75.0548 65H0L37.5274 0Z" fill="currentColor" />
                  </svg>
                </a>
                <a
                  href="https://tailwindcss.com"
                  className={cn(buttonVariants({ variant: "outline" }), "group px-3")}
                  target="_blank"
                  rel="noopener noreferrer"
                  aria-label="Visit Tailwind CSS website"
                >
                  <img
                    src="https://shadcnblocks.com/images/block/logos/tailwind-icon.svg"
                    alt="Tailwind CSS Framework Logo"
                    className="h-6 w-auto saturate-0 transition-all group-hover:saturate-100"
                  />
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
