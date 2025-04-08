import React from 'react';

export const BrrrrLogo = () => {
  return (
    <div className="flex items-center gap-2 font-inter">
      <div className="flex items-center">
        {['B', 'R', 'R', 'R', 'Я'].map((letter, index) => (
          <div 
            key={index} 
            className="w-12 h-12 rounded-full border-[3px] border-foreground flex items-center justify-center text-2xl font-semibold tracking-tight"
          >
            {letter}
          </div>
        ))}
        <span className="text-xs font-medium mt-1 ml-0.5">®</span>
      </div>
      <span className="text-3xl font-semibold tracking-tight ml-2">Repeat</span>
    </div>
  );
}; 