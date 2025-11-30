-- CodeDevil Corrected Seed Data
-- 正しいUUID形式で書き直したシードデータ
-- 既存のテーブルをクリアしてからデータを投入

-- 既存データをクリア（テーブルは残す）
TRUNCATE entry_tags, entries, categories, tags, languages CASCADE;

-- Insert Languages
INSERT INTO languages (id, slug, name, icon_url) VALUES
  ('11111111-1111-1111-1111-111111111111', 'python', 'Python', '/icons/python.svg'),
  ('22222222-2222-2222-2222-222222222222', 'javascript', 'JavaScript', '/icons/javascript.svg');

-- Insert Categories
INSERT INTO categories (id, language_id, slug, name, sort_order) VALUES
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 'basics', '基礎', 1),
  ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '22222222-2222-2222-2222-222222222222', 'basics', '基礎', 1);

-- Insert Tags
INSERT INTO tags (id, name) VALUES
  ('cccccccc-cccc-cccc-cccc-cccccccccccc', '初心者向け'),
  ('dddddddd-dddd-dddd-dddd-dddddddddddd', 'よく使う'),
  ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'デバッグ'),
  ('ffffffff-ffff-ffff-ffff-ffffffffffff', '非同期');

-- Insert Python Entries
INSERT INTO entries (id, slug, name, language_id, category_id, entry_type, difficulty, short_desc, full_desc, code_example, sarcastic_title, sarcastic_notes, is_published) VALUES
  ('a1111111-1111-1111-1111-111111111111', 'print', 'print()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner', 'コンソールに出力する最も基本的な関数', 'print()は標準出力にテキストを出力します。', 'print("Hello, World!")', 'デバッグの王様', ARRAY['console.logより優れている', 'f-stringと組み合わせると最強'], true),
  ('a2222222-2222-2222-2222-222222222222', 'len', 'len()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner', 'オブジェクトの長さを返す', 'len()はシーケンスの要素数を返します。', 'len([1, 2, 3])', '長さを知りたい時の味方', ARRAY['Noneに使うとエラー'], true),
  ('a3333333-3333-3333-3333-333333333333', 'range', 'range()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner', '数値のシーケンスを生成', 'range()は整数シーケンスを生成します。', 'for i in range(5): print(i)', 'forループの相棒', ARRAY['range(5)は0から4まで'], true),
  ('a4444444-4444-4444-4444-444444444444', 'list', 'list()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'class', 'beginner', '可変長の配列', 'Pythonの最も基本的なデータ構造。', 'my_list = [1, 2, 3]', 'とりあえずリスト', ARRAY['append()で追加'], true),
  ('a5555555-5555-5555-5555-555555555555', 'dict', 'dict()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'class', 'beginner', 'キーと値のペアを格納', '辞書型。高速なキー検索が特徴。', 'my_dict = {"key": "value"}', 'データ構造の王様', ARRAY['.get()で安全にアクセス'], true);

-- Insert JavaScript Entries
INSERT INTO entries (id, slug, name, language_id, category_id, entry_type, difficulty, short_desc, full_desc, code_example, sarcastic_title, sarcastic_notes, is_published) VALUES
  ('b1111111-1111-1111-1111-111111111111', 'console-log', 'console.log()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'beginner', 'コンソールにログを出力', 'デバッグの基本中の基本。', 'console.log("Hello!");', 'デバッグの友', ARRAY['本番では消すこと'], true),
  ('b2222222-2222-2222-2222-222222222222', 'array-map', 'Array.map()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'beginner', '配列の各要素を変換', '新しい配列を返す。', '[1, 2, 3].map(x => x * 2)', '関数型の入り口', ARRAY['必ずreturnすること'], true),
  ('b3333333-3333-3333-3333-333333333333', 'array-filter', 'Array.filter()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'beginner', '条件に合う要素を抽出', '条件に一致する要素だけ返す。', '[1, 2, 3, 4].filter(x => x > 2)', '条件で絞り込む', ARRAY['trueを返す要素が残る'], true),
  ('b4444444-4444-4444-4444-444444444444', 'promise', 'Promise', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'class', 'intermediate', '非同期処理を扱う', '非同期処理の結果を表すオブジェクト。', 'new Promise((resolve) => resolve("done"))', '非同期の基礎', ARRAY['.then()で繋げる'], true),
  ('b5555555-5555-5555-5555-555555555555', 'async-await', 'async/await', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'syntax', 'intermediate', 'Promiseを同期的に書く', 'Promiseをより読みやすく書く構文。', 'async function f() { await fetch(url); }', '非同期の救世主', ARRAY['try-catch地獄にハマる'], true);
