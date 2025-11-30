-- CodeDevil Seed Data
-- Run this after 001_initial_schema.sql

-- Insert Languages
INSERT INTO languages (id, slug, name, icon_url) VALUES
  ('11111111-1111-1111-1111-111111111111', 'python', 'Python', '/icons/python.svg'),
  ('22222222-2222-2222-2222-222222222222', 'javascript', 'JavaScript', '/icons/javascript.svg');

-- Insert Categories
INSERT INTO categories (id, language_id, slug, name, sort_order) VALUES
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 'builtin-functions', '組み込み関数', 1),
  ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111-1111-1111-111111111111', 'control-flow', '制御構文', 2),
  ('cccccccc-cccc-cccc-cccc-cccccccccccc', '22222222-2222-2222-2222-222222222222', 'console', 'コンソール', 1),
  ('dddddddd-dddd-dddd-dddd-dddddddddddd', '22222222-2222-2222-2222-222222222222', 'array-methods', '配列メソッド', 2);

-- Insert Python Entries
INSERT INTO entries (slug, name, language_id, category_id, entry_type, difficulty, short_desc, full_desc, code_example, sarcastic_title, sarcastic_notes, is_published) VALUES
(
  'print',
  'print()',
  '11111111-1111-1111-1111-111111111111',
  'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
  'function',
  'beginner',
  '標準出力に値を表示する。デバッグの親友。',
  E'## 概要\n`print()`は値を標準出力に表示する組み込み関数です。\n\n## 構文\n```python\nprint(*objects, sep='' '', end=''\\n'', file=sys.stdout, flush=False)\n```\n\n## 使い方\n最もシンプルな使い方から、複数の引数、カスタムセパレータまで。',
  E'# 基本\nprint("Hello, World!")\n\n# 複数の値\nprint("Name:", name, "Age:", age)\n\n# セパレータ変更\nprint("2024", "01", "01", sep="-")  # 2024-01-01\n\n# 改行なし\nprint("Loading", end="...")',
  '静かなる出力者',
  ARRAY['デバッグの9割はprint()で始まりprint()で終わる。デバッガー？何それ美味しいの？', '本番環境に残したprint()が後輩に見つかる恐怖。', 'f-stringを覚えてからが本当のprint()人生。'],
  true
),
(
  'len',
  'len()',
  '11111111-1111-1111-1111-111111111111',
  'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
  'function',
  'beginner',
  'オブジェクトの長さを返す。シンプルだが奥深い。',
  E'## 概要\n`len()`はシーケンスやコレクションの要素数を返します。\n\n## 構文\n```python\nlen(s)\n```',
  E'# 文字列\nlen("Hello")  # 5\n\n# リスト\nlen([1, 2, 3])  # 3\n\n# 辞書\nlen({"a": 1, "b": 2})  # 2',
  '万能計測器',
  ARRAY['日本語文字列でlen()したら予想外の数字が出てきて泣いた経験、あるよね？', 'len(generator)できないと知った時の絶望感。'],
  true
),
(
  'range',
  'range()',
  '11111111-1111-1111-1111-111111111111',
  'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
  'function',
  'beginner',
  '連続した数値シーケンスを生成。forループの相棒。',
  E'## 概要\n`range()`は連続した整数のシーケンスを生成するイミュータブルなシーケンス型です。',
  E'# 0から9まで\nfor i in range(10):\n    print(i)\n\n# 1から10まで\nfor i in range(1, 11):\n    print(i)\n\n# 偶数だけ\nfor i in range(0, 10, 2):\n    print(i)  # 0, 2, 4, 6, 8',
  '数え屋',
  ARRAY['range(1, 10)が10を含まないことを知るまでに何回バグを出しただろう。', 'Python 2のxrange()を覚えている人は歴戦の勇者。'],
  true
),
(
  'if',
  'if文',
  '11111111-1111-1111-1111-111111111111',
  'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
  'syntax',
  'beginner',
  '条件分岐の基本。インデントが命。',
  E'## 概要\n条件に応じて処理を分岐させる制御構文です。',
  E'# 基本形\nif condition:\n    do_something()\nelif another_condition:\n    do_another()\nelse:\n    do_default()\n\n# 三項演算子\nresult = "yes" if condition else "no"',
  '二択の支配者',
  ARRAY['インデントを間違えてelse節が想定外の場所に...Pythonあるある。', 'if True:と書いてしまった瞬間、自分を疑え。'],
  true
),
(
  'list-comprehension',
  'リスト内包表記',
  '11111111-1111-1111-1111-111111111111',
  'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
  'syntax',
  'intermediate',
  'リストを一行で生成。Pythonicの象徴。',
  E'## 概要\nリストを簡潔に生成するPython特有の構文です。',
  E'# 基本\nsquares = [x**2 for x in range(10)]\n\n# 条件付き\nevens = [x for x in range(10) if x % 2 == 0]\n\n# ネスト\nmatrix = [[i*j for j in range(3)] for i in range(3)]',
  '一行の魔術師',
  ARRAY['「読みやすい」と言いながら3重ネストの内包表記を書く人、いるよね。', 'forループで書けばいいのに内包表記で書きたがる病。', 'レビューで「これ何やってるの？」と聞かれたら負け。'],
  true
);

