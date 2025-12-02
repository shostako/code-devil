import { notFound } from "next/navigation";
import Link from "next/link";
import Header from "@/components/layout/Header";
import Footer from "@/components/layout/Footer";
import Sidebar from "@/components/layout/Sidebar";
import { MobileMenuProvider } from "@/components/layout/MobileMenuProvider";
import EntryListWithSearch from "@/components/entry/EntryListWithSearch";
import { getEntriesByLanguage, getLanguageBySlug } from "@/lib/data";

interface Props {
  params: Promise<{ lang: string }>;
}

export async function generateMetadata({ params }: Props) {
  const { lang } = await params;
  const language = await getLanguageBySlug(lang);
  if (!language) return { title: "Not Found" };

  return {
    title: `${language.name} - CodeDevil`,
    description: `${language.name}の関数・構文を皮肉交じりに解説`,
  };
}

export default async function LanguagePage({ params }: Props) {
  const { lang } = await params;
  const language = await getLanguageBySlug(lang);

  if (!language) {
    notFound();
  }

  const entries = await getEntriesByLanguage(lang);

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
            <nav className="text-sm text-gray-500 mb-4 md:mb-6">
              <Link href="/" className="hover:text-red-600">
                ホーム
              </Link>
              <span className="mx-2">/</span>
              <span className="text-gray-900 dark:text-gray-100">{language.name}</span>
            </nav>

            {/* Header */}
            <div className="mb-6 md:mb-8">
              <h1 className="text-2xl md:text-3xl font-bold mb-2">{language.name}</h1>
              <p className="text-gray-600 dark:text-gray-400">
                {entries.length} エントリ
              </p>
            </div>

            {/* Entry List with Search */}
            <EntryListWithSearch entries={entries} language={language} />
          </main>
        </div>
        <Footer />
      </div>
    </MobileMenuProvider>
  );
}
