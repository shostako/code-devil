import Link from "next/link";
import type { Entry, Language } from "@/types/entry";
import { difficultyLabels, difficultyColors, entryTypeLabels } from "@/types/entry";

interface EntryCardProps {
  entry: Entry;
  language: Language;
}

export default function EntryCard({ entry, language }: EntryCardProps) {
  return (
    <Link
      href={`/${language.slug}/${entry.slug}`}
      className="block p-5 rounded-lg border border-gray-200 dark:border-gray-800 hover:border-red-500 dark:hover:border-red-500 hover:shadow-lg transition-all group"
    >
      <div className="flex items-start justify-between mb-2">
        <h3 className="text-lg font-bold font-mono group-hover:text-red-600 dark:group-hover:text-red-500">
          {entry.name}
        </h3>
        <span
          className={`text-xs px-2 py-0.5 rounded ${difficultyColors[entry.difficulty]}`}
        >
          {difficultyLabels[entry.difficulty]}
        </span>
      </div>

      {entry.sarcastic_title && (
        <p className="text-sm text-red-600 dark:text-red-400 mb-2 italic">
          「{entry.sarcastic_title}」
        </p>
      )}

      <p className="text-gray-600 dark:text-gray-400 text-sm mb-3 line-clamp-2">
        {entry.short_desc}
      </p>

      <div className="flex items-center gap-2 text-xs text-gray-500">
        <span className="px-2 py-0.5 bg-gray-100 dark:bg-gray-800 rounded">
          {entryTypeLabels[entry.entry_type]}
        </span>
      </div>
    </Link>
  );
}
