import React from 'react';
import { ClerkProvider } from '@clerk/nextjs'
import './globals.css'
import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import { ThemeProvider } from "../components/theme/theme-provider.tsx"
import { ThemeHeader } from "../components/theme/ThemeHeader.tsx"
import { AuthRedirect } from "../components/auth-redirect.tsx"

const inter = Inter({ subsets: ['latin'] })

export const metadata: Metadata = {
  title: 'BRRRR',
  description: 'BRRRR - Your Real Estate Investment Platform',
}

// Create input type handler script as a string
const inputTypeHandlerScript = `
  (function() {
    if (typeof window !== 'undefined') {
      // Handle input type detection on client only
      function setupInputType() {
        // Wait until body is available
        if (!document.body) {
          setTimeout(setupInputType, 5);
          return;
        }
        
        // Remove any data-input-type to prevent hydration mismatch
        document.body.removeAttribute('data-input-type');
        
        // Set default after hydration
        setTimeout(() => {
          document.body.setAttribute('data-input-type', 'mouse');
          
          function handleTouchStart() {
            document.body.setAttribute('data-input-type', 'touch');
          }
          
          function handleMouseMove() {
            document.body.setAttribute('data-input-type', 'mouse');
          }
          
          window.addEventListener('touchstart', handleTouchStart, { passive: true });
          window.addEventListener('mousemove', handleMouseMove, { passive: true });
        }, 0);
      }
      
      // Call setup function
      setupInputType();
    }
  })();
`;

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <ClerkProvider>
      <html lang="en" suppressHydrationWarning>
        <head>
          {/* Add inline script to handle input type detection after hydration */}
          <script 
            dangerouslySetInnerHTML={{
              __html: inputTypeHandlerScript
            }}
          />
        </head>
        <body className={inter.className} suppressHydrationWarning>
          <ThemeProvider
            attribute="class"
            defaultTheme="system"
            enableSystem
            disableTransitionOnChange
          >
            <AuthRedirect>
              <div className="relative flex min-h-screen flex-col">
                <ThemeHeader />
                <main className="flex-1">{children}</main>
              </div>
            </AuthRedirect>
          </ThemeProvider>
        </body>
      </html>
    </ClerkProvider>
  )
}
