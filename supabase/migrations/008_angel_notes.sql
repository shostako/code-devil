-- 008: 天使のノート機能追加
-- 既存のsarcastic_*（実質普通の説明になっている）を天使のノートに移行し、
-- sarcastic_*は後で皮肉データを入れるためにリセット

-- Step 1: 新規カラム追加
ALTER TABLE entries
ADD COLUMN IF NOT EXISTS angel_title TEXT,
ADD COLUMN IF NOT EXISTS angel_notes TEXT[];

-- Step 2: 既存データを天使ノートにコピー
UPDATE entries
SET angel_title = sarcastic_title,
    angel_notes = sarcastic_notes
WHERE sarcastic_title IS NOT NULL;

-- Step 3: sarcastic_*をリセット（後で悪魔のノートデータを入れる）
UPDATE entries
SET sarcastic_title = NULL,
    sarcastic_notes = NULL;
