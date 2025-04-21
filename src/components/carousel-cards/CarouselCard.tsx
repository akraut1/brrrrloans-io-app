import React from "react";
import { cn } from "@/lib/utils";

interface CarouselCardProps {
  title: string;
  description: string;
  icon?: React.ReactNode;
  className?: string;
  variant?: "primary" | "secondary" | "tertiary";
}

const CarouselCard: React.FC<CarouselCardProps> = ({
  title,
  description,
  icon,
  className,
  variant = "primary",
}) => {
  const variantStyles = {
    primary: "bg-gradient-to-br from-primary/10 to-primary/5",
    secondary: "bg-gradient-to-br from-secondary/10 to-secondary/5",
    tertiary: "bg-gradient-to-br from-accent/10 to-accent/5",
  };

  return (
    <div
      className={cn(
        "rounded-xl p-6 shadow-lg transition-all duration-300 hover:shadow-xl",
        variantStyles[variant],
        className
      )}
    >
      <div className="flex flex-col gap-4">
        {icon && (
          <div className="w-12 h-12 rounded-lg bg-background/50 flex items-center justify-center">
            {icon}
          </div>
        )}
        <h3 className="text-xl font-semibold">{title}</h3>
        <p className="text-muted-foreground">{description}</p>
      </div>
    </div>
  );
};

export default CarouselCard;
