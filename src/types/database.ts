export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[];

export interface Database {
  public: {
    Tables: {
      languages: {
        Row: {
          id: string;
          slug: string;
          name: string;
          icon_url: string | null;
          created_at: string;
        };
        Insert: {
          id?: string;
          slug: string;
          name: string;
          icon_url?: string | null;
          created_at?: string;
        };
        Update: {
          id?: string;
          slug?: string;
          name?: string;
          icon_url?: string | null;
          created_at?: string;
        };
      };
      categories: {
        Row: {
          id: string;
          language_id: string;
          slug: string;
          name: string;
          sort_order: number;
        };
        Insert: {
          id?: string;
          language_id: string;
          slug: string;
          name: string;
          sort_order?: number;
        };
        Update: {
          id?: string;
          language_id?: string;
          slug?: string;
          name?: string;
          sort_order?: number;
        };
      };
      entries: {
        Row: {
          id: string;
          slug: string;
          name: string;
          language_id: string;
          category_id: string;
          entry_type: "function" | "syntax" | "class" | "module" | "operator";
          difficulty: "beginner" | "intermediate" | "advanced";
          short_desc: string;
          full_desc: string;
          code_example: string | null;
          sarcastic_title: string | null;
          sarcastic_notes: string[] | null;
          is_published: boolean;
          source_file: string | null;
          file_hash: string | null;
          created_at: string;
          updated_at: string;
        };
        Insert: {
          id?: string;
          slug: string;
          name: string;
          language_id: string;
          category_id: string;
          entry_type: "function" | "syntax" | "class" | "module" | "operator";
          difficulty: "beginner" | "intermediate" | "advanced";
          short_desc: string;
          full_desc: string;
          code_example?: string | null;
          sarcastic_title?: string | null;
          sarcastic_notes?: string[] | null;
          is_published?: boolean;
          source_file?: string | null;
          file_hash?: string | null;
          created_at?: string;
          updated_at?: string;
        };
        Update: {
          id?: string;
          slug?: string;
          name?: string;
          language_id?: string;
          category_id?: string;
          entry_type?: "function" | "syntax" | "class" | "module" | "operator";
          difficulty?: "beginner" | "intermediate" | "advanced";
          short_desc?: string;
          full_desc?: string;
          code_example?: string | null;
          sarcastic_title?: string | null;
          sarcastic_notes?: string[] | null;
          is_published?: boolean;
          source_file?: string | null;
          file_hash?: string | null;
          created_at?: string;
          updated_at?: string;
        };
      };
      tags: {
        Row: {
          id: string;
          name: string;
        };
        Insert: {
          id?: string;
          name: string;
        };
        Update: {
          id?: string;
          name?: string;
        };
      };
      entry_tags: {
        Row: {
          entry_id: string;
          tag_id: string;
        };
        Insert: {
          entry_id: string;
          tag_id: string;
        };
        Update: {
          entry_id?: string;
          tag_id?: string;
        };
      };
    };
    Views: {
      [_ in never]: never;
    };
    Functions: {
      search_entries: {
        Args: {
          query: string;
          lang?: string;
        };
        Returns: {
          id: string;
          slug: string;
          name: string;
          language_id: string;
          short_desc: string;
          sarcastic_title: string | null;
        }[];
      };
    };
    Enums: {
      [_ in never]: never;
    };
  };
}

// 型エイリアス
export type Tables<T extends keyof Database["public"]["Tables"]> =
  Database["public"]["Tables"][T]["Row"];
export type InsertTables<T extends keyof Database["public"]["Tables"]> =
  Database["public"]["Tables"][T]["Insert"];
export type UpdateTables<T extends keyof Database["public"]["Tables"]> =
  Database["public"]["Tables"][T]["Update"];
