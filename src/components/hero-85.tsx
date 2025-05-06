"use client";

import { useEffect, useRef } from "react";
import EmblaCarousel from "embla-carousel";
import AutoScroll from "embla-carousel-auto-scroll";
import { SignInButton, SignUpButton } from "@/components/auth/clerk-components";
import React from "react";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Card1, Card2, Card3, Card4 } from "./carousel-cards/CarouselCardSet1";
import { Card5, Card6, Card7, Card8 } from "./carousel-cards/CarouselCardSet2";

const Hero85 = () => {
  // Create refs for all carousels
  const horizontalCarousel1Ref = useRef(null);
  const horizontalCarousel2Ref = useRef(null);
  const verticalCarousel1Ref = useRef(null);
  const verticalCarousel2Ref = useRef(null);

  // Initialize carousels after component mounts
  useEffect(() => {
    // Create auto-scroll plugins
    const autoScroll1 = AutoScroll({ speed: 1.25 });
    const autoScroll2 = AutoScroll({ speed: 1.25, direction: "backward" });
    const autoScroll3 = AutoScroll({ speed: 1.25 });
    const autoScroll4 = AutoScroll({ speed: 1.25, direction: "backward" });

    // Initialize horizontal carousels with plugins
    const horizontalCarousel1 = horizontalCarousel1Ref.current
      ? EmblaCarousel(
          horizontalCarousel1Ref.current,
          { loop: true, dragFree: true },
          [autoScroll1] // Pass plugin as third argument
        )
      : null;
    const horizontalCarousel2 = horizontalCarousel2Ref.current
      ? EmblaCarousel(
          horizontalCarousel2Ref.current,
          { loop: true, dragFree: true },
          [autoScroll2] // Pass plugin as third argument
        )
      : null;

    // Initialize vertical carousels with plugins
    const verticalCarousel1 = verticalCarousel1Ref.current
      ? EmblaCarousel(
          verticalCarousel1Ref.current,
          { loop: true, dragFree: true, axis: "y" },
          [autoScroll3] // Pass plugin as third argument
        )
      : null;
    const verticalCarousel2 = verticalCarousel2Ref.current
      ? EmblaCarousel(
          verticalCarousel2Ref.current,
          { loop: true, dragFree: true, axis: "y" },
          [autoScroll4] // Pass plugin as third argument
        )
      : null;

    // Clean up on unmount
    return () => {
      if (horizontalCarousel1) horizontalCarousel1.destroy();
      if (horizontalCarousel2) horizontalCarousel2.destroy();
      if (verticalCarousel1) verticalCarousel1.destroy();
      if (verticalCarousel2) verticalCarousel2.destroy();
    };
  }, []);

  return (
    <section className="py-32">
      <div className="container">
        <div className="grid items-center gap-16 lg:grid-cols-2">
          <div className="mx-auto">
            <div className="flex w-fit items-center gap-2 rounded-full border px-2.5 py-1.5 text-xs font-normal">
              <Badge>Open Source</Badge>
              Enterprise Grade
            </div>
            <h1 className="mt-10 mb-4 text-2xl lg:text-4xl font-medium tracking-tight">
              The Modern Framework for
              <br />
              <span className="mt-10 mb-4 text-2xl lg:text-4xl font-medium tracking-tight">
                Business Purpose Lending
                <br />
                at Scale
              </span>
            </h1>
            <p className="mx-auto text-muted-foreground lg:text-lg">
              Composable. Scalable. Production-ready.
            </p>
            <div className="mt-10 flex flex-col gap-2 sm:flex-row">
              <SignInButton mode="modal">
                <Button size="lg" className="px-5 text-base">
                  <span className="text-nowrap">Sign In</span>
                </Button>
              </SignInButton>
              <SignUpButton mode="modal">
                <Button size="lg" variant="ghost" className="px-5 text-base">
                  <span className="text-nowrap">Sign Up</span>
                </Button>
              </SignUpButton>
            </div>
          </div>

          {/* Mobile carousels */}
          <div className="flex flex-col gap-8 lg:hidden">
            {/* First horizontal carousel */}
            <div className="embla overflow-hidden" ref={horizontalCarousel1Ref}>
              <div className="embla__container flex">
                <div className="embla__slide flex-shrink-0 min-w-[85%] px-2">
                  <div className="w-full h-full flex items-center justify-center">
                    <Card1 />
                  </div>
                </div>
                <div className="embla__slide flex-shrink-0 min-w-[85%] px-2">
                  <div className="w-full h-full flex items-center justify-center">
                    <Card2 />
                  </div>
                </div>
                <div className="embla__slide flex-shrink-0 min-w-[85%] px-2">
                  <div className="w-full h-full flex items-center justify-center">
                    <Card3 />
                  </div>
                </div>
                <div className="embla__slide flex-shrink-0 min-w-[85%] px-2">
                  <div className="w-full h-full flex items-center justify-center">
                    <Card4 />
                  </div>
                </div>
              </div>
            </div>

            {/* Second horizontal carousel */}
            <div className="embla overflow-hidden" ref={horizontalCarousel2Ref}>
              <div className="embla__container flex">
                <div className="embla__slide flex-shrink-0 min-w-[85%] px-2">
                  <div className="w-full h-full flex items-center justify-center">
                    <Card5 />
                  </div>
                </div>
                <div className="embla__slide flex-shrink-0 min-w-[85%] px-2">
                  <div className="w-full h-full flex items-center justify-center">
                    <Card6 />
                  </div>
                </div>
                <div className="embla__slide flex-shrink-0 min-w-[85%] px-2">
                  <div className="w-full h-full flex items-center justify-center">
                    <Card7 />
                  </div>
                </div>
                <div className="embla__slide flex-shrink-0 min-w-[85%] px-2">
                  <div className="w-full h-full flex items-center justify-center">
                    <Card8 />
                  </div>
                </div>
              </div>
            </div>
          </div>

          {/* Desktop vertical carousels */}
          <div className="hidden grid-cols-2 gap-8 lg:grid relative">
            {/* Top gradient overlay */}
            <div className="absolute top-0 left-0 right-0 h-16 bg-gradient-to-b from-background to-transparent z-10"></div>

            {/* Bottom gradient overlay */}
            <div className="absolute bottom-0 left-0 right-0 h-16 bg-gradient-to-t from-background to-transparent z-10"></div>

            {/* First vertical carousel */}
            <div
              className="embla embla-vertical overflow-hidden h-[600px]"
              ref={verticalCarousel1Ref}
            >
              <div className="embla__container flex flex-col h-full">
                <div className="embla__slide flex-shrink-0 min-h-[300px] py-4">
                  <div className="w-full h-full flex items-center justify-center">
                    <Card1 />
                  </div>
                </div>
                <div className="embla__slide flex-shrink-0 min-h-[300px] py-4">
                  <div className="w-full h-full flex items-center justify-center">
                    <Card2 />
                  </div>
                </div>
                <div className="embla__slide flex-shrink-0 min-h-[300px] py-4">
                  <div className="w-full h-full flex items-center justify-center">
                    <Card3 />
                  </div>
                </div>
                <div className="embla__slide flex-shrink-0 min-h-[300px] py-4">
                  <div className="w-full h-full flex items-center justify-center">
                    <Card4 />
                  </div>
                </div>
              </div>
            </div>

            {/* Second vertical carousel */}
            <div
              className="embla embla-vertical overflow-hidden h-[600px]"
              ref={verticalCarousel2Ref}
            >
              <div className="embla__container flex flex-col h-full">
                <div className="embla__slide flex-shrink-0 min-h-[300px] py-4">
                  <div className="w-full h-full flex items-center justify-center">
                    <Card5 />
                  </div>
                </div>
                <div className="embla__slide flex-shrink-0 min-h-[300px] py-4">
                  <div className="w-full h-full flex items-center justify-center">
                    <Card6 />
                  </div>
                </div>
                <div className="embla__slide flex-shrink-0 min-h-[300px] py-4">
                  <div className="w-full h-full flex items-center justify-center">
                    <Card7 />
                  </div>
                </div>
                <div className="embla__slide flex-shrink-0 min-h-[300px] py-4">
                  <div className="w-full h-full flex items-center justify-center">
                    <Card8 />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

// Change from named export to default export
export default Hero85;
