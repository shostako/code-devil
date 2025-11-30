-- 009_restore_sarcastic.sql
-- angel_*からsarcastic_*にデータを戻す
UPDATE entries
SET sarcastic_title = angel_title,
    sarcastic_notes = angel_notes;

-- angel_*をクリア
UPDATE entries
SET angel_title = NULL,
    angel_notes = NULL;
