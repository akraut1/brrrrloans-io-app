"use client";

import { SignIn } from "@/components/auth/clerk-components";
import { signInAppearance, signInDarkAppearance } from "@/lib/clerk-theme";
import { useTheme } from "next-themes";

export function SignInForm() {
  const { theme } = useTheme();

  const isDark = theme === "dark";
  const appearance = isDark ? signInDarkAppearance : signInAppearance;
  const logoImageUrl = isDark
    ? "/logos/brrrr-loans-logo-gradient-darkmode-448.png"
    : "/logos/brrrr-loans-logo-gradient-lightmode-448.png";

  return (
    <SignIn
      appearance={{
        ...appearance,
        layout: {
          logoImageUrl,
        },
      }}
      routing="hash"
    />
  );
}
