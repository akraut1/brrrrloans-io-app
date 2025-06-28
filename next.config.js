/** @type {import('next').NextConfig} */
const nextConfig = {
  images: {
    remotePatterns: [
      { protocol: "https", hostname: "shadcnblocks.com" },
      { protocol: "https", hostname: "api.app.brrrrloans.com" },
      { protocol: "https", hostname: "assets.vercel.com" },
      { protocol: "https", hostname: "supabase.com" },
    ],
  },
  allowedDevOrigins: [
    "http://localhost:3000",
    "http://localhost:3001",
    "http://192.168.1.237:3001",
  ],
  eslint: {
    ignoreDuringBuilds: true,
  },
  typescript: {
    // !! WARN !!
    // Dangerously allow production builds to successfully complete even if
    // your project has type errors.
    // !! WARN !!
    ignoreBuildErrors: true,
  },
};

module.exports = nextConfig;
