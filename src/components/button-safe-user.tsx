import React from 'react';
import { UserButton } from '@clerk/nextjs';
import { useEffect } from 'react';

export function SafeUserButton() {
  useEffect(() => {
    // Suppress clipboard errors
    const originalError = console.error;
    console.error = (...args) => {
      if (args[0]?.includes?.('Copy to clipboard is not supported')) {
        return;
      }
      originalError.apply(console, args);
    };

    return () => {
      console.error = originalError;
    };
  }, []);

  return <UserButton afterSignOutUrl="/" aria-label="User account menu" />;
} 