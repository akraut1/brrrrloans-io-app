"use client";

import { SignUp } from "@/components/auth/clerk-components";
import { signUpAppearance, signUpDarkAppearance } from "@/lib/clerk-theme";
import { useTheme } from "next-themes";

export function SignUpForm() {
  const { theme } = useTheme();

  const isDark = theme === "dark";
  const appearance = isDark ? signUpDarkAppearance : signUpAppearance;
  const logoImageUrl = isDark
    ? "/logos/brrrr-icon-sq-white-192.png"
    : "/logos/brrrr-icon-sq-black-192.png";

  return (
    <SignUp
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
