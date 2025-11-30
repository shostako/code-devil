interface SarcasticNotesProps {
  notes: string[];
}

export default function SarcasticNotes({ notes }: SarcasticNotesProps) {
  if (!notes || notes.length === 0) return null;

  return (
    <div className="mt-8 p-6 bg-red-50 dark:bg-red-950/30 border border-red-200 dark:border-red-900 rounded-lg">
      <h3 className="text-lg font-bold text-red-700 dark:text-red-400 mb-4 flex items-center gap-2">
        <span>😈</span>
        悪魔のノート
      </h3>
      <ul className="space-y-3">
        {notes.map((note, index) => (
          <li
            key={index}
            className="pl-4 border-l-2 border-red-300 dark:border-red-700 text-gray-700 dark:text-gray-300"
          >
            {note}
          </li>
        ))}
      </ul>
    </div>
  );
}
