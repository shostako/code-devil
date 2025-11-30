import { notFound } from "next/navigation";
import Link from "next/link";
import Header from "@/components/layout/Header";
import Footer from "@/components/layout/Footer";
import Sidebar from "@/components/layout/Sidebar";
import EntryDetail from "@/components/entry/EntryDetail";
import { getEntryBySlug, getLanguageBySlug } from "@/lib/data";

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

  return (
    <div className="min-h-screen flex flex-col">
      <Header />
      <div className="flex-1 flex">
        {/* Left Sidebar */}
        <Sidebar />

        {/* Main Content */}
        <main className="flex-1 px-6 py-8 overflow-auto">
          {/* Breadcrumb */}
          <nav className="text-sm text-gray-500 mb-6">
            <Link href="/" className="hover:text-red-600">
              ホーム
            </Link>
            <span className="mx-2">/</span>
            <Link href={`/${lang}`} className="hover:text-red-600">
              {language.name}
            </Link>
            <span className="mx-2">/</span>
            <span className="text-gray-900 dark:text-gray-100">{entry.name}</span>
          </nav>

          {/* Entry Detail */}
          <EntryDetail entry={entry} languageSlug={lang} />

          {/* Back Link */}
          <div className="mt-12 pt-8 border-t border-gray-200 dark:border-gray-800">
            <Link
              href={`/${lang}`}
              className="text-red-600 dark:text-red-500 hover:underline"
            >
              ← {language.name}の一覧に戻る
            </Link>
          </div>
        </main>
      </div>
      <Footer />
    </div>
  );
}
