-- CodeDevil Initial Schema
-- Run this in Supabase SQL Editor

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Languages table
CREATE TABLE languages (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  slug TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  icon_url TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Categories table
CREATE TABLE categories (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  language_id UUID NOT NULL REFERENCES languages(id) ON DELETE CASCADE,
  slug TEXT NOT NULL,
  name TEXT NOT NULL,
  sort_order INTEGER DEFAULT 0,
  UNIQUE(language_id, slug)
);

-- Entry types enum
CREATE TYPE entry_type AS ENUM ('function', 'syntax', 'class', 'module', 'operator');

-- Difficulty enum
CREATE TYPE difficulty_level AS ENUM ('beginner', 'intermediate', 'advanced');

-- Entries table
CREATE TABLE entries (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  slug TEXT NOT NULL,
  name TEXT NOT NULL,
  language_id UUID NOT NULL REFERENCES languages(id) ON DELETE CASCADE,
  category_id UUID NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
  entry_type entry_type NOT NULL,
  difficulty difficulty_level NOT NULL DEFAULT 'beginner',
  short_desc TEXT NOT NULL,
  full_desc TEXT NOT NULL,
  code_example TEXT,
  sarcastic_title TEXT,
  sarcastic_notes TEXT[],
  is_published BOOLEAN DEFAULT false,
  source_file TEXT,
  file_hash TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(language_id, slug)
);

-- Tags table
CREATE TABLE tags (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT UNIQUE NOT NULL
);

-- Entry-Tags junction table
CREATE TABLE entry_tags (
  entry_id UUID NOT NULL REFERENCES entries(id) ON DELETE CASCADE,
  tag_id UUID NOT NULL REFERENCES tags(id) ON DELETE CASCADE,
  PRIMARY KEY (entry_id, tag_id)
);

-- Indexes for performance
CREATE INDEX idx_entries_language ON entries(language_id);
CREATE INDEX idx_entries_category ON entries(category_id);
CREATE INDEX idx_entries_published ON entries(is_published);
CREATE INDEX idx_categories_language ON categories(language_id);

-- Full text search index (Japanese support via pg_trgm)
CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE INDEX idx_entries_name_trgm ON entries USING gin(name gin_trgm_ops);
CREATE INDEX idx_entries_short_desc_trgm ON entries USING gin(short_desc gin_trgm_ops);

-- Updated_at trigger
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER entries_updated_at
  BEFORE UPDATE ON entries
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at();

-- RLS Policies
ALTER TABLE languages ENABLE ROW LEVEL SECURITY;
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE entries ENABLE ROW LEVEL SECURITY;
ALTER TABLE tags ENABLE ROW LEVEL SECURITY;
ALTER TABLE entry_tags ENABLE ROW LEVEL SECURITY;

-- Public read access
CREATE POLICY "Languages are publicly readable"
  ON languages FOR SELECT
  USING (true);

CREATE POLICY "Categories are publicly readable"
  ON categories FOR SELECT
  USING (true);

CREATE POLICY "Published entries are publicly readable"
  ON entries FOR SELECT
  USING (is_published = true);

CREATE POLICY "Tags are publicly readable"
  ON tags FOR SELECT
  USING (true);

CREATE POLICY "Entry tags are publicly readable"
  ON entry_tags FOR SELECT
  USING (true);

-- Search function
CREATE OR REPLACE FUNCTION search_entries(query TEXT, lang TEXT DEFAULT NULL)
RETURNS TABLE (
  id UUID,
  slug TEXT,
  name TEXT,
  language_id UUID,
  short_desc TEXT,
  sarcastic_title TEXT
) AS $$
BEGIN
  RETURN QUERY
  SELECT
    e.id,
    e.slug,
    e.name,
    e.language_id,
    e.short_desc,
    e.sarcastic_title
  FROM entries e
  JOIN languages l ON e.language_id = l.id
  WHERE e.is_published = true
    AND (lang IS NULL OR l.slug = lang)
    AND (
      e.name ILIKE '%' || query || '%'
      OR e.short_desc ILIKE '%' || query || '%'
      OR e.sarcastic_title ILIKE '%' || query || '%'
    )
  ORDER BY
    CASE WHEN e.name ILIKE query || '%' THEN 0 ELSE 1 END,
    e.name
  LIMIT 20;
END;
$$ LANGUAGE plpgsql;
