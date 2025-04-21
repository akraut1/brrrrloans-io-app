import React from "react";

export function Card2Vertical({
  className = "",
  ...props
}: React.SVGProps<SVGSVGElement>) {
  return (
    <svg
      className={className}
      viewBox="0 0 300 500"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      {...props}
    >
      <rect width="300" height="500" rx="16" fill="#F8F9FA" />
      <rect x="24" y="24" width="252" height="452" rx="8" fill="white" />
      <rect x="50" y="50" width="200" height="200" rx="8" fill="#E9ECEF" />
      <rect x="100" y="280" width="100" height="20" rx="4" fill="#E9ECEF" />
      <rect x="80" y="320" width="140" height="16" rx="4" fill="#E9ECEF" />
      <rect x="60" y="360" width="180" height="12" rx="4" fill="#E9ECEF" />
      <rect x="40" y="400" width="220" height="12" rx="4" fill="#E9ECEF" />
    </svg>
  );
}
