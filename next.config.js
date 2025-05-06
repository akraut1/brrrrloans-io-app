/** @type {import('next').NextConfig} */
const nextConfig = {
  images: {
    remotePatterns: [
      {
        protocol: "https",
        hostname: "shadcnblocks.com",
      },
      {
        protocol: "https",
        hostname: "api.app.brrrrloans.com",
      },
      {
        protocol: "https",
        hostname: "assets.vercel.com",
      },
      {
        protocol: "https",
        hostname: "supabase.com",
      },
    ],
  },
};

module.exports = nextConfig;
