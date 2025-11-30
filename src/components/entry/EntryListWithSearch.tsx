"use client";

import { useState } from "react";
import type { Entry, Language, Difficulty } from "@/types/entry";
import EntryCard from "./EntryCard";
import SearchBar from "@/components/ui/SearchBar";
import { useSearch } from "@/hooks/useSearch";
import { difficultyLabels, difficultyColors } from "@/types/entry";
import Link from "next/link";

interface EntryListWithSearchProps {
  entries: Entry[];
  language: Language;
}

type ViewMode = "grid" | "list";

// Grid Icon
function GridIcon({ className }: { className?: string }) {
  return (
    <svg
      className={className}
      fill="none"
      stroke="currentColor"
      viewBox="0 0 24 24"
      width="20"
      height="20"
    >
      <rect x="3" y="3" width="7" height="7" rx="1" strokeWidth="2" />
      <rect x="14" y="3" width="7" height="7" rx="1" strokeWidth="2" />
      <rect x="3" y="14" width="7" height="7" rx="1" strokeWidth="2" />
      <rect x="14" y="14" width="7" height="7" rx="1" strokeWidth="2" />
    </svg>
  );
}

// List Icon
function ListIcon({ className }: { className?: string }) {
  return (
    <svg
      className={className}
      fill="none"
      stroke="currentColor"
      viewBox="0 0 24 24"
      width="20"
      height="20"
    >
      <line x1="3" y1="6" x2="21" y2="6" strokeWidth="2" strokeLinecap="round" />
      <line x1="3" y1="12" x2="21" y2="12" strokeWidth="2" strokeLinecap="round" />
      <line x1="3" y1="18" x2="21" y2="18" strokeWidth="2" strokeLinecap="round" />
    </svg>
  );
}

// Difficulty Badge
function DifficultyBadge({ difficulty }: { difficulty: Difficulty }) {
  return (
    <span
      className={`px-2 py-0.5 text-xs rounded-full ${difficultyColors[difficulty]}`}
    >
      {difficultyLabels[difficulty]}
    </span>
  );
}

export default function EntryListWithSearch({
  entries,
  language,
}: EntryListWithSearchProps) {
  const { setQuery, filteredEntries, resultCount, query } = useSearch(entries);
  const [viewMode, setViewMode] = useState<ViewMode>("grid");

  return (
    <div>
      {/* Search Bar + View Toggle */}
      <div className="flex flex-col sm:flex-row sm:items-center gap-4 mb-6">
        <div className="flex-1">
          <SearchBar
            placeholder={`${language.name}の関数・構文を検索...`}
            onSearch={setQuery}
            className="max-w-md"
          />
        </div>

        {/* View Mode Toggle */}
        <div className="flex items-center gap-2 border border-gray-200 dark:border-gray-700 rounded-lg p-1">
          <button
            onClick={() => setViewMode("grid")}
            className={`p-1.5 rounded ${
              viewMode === "grid"
                ? "bg-red-100 dark:bg-red-900/30 text-red-600"
                : "text-gray-500 hover:text-gray-700 dark:hover:text-gray-300"
            }`}
            title="グリッド表示"
          >
            <GridIcon />
          </button>
          <button
            onClick={() => setViewMode("list")}
            className={`p-1.5 rounded ${
              viewMode === "list"
                ? "bg-red-100 dark:bg-red-900/30 text-red-600"
                : "text-gray-500 hover:text-gray-700 dark:hover:text-gray-300"
            }`}
            title="リスト表示"
          >
            <ListIcon />
          </button>
        </div>
      </div>

      {/* Result count */}
      {query && (
        <p className="mb-4 text-sm text-gray-500 dark:text-gray-400">
          {resultCount} 件の結果
        </p>
      )}

      {/* Entry List */}
      {filteredEntries.length === 0 ? (
        <div className="text-center py-12 text-gray-500 dark:text-gray-400">
          <p className="text-lg mb-2">エントリが見つかりません</p>
          <p className="text-sm">検索条件を変更してみてください</p>
        </div>
      ) : viewMode === "grid" ? (
        // Grid View
        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
          {filteredEntries.map((entry) => (
            <EntryCard key={entry.id} entry={entry} language={language} />
          ))}
        </div>
      ) : (
        // List View (Table)
        <div className="overflow-x-auto">
          <table className="w-full border-collapse">
            <thead>
              <tr className="border-b border-gray-200 dark:border-gray-700 text-left text-sm text-gray-500 dark:text-gray-400">
                <th className="py-3 px-4 font-medium">用語名</th>
                <th className="py-3 px-4 font-medium hidden sm:table-cell">説明</th>
                <th className="py-3 px-4 font-medium hidden md:table-cell">カテゴリ</th>
                <th className="py-3 px-4 font-medium">難易度</th>
              </tr>
            </thead>
            <tbody>
              {filteredEntries.map((entry) => (
                <tr
                  key={entry.id}
                  className="border-b border-gray-100 dark:border-gray-800 hover:bg-gray-50 dark:hover:bg-gray-900/50 transition-colors"
                >
                  <td className="py-3 px-4">
                    <Link
                      href={`/${language.slug}/${entry.slug}`}
                      className="font-medium text-gray-900 dark:text-gray-100 hover:text-red-600 dark:hover:text-red-500"
                    >
                      {entry.name}
                    </Link>
                    {entry.sarcastic_title && (
                      <p className="text-xs text-gray-500 dark:text-gray-400 mt-0.5">
                        {entry.sarcastic_title}
                      </p>
                    )}
                  </td>
                  <td className="py-3 px-4 text-sm text-gray-600 dark:text-gray-400 hidden sm:table-cell">
                    <span className="line-clamp-2">{entry.short_desc}</span>
                  </td>
                  <td className="py-3 px-4 text-sm text-gray-500 dark:text-gray-400 hidden md:table-cell">
                    {entry.category?.name || "-"}
                  </td>
                  <td className="py-3 px-4">
                    <DifficultyBadge difficulty={entry.difficulty} />
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
}
