import { notFound } from "next/navigation";
import Link from "next/link";
import Header from "@/components/layout/Header";
import Footer from "@/components/layout/Footer";
import Sidebar from "@/components/layout/Sidebar";
import { MobileMenuProvider } from "@/components/layout/MobileMenuProvider";
import EntryDetail from "@/components/entry/EntryDetail";
import { getEntryBySlug, getLanguageBySlug, getEntriesByLanguage } from "@/lib/data";

interface Props {
  params: Promise<{ lang: string; slug: string }>;
}

export async function generateMetadata({ params }: Props) {
  const { lang, slug } = await params;
  const entry = await getEntryBySlug(lang, slug);
  if (!entry) return { title: "Not Found" };

  const language = await getLanguageBySlug(lang);

  return {
    title: `${entry.name} - ${language?.name || lang} - CodeDevil`,
    description: entry.short_desc,
  };
}

export default async function EntryPage({ params }: Props) {
  const { lang, slug } = await params;
  const entry = await getEntryBySlug(lang, slug);
  const language = await getLanguageBySlug(lang);

  if (!entry || !language) {
    notFound();
  }

  // 前後のエントリを取得
  const allEntries = await getEntriesByLanguage(lang);
  const currentIndex = allEntries.findIndex((e) => e.slug === slug);
  const prevEntry = allEntries[(currentIndex - 1 + allEntries.length) % allEntries.length];
  const nextEntry = allEntries[(currentIndex + 1) % allEntries.length];

  return (
    <MobileMenuProvider>
      <div className="min-h-screen flex flex-col">
        <Header />
        <div className="flex-1 flex">
          {/* Left Sidebar */}
          <Sidebar />

          {/* Main Content */}
          <main className="flex-1 px-4 md:px-6 py-6 md:py-8 overflow-auto">
            {/* Breadcrumb */}
            <nav className="text-sm text-gray-500 mb-4 md:mb-6 flex flex-wrap items-center">
              <Link href="/" className="hover:text-red-600">
                ホーム
              </Link>
              <span className="mx-2">/</span>
              <Link href={`/${lang}`} className="hover:text-red-600">
                {language.name}
              </Link>
              <span className="mx-2">/</span>
              <span className="text-gray-900 dark:text-gray-100 break-all">{entry.name}</span>
            </nav>

            {/* Entry Detail */}
            <EntryDetail entry={entry} languageSlug={lang} />

            {/* Navigation */}
            <div className="mt-8 md:mt-12 pt-6 md:pt-8 border-t border-gray-200 dark:border-gray-800">
              {/* Mobile: Stack layout */}
              <div className="flex flex-col gap-4 md:hidden">
                <div className="flex justify-between">
                  <Link
                    href={`/${lang}/${prevEntry.slug}`}
                    className="text-red-600 dark:text-red-500 hover:underline text-sm truncate max-w-[45%]"
                  >
                    ← {prevEntry.name}
                  </Link>
                  <Link
                    href={`/${lang}/${nextEntry.slug}`}
                    className="text-red-600 dark:text-red-500 hover:underline text-sm truncate max-w-[45%] text-right"
                  >
                    {nextEntry.name} →
                  </Link>
                </div>
                <Link
                  href={`/${lang}`}
                  className="text-center text-gray-600 dark:text-gray-400 hover:text-red-600 dark:hover:text-red-500"
                >
                  {language.name}の一覧
                </Link>
              </div>

              {/* Desktop: Row layout */}
              <div className="hidden md:flex items-center justify-between">
                <Link
                  href={`/${lang}/${prevEntry.slug}`}
                  className="text-red-600 dark:text-red-500 hover:underline"
                >
                  ← {prevEntry.name}
                </Link>
                <Link
                  href={`/${lang}`}
                  className="text-gray-600 dark:text-gray-400 hover:text-red-600 dark:hover:text-red-500"
                >
                  {language.name}の一覧
                </Link>
                <Link
                  href={`/${lang}/${nextEntry.slug}`}
                  className="text-red-600 dark:text-red-500 hover:underline"
                >
                  {nextEntry.name} →
                </Link>
              </div>
            </div>
          </main>
        </div>
        <Footer />
      </div>
    </MobileMenuProvider>
  );
}
