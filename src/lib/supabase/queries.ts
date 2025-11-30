import { createClient } from "./server";
import type { Entry, Language, Category, Tag } from "@/types/entry";

// Entry with relations
interface EntryWithRelations extends Entry {
  category?: Category;
  tags?: Tag[];
}

// Helper to transform DB row to Entry type
function transformEntry(row: Record<string, unknown>): Entry {
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

export interface LanguageWithCount extends Language {
  entryCount: number;
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

  return data as unknown as Language[];
}

export async function getLanguagesWithCount(): Promise<LanguageWithCount[]> {
  const supabase = await createClient();

  // Get all languages
  const { data: languages, error: langError } = await supabase
    .from("languages")
    .select("*")
    .order("name");

  if (langError || !languages) {
    console.error("Error fetching languages:", langError);
    return [];
  }

  // Get entry counts for each language
  const languagesWithCount = await Promise.all(
    (languages as unknown as Language[]).map(async (lang) => {
      const { count, error: countError } = await supabase
        .from("entries")
        .select("*", { count: "exact", head: true })
        .eq("language_id", lang.id)
        .eq("is_published", true);

      if (countError) {
        console.error("Error counting entries:", countError);
      }

      return {
        ...lang,
        entryCount: count || 0,
      };
    })
  );

  return languagesWithCount;
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

  return data as unknown as Language;
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

  return data as unknown as Category[];
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

  const langData = language as unknown as { id: string };

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

  const rows = data as unknown as Array<Record<string, unknown>>;
  return (rows || []).map((row) => {
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

  const langData = language as unknown as { id: string };

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

  const row = data as unknown as Record<string, unknown>;
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
    const tagRows = tagData as unknown as Array<{ tags: Tag | null }>;
    entry.tags = tagRows
      .map((t) => t.tags)
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

  const rows = data as unknown as Array<Record<string, unknown>>;
  return (rows || []).map(transformEntry);
}

export async function searchEntries(
  query: string,
  langSlug?: string
): Promise<Entry[]> {
  // Use direct query instead of RPC to avoid type issues
  const supabase = await createClient();

  let queryBuilder = supabase
    .from("entries")
    .select(`
      id, slug, name, language_id, short_desc, sarcastic_title,
      languages!inner(slug)
    `)
    .eq("is_published", true)
    .or(`name.ilike.%${query}%,short_desc.ilike.%${query}%,sarcastic_title.ilike.%${query}%`)
    .limit(20);

  if (langSlug) {
    queryBuilder = queryBuilder.eq("languages.slug", langSlug);
  }

  const { data, error } = await queryBuilder;

  if (error) {
    console.error("Error searching entries:", error);
    return [];
  }

  const rows = data as unknown as Array<Record<string, unknown>>;
  return (rows || []).map((row) => ({
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
