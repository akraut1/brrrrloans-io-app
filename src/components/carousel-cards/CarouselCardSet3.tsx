import React from "react";
import CarouselCard from "./CarouselCard";
import {
  ShieldCheckIcon,
  ClockIcon,
  ChatBubbleIcon,
  MixerVerticalIcon,
} from "@radix-ui/react-icons";

export const Card9 = () => (
  <CarouselCard
    title="Secure Platform"
    description="Enterprise-grade security features"
    icon={<ShieldCheckIcon className="w-6 h-6" />}
    variant="primary"
  />
);

export const Card10 = () => (
  <CarouselCard
    title="Real-time Updates"
    description="Stay informed with instant notifications"
    icon={<ClockIcon className="w-6 h-6" />}
    variant="secondary"
  />
);

export const Card11 = () => (
  <CarouselCard
    title="Collaborative"
    description="Built for team communication"
    icon={<ChatBubbleIcon className="w-6 h-6" />}
    variant="tertiary"
  />
);

export const Card12 = () => (
  <CarouselCard
    title="Advanced Analytics"
    description="Data-driven insights and reporting"
    icon={<MixerVerticalIcon className="w-6 h-6" />}
    variant="secondary"
  />
);
