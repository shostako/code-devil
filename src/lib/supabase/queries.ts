import { createClient } from "./server";
import type { Entry, Language, Category, Tag } from "@/types/entry";

// Entry with relations
interface EntryWithRelations extends Entry {
  category?: Category;
  tags?: Tag[];
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
type SupabaseRow = any;

// Helper to transform DB row to Entry type
function transformEntry(row: SupabaseRow): Entry {
  return {
    id: row.id as string,
    slug: row.slug as string,
    name: row.name as string,
    language_id: row.language_id as string,
    category_id: row.category_id as string,
    entry_type: row.entry_type as Entry["entry_type"],
    difficulty: row.difficulty as Entry["difficulty"],
    short_desc: row.short_desc as string,
    full_desc: row.full_desc as string,
    code_example: row.code_example as string | undefined,
    sarcastic_title: row.sarcastic_title as string | undefined,
    sarcastic_notes: row.sarcastic_notes as string[] | undefined,
    is_published: row.is_published as boolean,
    created_at: row.created_at as string,
    updated_at: row.updated_at as string,
  };
}

export async function getLanguages(): Promise<Language[]> {
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("languages")
    .select("*")
    .order("name");

  if (error) {
    console.error("Error fetching languages:", error);
    return [];
  }

  return (data as SupabaseRow[]) as Language[];
}

export async function getLanguageBySlug(slug: string): Promise<Language | null> {
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("languages")
    .select("*")
    .eq("slug", slug)
    .single();

  if (error) {
    console.error("Error fetching language:", error);
    return null;
  }

  return (data as SupabaseRow) as Language;
}

export async function getCategoriesByLanguage(languageId: string): Promise<Category[]> {
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("categories")
    .select("*")
    .eq("language_id", languageId)
    .order("sort_order");

  if (error) {
    console.error("Error fetching categories:", error);
    return [];
  }

  return (data as SupabaseRow[]) as Category[];
}

export async function getEntriesByLanguage(langSlug: string): Promise<Entry[]> {
  const supabase = await createClient();

  // First get the language ID
  const { data: language, error: langError } = await supabase
    .from("languages")
    .select("id")
    .eq("slug", langSlug)
    .single();

  if (langError || !language) {
    console.error("Error fetching language:", langError);
    return [];
  }

  const langData = language as SupabaseRow;

  // Then get entries
  const { data, error } = await supabase
    .from("entries")
    .select(`
      *,
      categories(id, slug, name, sort_order)
    `)
    .eq("language_id", langData.id)
    .eq("is_published", true)
    .order("name");

  if (error) {
    console.error("Error fetching entries:", error);
    return [];
  }

  return ((data as SupabaseRow[]) || []).map((row: SupabaseRow) => {
    const entry = transformEntry(row);
    if (row.categories) {
      entry.category = row.categories as Category;
    }
    return entry;
  });
}

export async function getEntryBySlug(
  langSlug: string,
  entrySlug: string
): Promise<EntryWithRelations | null> {
  const supabase = await createClient();

  // Get the language ID
  const { data: language, error: langError } = await supabase
    .from("languages")
    .select("id")
    .eq("slug", langSlug)
    .single();

  if (langError || !language) {
    console.error("Error fetching language:", langError);
    return null;
  }

  const langData = language as SupabaseRow;

  // Get the entry with category
  const { data, error } = await supabase
    .from("entries")
    .select(`
      *,
      categories(id, slug, name, sort_order)
    `)
    .eq("language_id", langData.id)
    .eq("slug", entrySlug)
    .eq("is_published", true)
    .single();

  if (error) {
    console.error("Error fetching entry:", error);
    return null;
  }

  const row = data as SupabaseRow;
  const entry = transformEntry(row) as EntryWithRelations;
  if (row.categories) {
    entry.category = row.categories as Category;
  }

  // Get tags for this entry
  const { data: tagData, error: tagError } = await supabase
    .from("entry_tags")
    .select(`
      tags(id, name)
    `)
    .eq("entry_id", entry.id);

  if (!tagError && tagData) {
    entry.tags = (tagData as SupabaseRow[])
      .map((t: SupabaseRow) => t.tags as Tag)
      .filter((t): t is Tag => t !== null);
  }

  return entry;
}

export async function getAllEntries(): Promise<Entry[]> {
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("entries")
    .select("*")
    .eq("is_published", true)
    .order("name");

  if (error) {
    console.error("Error fetching all entries:", error);
    return [];
  }

  return ((data as SupabaseRow[]) || []).map(transformEntry);
}

export async function searchEntries(
  query: string,
  langSlug?: string
): Promise<Entry[]> {
  const supabase = await createClient();
  const { data, error } = await supabase.rpc("search_entries", {
    query,
    lang: langSlug || null,
  } as SupabaseRow);

  if (error) {
    console.error("Error searching entries:", error);
    return [];
  }

  return ((data as SupabaseRow[]) || []).map((row: SupabaseRow) => ({
    id: row.id as string,
    slug: row.slug as string,
    name: row.name as string,
    language_id: row.language_id as string,
    category_id: "",
    entry_type: "function" as const,
    difficulty: "beginner" as const,
    short_desc: row.short_desc as string,
    full_desc: "",
    sarcastic_title: row.sarcastic_title as string | undefined,
    is_published: true,
    created_at: "",
    updated_at: "",
  }));
}
