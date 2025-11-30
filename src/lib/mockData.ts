import type { Entry, Language, Category } from '@/types/entry';

export const languages: Language[] = [
  {
    id: '1',
    slug: 'python',
    name: 'Python',
    icon_url: '/icons/python.svg',
    created_at: '2024-01-01T00:00:00Z',
  },
  {
    id: '2',
    slug: 'javascript',
    name: 'JavaScript',
    icon_url: '/icons/javascript.svg',
    created_at: '2024-01-01T00:00:00Z',
  },
];

export const categories: Category[] = [
  { id: '1', language_id: '1', slug: 'builtin-functions', name: '組み込み関数', sort_order: 1 },
  { id: '2', language_id: '1', slug: 'control-flow', name: '制御構文', sort_order: 2 },
  { id: '3', language_id: '2', slug: 'console', name: 'コンソール', sort_order: 1 },
  { id: '4', language_id: '2', slug: 'array-methods', name: '配列メソッド', sort_order: 2 },
];

export const entries: Entry[] = [
  // Python entries
  {
    id: 'py-1',
    slug: 'print',
    name: 'print()',
    language_id: '1',
    category_id: '1',
    entry_type: 'function',
    difficulty: 'beginner',
    short_desc: '標準出力に値を表示する。デバッグの親友。',
    full_desc: `## 概要
\`print()\`は値を標準出力に表示する組み込み関数です。

## 構文
\`\`\`python
print(*objects, sep=' ', end='\\n', file=sys.stdout, flush=False)
\`\`\`

## 使い方
最もシンプルな使い方から、複数の引数、カスタムセパレータまで。`,
    code_example: `# 基本
print("Hello, World!")

# 複数の値
print("Name:", name, "Age:", age)

# セパレータ変更
print("2024", "01", "01", sep="-")  # 2024-01-01

# 改行なし
print("Loading", end="...")`,
    sarcastic_title: '静かなる出力者',
    sarcastic_notes: [
      'デバッグの9割はprint()で始まりprint()で終わる。デバッガー？何それ美味しいの？',
      '本番環境に残したprint()が後輩に見つかる恐怖。',
      'f-stringを覚えてからが本当のprint()人生。',
    ],
    is_published: true,
    created_at: '2024-01-01T00:00:00Z',
    updated_at: '2024-01-01T00:00:00Z',
  },
  {
    id: 'py-2',
    slug: 'len',
    name: 'len()',
    language_id: '1',
    category_id: '1',
    entry_type: 'function',
    difficulty: 'beginner',
    short_desc: 'オブジェクトの長さを返す。シンプルだが奥深い。',
    full_desc: `## 概要
\`len()\`はシーケンスやコレクションの要素数を返します。

## 構文
\`\`\`python
len(s)
\`\`\``,
    code_example: `# 文字列
len("Hello")  # 5

# リスト
len([1, 2, 3])  # 3

# 辞書
len({"a": 1, "b": 2})  # 2`,
    sarcastic_title: '万能計測器',
    sarcastic_notes: [
      '日本語文字列でlen()したら予想外の数字が出てきて泣いた経験、あるよね？',
      'len(generator)できないと知った時の絶望感。',
    ],
    is_published: true,
    created_at: '2024-01-01T00:00:00Z',
    updated_at: '2024-01-01T00:00:00Z',
  },
  {
    id: 'py-3',
    slug: 'range',
    name: 'range()',
    language_id: '1',
    category_id: '1',
    entry_type: 'function',
    difficulty: 'beginner',
    short_desc: '連続した数値シーケンスを生成。forループの相棒。',
    full_desc: `## 概要
\`range()\`は連続した整数のシーケンスを生成するイミュータブルなシーケンス型です。`,
    code_example: `# 0から9まで
for i in range(10):
    print(i)

# 1から10まで
for i in range(1, 11):
    print(i)

# 偶数だけ
for i in range(0, 10, 2):
    print(i)  # 0, 2, 4, 6, 8`,
    sarcastic_title: '数え屋',
    sarcastic_notes: [
      'range(1, 10)が10を含まないことを知るまでに何回バグを出しただろう。',
      'Python 2のxrange()を覚えている人は歴戦の勇者。',
    ],
    is_published: true,
    created_at: '2024-01-01T00:00:00Z',
    updated_at: '2024-01-01T00:00:00Z',
  },
  {
    id: 'py-4',
    slug: 'if',
    name: 'if文',
    language_id: '1',
    category_id: '2',
    entry_type: 'syntax',
    difficulty: 'beginner',
    short_desc: '条件分岐の基本。インデントが命。',
    full_desc: `## 概要
条件に応じて処理を分岐させる制御構文です。`,
    code_example: `# 基本形
if condition:
    do_something()
elif another_condition:
    do_another()
else:
    do_default()

# 三項演算子
result = "yes" if condition else "no"`,
    sarcastic_title: '二択の支配者',
    sarcastic_notes: [
      'インデントを間違えてelse節が想定外の場所に...Pythonあるある。',
      'if True:と書いてしまった瞬間、自分を疑え。',
    ],
    is_published: true,
    created_at: '2024-01-01T00:00:00Z',
    updated_at: '2024-01-01T00:00:00Z',
  },
  {
    id: 'py-5',
    slug: 'list-comprehension',
    name: 'リスト内包表記',
    language_id: '1',
    category_id: '2',
    entry_type: 'syntax',
    difficulty: 'intermediate',
    short_desc: 'リストを一行で生成。Pythonicの象徴。',
    full_desc: `## 概要
リストを簡潔に生成するPython特有の構文です。`,
    code_example: `# 基本
squares = [x**2 for x in range(10)]

# 条件付き
evens = [x for x in range(10) if x % 2 == 0]

# ネスト
matrix = [[i*j for j in range(3)] for i in range(3)]`,
    sarcastic_title: '一行の魔術師',
    sarcastic_notes: [
      '「読みやすい」と言いながら3重ネストの内包表記を書く人、いるよね。',
      'forループで書けばいいのに内包表記で書きたがる病。',
      'レビューで「これ何やってるの？」と聞かれたら負け。',
    ],
    is_published: true,
    created_at: '2024-01-01T00:00:00Z',
    updated_at: '2024-01-01T00:00:00Z',
  },

  // JavaScript entries
  {
    id: 'js-1',
    slug: 'console-log',
    name: 'console.log()',
    language_id: '2',
    category_id: '3',
    entry_type: 'function',
    difficulty: 'beginner',
    short_desc: 'コンソールに出力。JSデバッグの基本中の基本。',
    full_desc: `## 概要
\`console.log()\`はブラウザやNode.jsのコンソールに値を出力します。`,
    code_example: `// 基本
console.log("Hello, World!");

// 複数の値
console.log("User:", user, "Score:", score);

// オブジェクトの展開
console.log({ user, score });

// スタイル付き（ブラウザ）
console.log("%cStyled!", "color: red; font-size: 20px");`,
    sarcastic_title: '万国共通のデバッガー',
    sarcastic_notes: [
      'console.log()を消し忘れてプロダクションにデプロイした回数を数えたくない。',
      'デバッガーのブレークポイント？いや、console.logで十分でしょ（フラグ）',
      'console.log(\'here\')を5個並べて、どれが出力されてるか分からなくなる現象。',
    ],
    is_published: true,
    created_at: '2024-01-01T00:00:00Z',
    updated_at: '2024-01-01T00:00:00Z',
  },
  {
    id: 'js-2',
    slug: 'map',
    name: 'Array.map()',
    language_id: '2',
    category_id: '4',
    entry_type: 'function',
    difficulty: 'beginner',
    short_desc: '配列の各要素を変換して新しい配列を返す。',
    full_desc: `## 概要
配列の各要素に対して関数を適用し、その結果からなる新しい配列を返します。`,
    code_example: `const numbers = [1, 2, 3, 4, 5];

// 2倍にする
const doubled = numbers.map(n => n * 2);
// [2, 4, 6, 8, 10]

// オブジェクトの特定のプロパティを抽出
const users = [{name: "Alice"}, {name: "Bob"}];
const names = users.map(u => u.name);
// ["Alice", "Bob"]`,
    sarcastic_title: '変換の達人',
    sarcastic_notes: [
      'map()の戻り値を使わないでforEach()として使う人、いるよね？いるよね？',
      'map()の中でawait使おうとして詰む初心者の儀式。',
    ],
    is_published: true,
    created_at: '2024-01-01T00:00:00Z',
    updated_at: '2024-01-01T00:00:00Z',
  },
  {
    id: 'js-3',
    slug: 'filter',
    name: 'Array.filter()',
    language_id: '2',
    category_id: '4',
    entry_type: 'function',
    difficulty: 'beginner',
    short_desc: '条件に合う要素だけを抽出して新しい配列を返す。',
    full_desc: `## 概要
コールバック関数がtrueを返す要素だけを集めた新しい配列を返します。`,
    code_example: `const numbers = [1, 2, 3, 4, 5, 6];

// 偶数だけ
const evens = numbers.filter(n => n % 2 === 0);
// [2, 4, 6]

// nullを除去
const values = [1, null, 2, undefined, 3];
const clean = values.filter(v => v != null);
// [1, 2, 3]`,
    sarcastic_title: '選別の番人',
    sarcastic_notes: [
      'filter().map()のチェーンが長すぎて何をしてるか分からなくなる現象。',
      'filter(Boolean)というテクニックを覚えた時の万能感。',
    ],
    is_published: true,
    created_at: '2024-01-01T00:00:00Z',
    updated_at: '2024-01-01T00:00:00Z',
  },
  {
    id: 'js-4',
    slug: 'reduce',
    name: 'Array.reduce()',
    language_id: '2',
    category_id: '4',
    entry_type: 'function',
    difficulty: 'intermediate',
    short_desc: '配列を単一の値に集約。強力だが読みにくい。',
    full_desc: `## 概要
配列の各要素に対してリデューサー関数を実行し、単一の値にまとめます。`,
    code_example: `const numbers = [1, 2, 3, 4, 5];

// 合計
const sum = numbers.reduce((acc, n) => acc + n, 0);
// 15

// オブジェクトに変換
const users = [{id: 1, name: "Alice"}, {id: 2, name: "Bob"}];
const byId = users.reduce((acc, user) => {
  acc[user.id] = user;
  return acc;
}, {});`,
    sarcastic_title: '万能圧縮機',
    sarcastic_notes: [
      'reduce()で何でもできるからって、何でもreduce()でやるな。',
      'reduce()を理解した瞬間、map()とfilter()で書けるものまでreduce()で書き始める病。',
      'reduce()のコードレビューで「これ何やってるの？」は褒め言葉じゃない。',
    ],
    is_published: true,
    created_at: '2024-01-01T00:00:00Z',
    updated_at: '2024-01-01T00:00:00Z',
  },
  {
    id: 'js-5',
    slug: 'async-await',
    name: 'async/await',
    language_id: '2',
    category_id: '3',
    entry_type: 'syntax',
    difficulty: 'intermediate',
    short_desc: '非同期処理を同期的に書ける構文。Promise地獄からの解放。',
    full_desc: `## 概要
Promiseベースの非同期処理を、同期処理のように書ける構文糖衣です。`,
    code_example: `// 基本
async function fetchUser(id) {
  const response = await fetch(\`/api/users/\${id}\`);
  const user = await response.json();
  return user;
}

// エラーハンドリング
async function fetchData() {
  try {
    const data = await fetch('/api/data');
    return await data.json();
  } catch (error) {
    console.error('Failed:', error);
  }
}

// 並列実行
const [users, posts] = await Promise.all([
  fetchUsers(),
  fetchPosts()
]);`,
    sarcastic_title: '同期の仮面',
    sarcastic_notes: [
      'awaitを忘れてPromiseオブジェクトをそのまま使ってしまう初心者の儀式。',
      'forループの中でawaitして直列実行になってるのに気づかない罠。',
      '.then()地獄から抜け出したと思ったら、try-catch地獄にハマる。',
    ],
    is_published: true,
    created_at: '2024-01-01T00:00:00Z',
    updated_at: '2024-01-01T00:00:00Z',
  },
];

// Helper functions
export function getEntriesByLanguage(langSlug: string): Entry[] {
  const language = languages.find(l => l.slug === langSlug);
  if (!language) return [];
  return entries.filter(e => e.language_id === language.id && e.is_published);
}

export function getEntryBySlug(langSlug: string, entrySlug: string): Entry | undefined {
  const language = languages.find(l => l.slug === langSlug);
  if (!language) return undefined;
  return entries.find(
    e => e.language_id === language.id && e.slug === entrySlug && e.is_published
  );
}

export function getLanguageBySlug(slug: string): Language | undefined {
  return languages.find(l => l.slug === slug);
}

export function getCategoriesByLanguage(langId: string): Category[] {
  return categories.filter(c => c.language_id === langId);
}

export function getAllEntries(): Entry[] {
  return entries.filter(e => e.is_published);
}
