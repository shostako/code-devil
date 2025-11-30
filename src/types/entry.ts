export type EntryType = 'function' | 'syntax' | 'class' | 'module' | 'operator';
export type Difficulty = 'beginner' | 'intermediate' | 'advanced';

export interface Entry {
  id: string;
  slug: string;
  name: string;
  language_id: string;
  category_id: string;
  entry_type: EntryType;
  difficulty: Difficulty;
  short_desc: string;
  full_desc: string;
  code_example?: string;
  sarcastic_title?: string;
  sarcastic_notes?: string[];
  is_published: boolean;
  source_file?: string;
  file_hash?: string;
  created_at: string;
  updated_at: string;

  // Joined relations
  language?: Language;
  category?: Category;
  tags?: Tag[];
}

export interface Language {
  id: string;
  slug: string;
  name: string;
  description?: string;
  icon_url?: string;
  created_at: string;
}

export interface Category {
  id: string;
  language_id: string;
  slug: string;
  name: string;
  sort_order: number;
}

export interface Tag {
  id: string;
  name: string;
}

export interface EntryTag {
  entry_id: string;
  tag_id: string;
}

// Difficulty display helpers
export const difficultyLabels: Record<Difficulty, string> = {
  beginner: '初級',
  intermediate: '中級',
  advanced: '上級',
};

export const difficultyColors: Record<Difficulty, string> = {
  beginner: 'bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200',
  intermediate: 'bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200',
  advanced: 'bg-red-600 text-white dark:bg-red-700 dark:text-white',
};

// Entry type display helpers
export const entryTypeLabels: Record<EntryType, string> = {
  function: '関数',
  syntax: '構文',
  class: 'クラス',
  module: 'モジュール',
  operator: '演算子',
};
