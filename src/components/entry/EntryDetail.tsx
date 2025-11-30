import type { Entry } from "@/types/entry";
import { difficultyLabels, difficultyColors, entryTypeLabels } from "@/types/entry";
import CodeBlock from "./CodeBlock";
import SarcasticNotes from "./SarcasticNotes";
import AngelNotes from "./AngelNotes";

interface EntryDetailProps {
  entry: Entry;
  languageSlug: string;
}

export default function EntryDetail({ entry, languageSlug }: EntryDetailProps) {
  const codeLanguage = languageSlug === "python" ? "python" : "javascript";

  return (
    <article className="max-w-4xl">
      {/* Header */}
      <div className="mb-8">
        <div className="flex items-center gap-3 mb-2">
          <span
            className={`text-xs px-2 py-0.5 rounded ${difficultyColors[entry.difficulty]}`}
          >
            {difficultyLabels[entry.difficulty]}
          </span>
          <span className="text-xs px-2 py-0.5 bg-gray-100 dark:bg-gray-800 rounded">
            {entryTypeLabels[entry.entry_type]}
          </span>
        </div>

        <h1 className="text-3xl md:text-4xl font-bold font-mono mb-2">
          {entry.name}
        </h1>

        {entry.sarcastic_title && (
          <p className="text-xl text-red-600 dark:text-red-400 italic">
            「{entry.sarcastic_title}」
          </p>
        )}
      </div>

      {/* Description */}
      <div className="prose dark:prose-invert max-w-none mb-8">
        <p className="text-lg text-gray-600 dark:text-gray-400">
          {entry.short_desc}
        </p>
        <div
          className="mt-4 whitespace-pre-wrap"
          dangerouslySetInnerHTML={{ __html: entry.full_desc.replace(/\n/g, "<br />") }}
        />
      </div>

      {/* Code Example */}
      {entry.code_example && (
        <div className="mb-8">
          <h2 className="text-xl font-bold mb-4">コード例</h2>
          <CodeBlock code={entry.code_example} language={codeLanguage} />
        </div>
      )}

      {/* Angel Notes */}
      {entry.angel_notes && entry.angel_notes.length > 0 && (
        <AngelNotes notes={entry.angel_notes} title={entry.angel_title} />
      )}

      {/* Sarcastic Notes */}
      {entry.sarcastic_notes && entry.sarcastic_notes.length > 0 && (
        <SarcasticNotes notes={entry.sarcastic_notes} />
      )}
    </article>
  );
}
