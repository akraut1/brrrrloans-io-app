"use client";

import React from "react";
import { cn } from "../../lib/utils";
import "./progressive-blur.css";

interface ProgressiveBlurProps extends React.HTMLAttributes<HTMLDivElement> {
  direction?: "left" | "right";
  blurIntensity?: number;
}

export function ProgressiveBlur({
  direction = "left",
  blurIntensity = 1,
  className,
  ...props
}: ProgressiveBlurProps) {
  return (
    <div
      role="presentation"
      className={cn(
        "progressive-blur",
        direction === "left"
          ? "progressive-blur-left"
          : "progressive-blur-right",
        className
      )}
      style={{ "--blur-intensity": blurIntensity } as React.CSSProperties}
      {...props}
    />
  );
}
