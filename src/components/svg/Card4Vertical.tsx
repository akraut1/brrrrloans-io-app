import React from "react";

export function Card4Vertical({
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
      <rect x="50" y="50" width="200" height="120" rx="8" fill="#E9ECEF" />
      <rect x="50" y="190" width="200" height="120" rx="8" fill="#E9ECEF" />
      <rect x="100" y="340" width="100" height="20" rx="4" fill="#E9ECEF" />
      <rect x="80" y="380" width="140" height="16" rx="4" fill="#E9ECEF" />
      <rect x="60" y="420" width="180" height="12" rx="4" fill="#E9ECEF" />
    </svg>
  );
}
