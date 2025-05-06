"use client";

// Import and re-export the hooks directly
// This file serves as an isolation layer in case we need to switch authentication providers
import { useAuth, useUser } from "@clerk/nextjs";

export { useAuth, useUser };
 