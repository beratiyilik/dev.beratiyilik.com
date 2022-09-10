/** @type {import('next').NextConfig} */

module.exports = async (phase, { defaultConfig }) => {
  const nextConfig = {
    reactStrictMode: true,
    swcMinify: true,
    distDir: "build",
  };
  return nextConfig;
};
