interface AngelNotesProps {
  notes: string[];
  title?: string;
}

export default function AngelNotes({ notes, title }: AngelNotesProps) {
  if (!notes || notes.length === 0) return null;

  return (
    <div className="mt-8 p-6 bg-blue-50 dark:bg-blue-950/30 border border-blue-200 dark:border-blue-900 rounded-lg">
      <h3 className="text-lg font-bold text-blue-700 dark:text-blue-400 mb-4 flex items-center gap-2">
        <span>😇</span>
        天使のノート
        {title && (
          <span className="text-sm font-normal text-blue-500 dark:text-blue-300">
            ― {title}
          </span>
        )}
      </h3>
      <ul className="space-y-3">
        {notes.map((note, index) => (
          <li
            key={index}
            className="pl-4 border-l-2 border-blue-300 dark:border-blue-700 text-gray-700 dark:text-gray-300"
          >
            {note}
          </li>
        ))}
      </ul>
    </div>
  );
}
