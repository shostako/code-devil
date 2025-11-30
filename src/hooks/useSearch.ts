import { useState, useMemo, useCallback } from "react";
import type { Entry } from "@/types/entry";

interface UseSearchResult {
  query: string;
  setQuery: (query: string) => void;
  filteredEntries: Entry[];
  resultCount: number;
}

export function useSearch(entries: Entry[]): UseSearchResult {
  const [query, setQuery] = useState("");

  const filteredEntries = useMemo(() => {
    if (!query.trim()) {
      return entries;
    }

    const lowerQuery = query.toLowerCase();

    return entries.filter((entry) => {
      // 名前で検索
      if (entry.name.toLowerCase().includes(lowerQuery)) {
        return true;
      }
      // 皮肉タイトルで検索
      if (entry.sarcastic_title?.toLowerCase().includes(lowerQuery)) {
        return true;
      }
      // 短い説明で検索
      if (entry.short_desc.toLowerCase().includes(lowerQuery)) {
        return true;
      }
      // タグで検索（Tag型の配列）
      if (entry.tags?.some((tag) => tag.name.toLowerCase().includes(lowerQuery))) {
        return true;
      }
      // カテゴリで検索（Category型）
      if (entry.category?.name.toLowerCase().includes(lowerQuery)) {
        return true;
      }
      return false;
    });
  }, [entries, query]);

  const handleSetQuery = useCallback((newQuery: string) => {
    setQuery(newQuery);
  }, []);

  return {
    query,
    setQuery: handleSetQuery,
    filteredEntries,
    resultCount: filteredEntries.length,
  };
}