-- Insert JavaScript Entries
INSERT INTO entries (slug, name, language_id, category_id, entry_type, difficulty, short_desc, full_desc, code_example, sarcastic_title, sarcastic_notes, is_published) VALUES
(
  'console-log',
  'console.log()',
  '22222222-2222-2222-2222-222222222222',
  'cccccccc-cccc-cccc-cccc-cccccccccccc',
  'function',
  'beginner',
  'コンソールに出力。JSデバッグの基本中の基本。',
  E'## 概要\n`console.log()`はブラウザやNode.jsのコンソールに値を出力します。',
  E'// 基本\nconsole.log("Hello, World!");\n\n// 複数の値\nconsole.log("User:", user, "Score:", score);\n\n// オブジェクトの展開\nconsole.log({ user, score });\n\n// スタイル付き（ブラウザ）\nconsole.log("%cStyled!", "color: red; font-size: 20px");',
  '万国共通のデバッガー',
  ARRAY['console.log()を消し忘れてプロダクションにデプロイした回数を数えたくない。', E'デバッガーのブレークポイント？いや、console.logで十分でしょ（フラグ）', E'console.log(''here'')を5個並べて、どれが出力されてるか分からなくなる現象。'],
  true
),
(
  'map',
  'Array.map()',
  '22222222-2222-2222-2222-222222222222',
  'dddddddd-dddd-dddd-dddd-dddddddddddd',
  'function',
  'beginner',
  '配列の各要素を変換して新しい配列を返す。',
  E'## 概要\n配列の各要素に対して関数を適用し、その結果からなる新しい配列を返します。',
  E'const numbers = [1, 2, 3, 4, 5];\n\n// 2倍にする\nconst doubled = numbers.map(n => n * 2);\n// [2, 4, 6, 8, 10]\n\n// オブジェクトの特定のプロパティを抽出\nconst users = [{name: "Alice"}, {name: "Bob"}];\nconst names = users.map(u => u.name);\n// ["Alice", "Bob"]',
  '変換の達人',
  ARRAY['map()の戻り値を使わないでforEach()として使う人、いるよね？いるよね？', 'map()の中でawait使おうとして詰む初心者の儀式。'],
  true
),
(
  'filter',
  'Array.filter()',
  '22222222-2222-2222-2222-222222222222',
  'dddddddd-dddd-dddd-dddd-dddddddddddd',
  'function',
  'beginner',
  '条件に合う要素だけを抽出して新しい配列を返す。',
  E'## 概要\nコールバック関数がtrueを返す要素だけを集めた新しい配列を返します。',
  E'const numbers = [1, 2, 3, 4, 5, 6];\n\n// 偶数だけ\nconst evens = numbers.filter(n => n % 2 === 0);\n// [2, 4, 6]\n\n// nullを除去\nconst values = [1, null, 2, undefined, 3];\nconst clean = values.filter(v => v != null);\n// [1, 2, 3]',
  '選別の番人',
  ARRAY['filter().map()のチェーンが長すぎて何をしてるか分からなくなる現象。', 'filter(Boolean)というテクニックを覚えた時の万能感。'],
  true
),
(
  'reduce',
  'Array.reduce()',
  '22222222-2222-2222-2222-222222222222',
  'dddddddd-dddd-dddd-dddd-dddddddddddd',
  'function',
  'intermediate',
  '配列を単一の値に集約。強力だが読みにくい。',
  E'## 概要\n配列の各要素に対してリデューサー関数を実行し、単一の値にまとめます。',
  E'const numbers = [1, 2, 3, 4, 5];\n\n// 合計\nconst sum = numbers.reduce((acc, n) => acc + n, 0);\n// 15\n\n// オブジェクトに変換\nconst users = [{id: 1, name: "Alice"}, {id: 2, name: "Bob"}];\nconst byId = users.reduce((acc, user) => {\n  acc[user.id] = user;\n  return acc;\n}, {});',
  '万能圧縮機',
  ARRAY['reduce()で何でもできるからって、何でもreduce()でやるな。', 'reduce()を理解した瞬間、map()とfilter()で書けるものまでreduce()で書き始める病。', 'reduce()のコードレビューで「これ何やってるの？」は褒め言葉じゃない。'],
  true
),
(
  'async-await',
  'async/await',
  '22222222-2222-2222-2222-222222222222',
  'cccccccc-cccc-cccc-cccc-cccccccccccc',
  'syntax',
  'intermediate',
  '非同期処理を同期的に書ける構文。Promise地獄からの解放。',
  E'## 概要\nPromiseベースの非同期処理を、同期処理のように書ける構文糖衣です。',
  E'// 基本\nasync function fetchUser(id) {\n  const response = await fetch(`/api/users/${id}`);\n  const user = await response.json();\n  return user;\n}\n\n// エラーハンドリング\nasync function fetchData() {\n  try {\n    const data = await fetch(''/api/data'');\n    return await data.json();\n  } catch (error) {\n    console.error(''Failed:'', error);\n  }\n}\n\n// 並列実行\nconst [users, posts] = await Promise.all([\n  fetchUsers(),\n  fetchPosts()\n]);',
  '同期の仮面',
  ARRAY['awaitを忘れてPromiseオブジェクトをそのまま使ってしまう初心者の儀式。', 'forループの中でawaitして直列実行になってるのに気づかない罠。', '.then()地獄から抜け出したと思ったら、try-catch地獄にハマる。'],
  true
);

-- Insert Tags
INSERT INTO tags (id, name) VALUES
  ('tag11111-1111-1111-1111-111111111111', '初心者向け'),
  ('tag22222-2222-2222-2222-222222222222', 'よく使う'),
  ('tag33333-3333-3333-3333-333333333333', 'デバッグ'),
  ('tag44444-4444-4444-4444-444444444444', '非同期');
