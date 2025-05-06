"use client"
import React from 'react';
import { ThemeToggle } from './theme-toggle';

export function ThemeHeader() {
  return (
    <div className="fixed top-4 right-4 z-50">
      <ThemeToggle />
    </div>
  );
} 