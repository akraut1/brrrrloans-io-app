import React from "react";
import CarouselCard from "./CarouselCard";
import {
  LightningBoltIcon,
  GlobeIcon,
  PersonIcon,
  GearIcon,
} from "@radix-ui/react-icons";

export const Card5 = () => (
  <CarouselCard
    title="Lightning Fast"
    description="Optimized for maximum performance"
    icon={<LightningBoltIcon className="w-6 h-6" />}
    variant="secondary"
  />
);

export const Card6 = () => (
  <CarouselCard
    title="Global Reach"
    description="Built for international markets"
    icon={<GlobeIcon className="w-6 h-6" />}
    variant="tertiary"
  />
);

export const Card7 = () => (
  <CarouselCard
    title="User Centric"
    description="Designed with the user in mind"
    icon={<PersonIcon className="w-6 h-6" />}
    variant="primary"
  />
);

export const Card8 = () => (
  <CarouselCard
    title="Customizable"
    description="Flexible and adaptable to your needs"
    icon={<GearIcon className="w-6 h-6" />}
    variant="secondary"
  />
);
