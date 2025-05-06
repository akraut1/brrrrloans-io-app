"use client";

import { SignIn } from "@clerk/nextjs";

export function TestSignIn() {
  return (
    <div className="p-4 border border-red-500">
      <h2 className="text-xl font-bold mb-4">Test Sign In Component</h2>
      <SignIn routing="path" path="/sign-in" signUpUrl="/sign-up" />
    </div>
  );
}
