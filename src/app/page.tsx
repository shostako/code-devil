import Link from "next/link";
import Header from "@/components/layout/Header";
import Footer from "@/components/layout/Footer";
import GlobalSearch from "@/components/search/GlobalSearch";
import { getLanguagesWithCount } from "@/lib/supabase/queries";

export default async function Home() {
  const languages = await getLanguagesWithCount();
  return (
    <div className="min-h-screen flex flex-col">
      <Header />
      <main className="flex-1">
        {/* Hero Section */}
        <section className="py-20 px-4 text-center bg-gradient-to-b from-red-50 to-white dark:from-gray-900 dark:to-gray-950">
          <h1 className="text-4xl md:text-6xl font-bold mb-4">
            <span className="text-red-600 dark:text-red-500">Code</span>Devil
          </h1>
          <p className="text-xl md:text-2xl text-gray-600 dark:text-gray-400 mb-2">
            悪魔のプログラミング辞典
          </p>
          <p className="text-gray-500 dark:text-gray-500 max-w-2xl mx-auto mb-8">
            公式ドキュメントでは教えてくれない、現場の「あるある」と落とし穴を
            <br className="hidden md:block" />
            皮肉を交えてお届けします。
          </p>
          {/* Global Search */}
          <GlobalSearch />
        </section>

        {/* Language Selection */}
        <section className="py-16 px-4 max-w-5xl mx-auto">
          <h2 className="text-2xl font-bold mb-8 text-center">言語を選択</h2>
          <div className="grid md:grid-cols-2 gap-6">
            {languages.map((lang) => (
              <Link
                key={lang.slug}
                href={`/${lang.slug}`}
                className="block p-6 rounded-lg border border-gray-200 dark:border-gray-800 hover:border-red-500 dark:hover:border-red-500 hover:shadow-lg transition-all group"
              >
                <h3 className="text-2xl font-bold mb-2 group-hover:text-red-600 dark:group-hover:text-red-500">
                  {lang.name}
                </h3>
                <p className="text-gray-600 dark:text-gray-400 mb-4">
                  {lang.description || `${lang.name}のリファレンス`}
                </p>
                <span className="text-sm text-gray-500">
                  {lang.entryCount} エントリ
                </span>
              </Link>
            ))}
          </div>
        </section>
      </main>
      <Footer />
    </div>
  );
}
