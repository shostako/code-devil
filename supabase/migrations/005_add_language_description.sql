-- Add description column to languages table
ALTER TABLE languages ADD COLUMN description TEXT;

-- Update existing language descriptions
UPDATE languages SET description = 'シンプルさと読みやすさを追求した言語。インデントが命。' WHERE slug = 'python';
UPDATE languages SET description = 'Web開発の覇者。型がないことを自由と呼ぶか混沌と呼ぶか。' WHERE slug = 'javascript';
UPDATE languages SET description = 'シェル操作の基本。一見シンプルだが、クォートの罠に無数のエンジニアが散った。' WHERE slug = 'bash';
