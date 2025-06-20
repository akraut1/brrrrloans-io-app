"use client";

import { useTheme } from "next-themes";
import Image from "next/image";

interface OpenAILogoProps {
  className?: string;
  size?: number;
}

export function OpenAILogo({ className = "", size = 16 }: OpenAILogoProps) {
  const { theme, systemTheme } = useTheme();

  // Determine if we're in dark mode
  const isDark =
    theme === "dark" || (theme === "system" && systemTheme === "dark");

  const logoSrc = isDark
    ? "/logos/openai-logo-icon-darkmode.svg"
    : "/logos/openai-logo-icon-lightmode.svg";

  return (
    <Image
      key={logoSrc}
      src={logoSrc}
      alt="OpenAI"
      width={size}
      height={size}
      className={className}
      priority
    />
  );
}
