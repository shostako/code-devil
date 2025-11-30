/**
 * Data Access Layer
 * 環境変数が設定されていればSupabase、なければモックデータを使用
 */

import * as mockData from "./mockData";
import type { Entry, Language, Category } from "@/types/entry";

// Supabaseが設定されているかチェック
function isSupabaseConfigured(): boolean {
  return !!(
    process.env.NEXT_PUBLIC_SUPABASE_URL &&
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
  );
}

export async function getLanguages(): Promise<Language[]> {
  if (isSupabaseConfigured()) {
    const { getLanguages: getSupabaseLanguages } = await import("./supabase/queries");
    return getSupabaseLanguages();
  }
  return mockData.languages;
}

export async function getLanguageBySlug(slug: string): Promise<Language | undefined> {
  if (isSupabaseConfigured()) {
    const { getLanguageBySlug: getSupabaseLanguageBySlug } = await import("./supabase/queries");
    const result = await getSupabaseLanguageBySlug(slug);
    return result ?? undefined;
  }
  return mockData.getLanguageBySlug(slug);
}

export async function getCategoriesByLanguage(languageId: string): Promise<Category[]> {
  if (isSupabaseConfigured()) {
    const { getCategoriesByLanguage: getSupabaseCategories } = await import("./supabase/queries");
    return getSupabaseCategories(languageId);
  }
  return mockData.getCategoriesByLanguage(languageId);
}

export async function getEntriesByLanguage(langSlug: string): Promise<Entry[]> {
  if (isSupabaseConfigured()) {
    const { getEntriesByLanguage: getSupabaseEntries } = await import("./supabase/queries");
    return getSupabaseEntries(langSlug);
  }
  return mockData.getEntriesByLanguage(langSlug);
}

export async function getEntryBySlug(
  langSlug: string,
  entrySlug: string
): Promise<Entry | undefined> {
  if (isSupabaseConfigured()) {
    const { getEntryBySlug: getSupabaseEntry } = await import("./supabase/queries");
    const result = await getSupabaseEntry(langSlug, entrySlug);
    return result ?? undefined;
  }
  return mockData.getEntryBySlug(langSlug, entrySlug);
}

export async function getAllEntries(): Promise<Entry[]> {
  if (isSupabaseConfigured()) {
    const { getAllEntries: getSupabaseAllEntries } = await import("./supabase/queries");
    return getSupabaseAllEntries();
  }
  return mockData.getAllEntries();
}

// データソース情報（デバッグ用）
export function getDataSource(): "supabase" | "mock" {
  return isSupabaseConfigured() ? "supabase" : "mock";
}
