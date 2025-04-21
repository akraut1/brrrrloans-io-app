import React from "react";
import CarouselCard from "./CarouselCard";
import {
  RocketIcon,
  CodeIcon,
  LockClosedIcon,
  BarChartIcon,
} from "@radix-ui/react-icons";

export const Card1 = () => (
  <CarouselCard
    title="Modern Development"
    description="Build with the latest technologies and best practices"
    icon={<RocketIcon className="w-6 h-6" />}
    variant="primary"
  />
);

export const Card2 = () => (
  <CarouselCard
    title="Clean Code"
    description="Maintainable and scalable codebase"
    icon={<CodeIcon className="w-6 h-6" />}
    variant="secondary"
  />
);

export const Card3 = () => (
  <CarouselCard
    title="Enterprise Ready"
    description="Secure and reliable for business applications"
    icon={<LockClosedIcon className="w-6 h-6" />}
    variant="tertiary"
  />
);

export const Card4 = () => (
  <CarouselCard
    title="Performance Focused"
    description="Optimized for speed and efficiency"
    icon={<BarChartIcon className="w-6 h-6" />}
    variant="primary"
  />
);
