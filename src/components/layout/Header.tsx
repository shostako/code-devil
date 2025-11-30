"use client";

import Link from "next/link";
import { useTheme } from "next-themes";
import { useEffect, useState } from "react";

export default function Header() {
  const { theme, setTheme } = useTheme();
  const [mounted, setMounted] = useState(false);

  useEffect(() => {
    setMounted(true);
  }, []);

  const cycleTheme = () => {
    if (theme === "light") setTheme("dark");
    else if (theme === "dark") setTheme("system");
    else setTheme("light");
  };

  const getThemeIcon = () => {
    if (!mounted) return "...";
    if (theme === "light") return "☀️";
    if (theme === "dark") return "🌙";
    return "💻";
  };

  const getThemeLabel = () => {
    if (!mounted) return "";
    if (theme === "light") return "ライト";
    if (theme === "dark") return "ダーク";
    return "システム";
  };

  return (
    <header className="sticky top-0 z-50 border-b border-gray-200 dark:border-gray-800 bg-white/80 dark:bg-gray-950/80 backdrop-blur-sm">
      <div className="px-4 h-16 flex items-center justify-between">
        {/* Left: Logo */}
        <Link href="/" className="flex items-center gap-2">
          <span className="text-2xl font-bold">
            <span className="text-red-600 dark:text-red-500">Code</span>Devil
          </span>
        </Link>

        {/* Right: Theme Toggle */}
        <div className="flex items-center gap-4">
          <button
            onClick={cycleTheme}
            className="flex items-center gap-1 px-3 py-1.5 rounded-lg border border-gray-200 dark:border-gray-700 hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors"
            title={`現在: ${getThemeLabel()}`}
          >
            <span>{getThemeIcon()}</span>
            <span className="text-sm hidden sm:inline">{getThemeLabel()}</span>
          </button>
        </div>
      </div>
    </header>
  );
}
