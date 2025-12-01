-- 011_clear_all_notes.sql
-- 全ての天使/悪魔のノートをクリア（新規作成のため）

UPDATE entries
SET angel_title = NULL,
    angel_notes = NULL,
    sarcastic_title = NULL,
    sarcastic_notes = NULL;
