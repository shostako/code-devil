"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { useEffect, useState } from "react";
import { useMobileMenu } from "./MobileMenuProvider";

interface Language {
  slug: string;
  name: string;
}

export default function Sidebar() {
  const pathname = usePathname();
  const [languages, setLanguages] = useState<Language[]>([]);
  const { isOpen, close } = useMobileMenu();

  useEffect(() => {
    fetch("/api/languages")
      .then((res) => res.json())
      .then((data) => setLanguages(data))
      .catch(() => {
        setLanguages([
          { slug: "python", name: "Python" },
          { slug: "javascript", name: "JavaScript" },
          { slug: "bash", name: "Bash" },
        ]);
      });
  }, []);

  // ページ遷移時にメニューを閉じる
  useEffect(() => {
    close();
  }, [pathname, close]);

  const isActive = (slug: string) => pathname.startsWith(`/${slug}`);

  const navContent = (
    <nav className="p-4">
      <h2 className="text-xs font-semibold text-gray-500 dark:text-gray-400 uppercase tracking-wider mb-3">
        Languages
      </h2>
      <ul className="space-y-1">
        {languages.map((lang) => (
          <li key={lang.slug}>
            <Link
              href={`/${lang.slug}`}
              className={`block px-3 py-2 rounded-lg text-sm transition-colors ${
                isActive(lang.slug)
                  ? "bg-red-100 dark:bg-red-900/30 text-red-600 dark:text-red-500 font-medium"
                  : "text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-800"
              }`}
            >
              {lang.name}
            </Link>
          </li>
        ))}
      </ul>
    </nav>
  );

  return (
    <>
      {/* Desktop Sidebar */}
      <aside className="hidden md:block w-48 shrink-0 border-r border-gray-200 dark:border-gray-800 bg-gray-50 dark:bg-gray-900/50">
        <div className="sticky top-16">{navContent}</div>
      </aside>

      {/* Mobile Overlay */}
      {isOpen && (
        <div
          className="md:hidden fixed inset-0 z-40 bg-black/50"
          onClick={close}
        />
      )}

      {/* Mobile Sidebar */}
      <aside
        className={`md:hidden fixed top-16 left-0 z-50 h-[calc(100vh-4rem)] w-64 bg-white dark:bg-gray-900 border-r border-gray-200 dark:border-gray-800 transform transition-transform duration-300 ease-in-out ${
          isOpen ? "translate-x-0" : "-translate-x-full"
        }`}
      >
        {navContent}
      </aside>
    </>
  );
}
