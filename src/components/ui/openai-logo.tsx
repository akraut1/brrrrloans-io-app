"use client";

import { useTheme } from "next-themes";
import { useEffect, useState } from "react";
import Image from "next/image";

interface OpenAILogoProps {
  className?: string;
  size?: number;
}

export function OpenAILogo({ className = "", size = 16 }: OpenAILogoProps) {
  const { theme, systemTheme } = useTheme();
  const [mounted, setMounted] = useState(false);

  // Only render theme-dependent content after hydration
  useEffect(() => {
    setMounted(true);
  }, []);

  // Use a default (light mode) during SSR to prevent hydration mismatch
  if (!mounted) {
    return (
      <Image
        src="/logos/openai-logo-icon-lightmode.svg"
        alt="OpenAI"
        width={size}
        height={size}
        className={className}
        priority
      />
    );
  }

  // Determine if we're in dark mode (only after mount)
  const isDark =
    theme === "dark" || (theme === "system" && systemTheme === "dark");

  const logoSrc = isDark
    ? "/logos/openai-logo-icon-darkmode.svg"
    : "/logos/openai-logo-icon-lightmode.svg";

  return (
    <Image
      src={logoSrc}
      alt="OpenAI"
      width={size}
      height={size}
      className={className}
      priority
    />
  );
}
