import type { Entry, Language } from "@/types/entry";
import EntryCard from "./EntryCard";

interface EntryListProps {
  entries: Entry[];
  language: Language;
}

export default function EntryList({ entries, language }: EntryListProps) {
  if (entries.length === 0) {
    return (
      <div className="text-center py-12 text-gray-500 dark:text-gray-400">
        <p className="text-lg mb-2">エントリが見つかりません</p>
        <p className="text-sm">検索条件を変更してみてください</p>
      </div>
    );
  }

  return (
    <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
      {entries.map((entry) => (
        <EntryCard key={entry.id} entry={entry} language={language} />
      ))}
    </div>
  );
}
