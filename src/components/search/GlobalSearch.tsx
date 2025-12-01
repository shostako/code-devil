"use client";

import { useState, useMemo, useCallback, useEffect } from "react";
import Link from "next/link";
import SearchBar from "@/components/ui/SearchBar";
import { createClient } from "@/lib/supabase/client";
import type { Entry, Language } from "@/types/entry";

interface SearchResult extends Entry {
  languageName: string;
  languageSlug: string;
}

export default function GlobalSearch() {
  const [query, setQuery] = useState("");
  const [allEntries, setAllEntries] = useState<Entry[]>([]);
  const [languages, setLanguages] = useState<Language[]>([]);
  const [isLoading, setIsLoading] = useState(true);

  // データ取得
  useEffect(() => {
    async function fetchData() {
      try {
        const supabase = createClient();

        // エントリと言語を並行取得
        const [entriesRes, languagesRes] = await Promise.all([
          supabase
            .from("entries")
            .select("*")
            .eq("is_published", true)
            .order("name"),
          supabase
            .from("languages")
            .select("*")
            .order("name"),
        ]);

        if (entriesRes.error) {
          console.error("Failed to fetch entries:", entriesRes.error);
        } else {
          setAllEntries(entriesRes.data as unknown as Entry[]);
        }

        if (languagesRes.error) {
          console.error("Failed to fetch languages:", languagesRes.error);
        } else {
          setLanguages(languagesRes.data as unknown as Language[]);
        }
      } catch (error) {
        console.error("Failed to fetch data:", error);
      } finally {
        setIsLoading(false);
      }
    }
    fetchData();
  }, []);

  // 言語情報を取得
  const getLanguageInfo = useCallback(
    (languageId: string): { name: string; slug: string } => {
      const lang = languages.find((l) => l.id === languageId);
      return {
        name: lang?.name || "Unknown",
        slug: lang?.slug || "",
      };
    },
    [languages]
  );

  const searchResults = useMemo((): SearchResult[] => {
    if (!query.trim() || allEntries.length === 0) {
      return [];
    }

    const lowerQuery = query.toLowerCase();

    return allEntries
      .filter((entry) => {
        if (entry.name.toLowerCase().includes(lowerQuery)) return true;
        if (entry.sarcastic_title?.toLowerCase().includes(lowerQuery)) return true;
        if (entry.short_desc.toLowerCase().includes(lowerQuery)) return true;
        if (entry.tags?.some((tag) => tag.name.toLowerCase().includes(lowerQuery))) return true;
        return false;
      })
      .map((entry) => {
        const langInfo = getLanguageInfo(entry.language_id);
        return {
          ...entry,
          languageName: langInfo.name,
          languageSlug: langInfo.slug,
        };
      })
      .slice(0, 10); // 最大10件表示
  }, [allEntries, query, getLanguageInfo]);

  const handleSearch = useCallback((newQuery: string) => {
    setQuery(newQuery);
  }, []);

  return (
    <div className="w-full max-w-2xl mx-auto">
      <SearchBar
        placeholder="全言語から検索..."
        onSearch={handleSearch}
        className="w-full"
      />

      {/* Search Results */}
      {query && (
        <div className="mt-4 bg-white dark:bg-gray-800 rounded-lg border border-gray-200 dark:border-gray-700 shadow-lg">
          {isLoading ? (
            <div className="p-4 text-center text-gray-500 dark:text-gray-400">
              読み込み中...
            </div>
          ) : searchResults.length === 0 ? (
            <div className="p-4 text-center text-gray-500 dark:text-gray-400">
              「{query}」に一致する結果が見つかりません
            </div>
          ) : (
            <ul className="divide-y divide-gray-200 dark:divide-gray-700">
              {searchResults.map((result) => (
                <li key={result.id}>
                  <Link
                    href={`/${result.languageSlug}/${result.slug}`}
                    className="block p-4 hover:bg-gray-50 dark:hover:bg-gray-700 transition-colors"
                  >
                    <div className="flex items-center gap-2 mb-1">
                      <span className="text-xs px-2 py-0.5 bg-gray-100 dark:bg-gray-600 rounded text-gray-600 dark:text-gray-300">
                        {result.languageName}
                      </span>
                      <span className="font-semibold text-gray-900 dark:text-gray-100">
                        {result.name}
                      </span>
                    </div>
                    <p className="text-sm text-red-600 dark:text-red-400 italic">
                      {result.sarcastic_title}
                    </p>
                  </Link>
                </li>
              ))}
            </ul>
          )}
          {searchResults.length > 0 && (
            <div className="p-3 text-center text-sm text-gray-500 dark:text-gray-400 border-t border-gray-200 dark:border-gray-700">
              {searchResults.length} 件の結果
            </div>
          )}
        </div>
      )}
    </div>
  );
}
