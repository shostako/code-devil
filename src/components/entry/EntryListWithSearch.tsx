"use client";

import type { Entry, Language } from "@/types/entry";
import EntryCard from "./EntryCard";
import SearchBar from "@/components/ui/SearchBar";
import { useSearch } from "@/hooks/useSearch";

interface EntryListWithSearchProps {
  entries: Entry[];
  language: Language;
}

export default function EntryListWithSearch({
  entries,
  language,
}: EntryListWithSearchProps) {
  const { setQuery, filteredEntries, resultCount, query } = useSearch(entries);

  return (
    <div>
      {/* Search Bar */}
      <div className="mb-6">
        <SearchBar
          placeholder={`${language.name}の関数・構文を検索...`}
          onSearch={setQuery}
          className="max-w-md"
        />
        {query && (
          <p className="mt-2 text-sm text-gray-500 dark:text-gray-400">
            {resultCount} 件の結果
          </p>
        )}
      </div>

      {/* Entry List */}
      {filteredEntries.length === 0 ? (
        <div className="text-center py-12 text-gray-500 dark:text-gray-400">
          <p className="text-lg mb-2">エントリが見つかりません</p>
          <p className="text-sm">検索条件を変更してみてください</p>
        </div>
      ) : (
        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
          {filteredEntries.map((entry) => (
            <EntryCard key={entry.id} entry={entry} language={language} />
          ))}
        </div>
      )}
    </div>
  );
}
