import React from 'react'
import { SignInButton, SignUpButton } from "@clerk/nextjs"
import { Button } from './ui/button'
import { InfiniteSlider } from './ui/infinite-slider'
import { ProgressiveBlur } from './ui/progressive-blur'

export default function HeroSection() {
    return (
        <>
            <main className="flex min-h-screen flex-col">
                <section className="flex-1">
                    <div className="relative mx-auto flex max-w-6xl flex-col px-6 py-12 lg:block lg:py-44">
                        <div className="mx-auto max-w-lg text-center lg:ml-0 lg:w-1/2 lg:text-left">
                            <h1 className="mt-8 max-w-2xl text-balance text-5xl font-medium md:text-6xl lg:mt-16 xl:text-7xl">Ship 10x Faster with NS</h1>
                            <p className="mt-8 max-w-2xl text-pretty text-lg">Open source, enterprise grade infrastructure for business purpose lending at scale.</p>

                            <div className="mt-12 flex flex-col items-center justify-center gap-2 sm:flex-row lg:justify-start">
                                <SignInButton mode="modal">
                                    <Button
                                        size="lg"
                                        className="px-5 text-base">
                                        <span className="text-nowrap">Sign In</span>
                                    </Button>
                                </SignInButton>
                                <SignUpButton mode="modal">
                                    <Button
                                        size="lg"
                                        variant="ghost"
                                        className="px-5 text-base">
                                        <span className="text-nowrap">Sign Up</span>
                                    </Button>
                                </SignUpButton>
                            </div>
                        </div>
                        <img
                            className="-z-10 order-first ml-auto h-56 w-full object-cover invert sm:h-96 lg:absolute lg:inset-0 lg:-right-20 lg:-top-96 lg:order-last lg:h-max lg:w-2/3 lg:object-contain dark:mix-blend-lighten dark:invert-0"
                            src="https://res.cloudinary.com/dg4jhba5c/image/upload/v1741605150/abstract-bg_wq4f8w.jpg"
                            alt="Abstract Object"
                            height={4000}
                            width={3000}
                        />
                    </div>
                </section>
                <section className="w-full bg-background pb-16 md:pb-32">
                    <div className="group relative m-auto max-w-6xl px-6">
                        <div className="flex flex-col items-center md:flex-row">
                            <div className="md:max-w-44 md:border-r md:pr-6">
                                <p className="text-end text-sm">Powering the best teams</p>
                            </div>
                            <div className="relative py-6 md:w-[calc(100%-11rem)]">
                                <InfiniteSlider
                                    speedOnHover={20}
                                    speed={40}
                                    gap={112}>
                                    <div className="flex">
                                        <img
                                            src="/logos/neon-logo-wordmark-green-black-lightmode.svg"
                                            alt="Neon"
                                            className="h-6 dark:hidden"
                                        />
                                        <img
                                            src="/logos/neon-logo-wordmark-green-white-darkmode.svg"
                                            alt="Neon"
                                            className="hidden h-6 dark:block"
                                        />
                                    </div>
                                    <div className="flex">
                                        <img
                                            src="/logos/nextjs-logo-wordmark-lightmode.svg"
                                            alt="Next.js"
                                            className="h-6 dark:hidden"
                                        />
                                        <img
                                            src="/logos/nextjs-logo-wordmark-darkmode.svg"
                                            alt="Next.js"
                                            className="hidden h-6 dark:block"
                                        />
                                    </div>
                                    <div className="flex">
                                        <img
                                            src="/logos/react-logo-wordmark-blue-black-lightmode.svg"
                                            alt="React"
                                            className="h-6 dark:hidden"
                                        />
                                        <img
                                            src="/logos/react-logo-wordmark-blue-white-darkmode.svg"
                                            alt="React"
                                            className="hidden h-6 dark:block"
                                        />
                                    </div>
                                    <div className="flex">
                                        <img
                                            src="/logos/supabase-logo-wordmark-lightmode.svg"
                                            alt="Supabase"
                                            className="h-6 dark:hidden"
                                        />
                                        <img
                                            src="/logos/supabase-logo-wordmark-darkmode.svg"
                                            alt="Supabase"
                                            className="hidden h-6 dark:block"
                                        />
                                    </div>
                                    <div className="flex">
                                        <img
                                            src="/logos/typescript-logo-wordmark-fill-white.svg"
                                            alt="TypeScript"
                                            className="h-6 dark:hidden"
                                        />
                                        <img
                                            src="/logos/typescript-logo-wordmark-fill-blue.svg"
                                            alt="TypeScript"
                                            className="hidden h-6 dark:block"
                                        />
                                    </div>
                                    <div className="flex">
                                        <img
                                            src="/logos/vercel-logo-wordmark-white.svg"
                                            alt="Vercel"
                                            className="h-6 dark:hidden"
                                        />
                                        <img
                                            src="/logos/vercel-logo-wordmark-black.svg"
                                            alt="Vercel"
                                            className="hidden h-6 dark:block"
                                        />
                                    </div>
                                </InfiniteSlider>

                                <div className="bg-linear-to-r from-background absolute inset-y-0 left-0 w-20"></div>
                                <div className="bg-linear-to-l from-background absolute inset-y-0 right-0 w-20"></div>
                                <ProgressiveBlur
                                    className="pointer-events-none absolute left-0 top-0 h-full w-20"
                                    direction="left"
                                    blurIntensity={1}
                                />
                                <ProgressiveBlur
                                    className="pointer-events-none absolute right-0 top-0 h-full w-20"
                                    direction="right"
                                    blurIntensity={1}
                                />
                            </div>
                        </div>
                    </div>
                </section>
            </main>
        </>
    )
} 