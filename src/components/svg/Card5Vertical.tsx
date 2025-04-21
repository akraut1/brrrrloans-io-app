import React from "react";

export function Card5Vertical({
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
      <path d="M50 50H250V250H50V50Z" rx="8" fill="#E9ECEF" />
      <circle cx="75" cy="300" r="25" fill="#E9ECEF" />
      <circle cx="150" cy="300" r="25" fill="#E9ECEF" />
      <circle cx="225" cy="300" r="25" fill="#E9ECEF" />
      <rect x="50" y="350" width="200" height="20" rx="4" fill="#E9ECEF" />
      <rect x="50" y="390" width="200" height="20" rx="4" fill="#E9ECEF" />
      <rect x="50" y="430" width="200" height="20" rx="4" fill="#E9ECEF" />
    </svg>
  );
}
