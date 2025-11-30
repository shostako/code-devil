# CodeDevil - 技術設計書

**作成日**: 2025-11-30
**バージョン**: 1.0
**ベース**: `.tmp/requirements.md`

---

## 技術選択フレームワーク

### プロジェクト特性評価
- **アプリケーションタイプ**: Webアプリケーション（リファレンスサイト）
- **規模**: 小規模アプリ
- **ユーザー層**: 一般公開（プログラミング学習者、開発者）
- **パフォーマンス要件**: 標準（検索500ms以内、LCP 3秒以内）

### 制約分析
- **既知の技術**: Next.js, TypeScript, Tailwind CSS, Supabase
- **学習予算**: 即座（既知の技術のみ使用）
- **完了目標**: Phase 1を1-2週間

### 選択の正当化
各技術選択には以下を明記：
1. **選択理由**: なぜこの技術を選んだか
2. **代替案**: 検討した他の選択肢
3. **トレードオフ**: この選択のメリット・デメリット

---

## 1. 技術スタック選択

### 1.1 プロジェクト特性
- **アプリケーション種別**: 静的コンテンツ中心のリファレンスサイト
- **規模**: 小規模（初期10エントリ、将来的に100+）
- **ユーザーベース**: 一般公開
- **パフォーマンス要件**: 標準（検索はSupabaseで十分）

### 1.2 採用技術スタック

#### フロントエンド
| 技術 | 選定理由 |
|------|---------|
| **Next.js 14 (App Router)** | SSR/ISR対応、SEO最適化、ファイルベースルーティング |
| **TypeScript** | 型安全性、IDE支援、保守性 |
| **Tailwind CSS** | ユーティリティファースト、ダークモード容易、プロトタイプ高速 |
| **Zustand** | 軽量、シンプルAPI、persist middleware付き |

#### データ層
| 技術 | 選定理由 |
|------|---------|
| **Supabase (PostgreSQL)** | 無料枠十分、RLS対応、Full Text Search内蔵 |
| **Supabase Full Text Search** | pg_trgm拡張で日本語検索対応可能 |

#### 開発ツール
| 技術 | 選定理由 |
|------|---------|
| **Vitest** | Vite互換、高速、Jest互換API |
| **ESLint + Prettier** | コード品質・一貫性 |
| **next-themes** | Next.js App Router対応のテーマ切替 |
| **react-syntax-highlighter** | コードブロックのシンタックスハイライト |

### 1.3 不採用技術とその理由

#### Redux / Jotai
- **理由**: Zustandで十分、学習コスト・ボイラープレート不要
- **将来拡張**: 状態が複雑化したら検討

#### Prisma
- **理由**: Supabase JS SDKで十分、追加レイヤー不要
- **将来拡張**: 複雑なリレーションが必要になれば検討

#### MDX
- **理由**: Phase 1ではDBからのMarkdown取得で十分
- **将来拡張**: Phase 2のMarkdown同期で導入検討

---

## 2. システムアーキテクチャ

### 2.1 全体構成

```
┌─────────────────────────────────────────┐
│          Browser                        │
├─────────────────────────────────────────┤
│  UI Layer (React Server/Client)         │
│  ├── HomePage (言語選択)                │
│  ├── LanguagePage (エントリ一覧)        │
│  ├── EntryPage (エントリ詳細)           │
│  └── AdminPage (管理画面) [Phase 2]     │
├─────────────────────────────────────────┤
│  State Management (Zustand)             │
│  ├── EntryStore (検索・フィルター状態)  │
│  └── UIStore (テーマ、サイドバー)       │
├─────────────────────────────────────────┤
│  Data Access Layer                       │
│  ├── lib/supabase/client.ts (Browser)   │
│  └── lib/supabase/server.ts (Server)    │
├─────────────────────────────────────────┤
│  Supabase (PostgreSQL)                  │
│  ├── languages                          │
│  ├── categories                         │
│  ├── entries                            │
│  └── tags / entry_tags                  │
└─────────────────────────────────────────┘
```

### 2.2 データフロー

#### 初回ロード時（言語一覧ページ）
```
1. Server Component がSupabaseから言語一覧を取得
2. SSRでHTMLレンダリング（SEO対応）
3. Client側でZustandストアにハイドレート
```

#### エントリ検索時
```
1. ユーザーが検索クエリ入力
2. Client ComponentがSupabase RPC（全文検索）呼び出し
3. 結果をZustandストアに格納、UIが再レンダリング
```

#### テーマ切替時
```
1. ユーザーがテーマボタンクリック
2. next-themesがHTML属性を更新
3. Tailwind CSS dark: クラスが適用
4. localStorageに保存（persist）
```

---

## 3. ディレクトリ構造

```
code-devil/
├── .claude/
│   └── commands/           # Claude Code カスタムコマンド
│       ├── init.md
│       ├── spec.md
│       ├── implement.md
│       └── review.md
├── .tmp/                   # 仕様書
│   ├── requirements.md
│   ├── design.md
│   └── tasks.md
├── content/                # [Phase 2] Markdownソース
│   ├── python/
│   └── javascript/
├── docs/                   # ドキュメント
├── logs/                   # 作業ログ
├── public/
│   └── icons/              # 言語アイコン
├── src/
│   ├── app/
│   │   ├── layout.tsx      # ルートレイアウト
│   │   ├── page.tsx        # トップページ
│   │   ├── [lang]/
│   │   │   ├── page.tsx    # 言語別一覧
│   │   │   └── [slug]/
│   │   │       └── page.tsx # エントリ詳細
│   │   └── admin/          # [Phase 2] 管理画面
│   ├── components/
│   │   ├── layout/
│   │   │   ├── Header.tsx
│   │   │   ├── Footer.tsx
│   │   │   └── Sidebar.tsx
│   │   ├── ui/
│   │   │   ├── Button.tsx
│   │   │   ├── Card.tsx
│   │   │   ├── Input.tsx
│   │   │   └── SearchBar.tsx
│   │   └── entry/
│   │       ├── EntryCard.tsx
│   │       ├── EntryList.tsx
│   │       ├── EntryDetail.tsx
│   │       ├── CodeBlock.tsx
│   │       └── SarcasticNotes.tsx
│   ├── lib/
│   │   ├── supabase/
│   │   │   ├── client.ts   # Browser用クライアント
│   │   │   └── server.ts   # Server用クライアント
│   │   ├── store.ts        # Zustandストア
│   │   └── mockData.ts     # 開発用モックデータ
│   ├── hooks/
│   │   ├── useEntries.ts   # エントリ取得
│   │   └── useSearch.ts    # 検索
│   ├── types/
│   │   └── entry.ts        # 型定義
│   └── utils/
│       └── markdown.ts     # Markdown処理
├── supabase/
│   └── migrations/         # DBマイグレーション
├── CLAUDE.md
├── PROGRESS.md
├── package.json
└── README.md
```

---

## 4. データモデル

### 4.1 Language（言語）
```typescript
interface Language {
  id: string;           // UUID
  slug: string;         // "python", "javascript"
  name: string;         // "Python", "JavaScript"
  icon_url?: string;    // "/icons/python.svg"
  created_at: string;   // ISO 8601
}
```

### 4.2 Category（カテゴリ）
```typescript
interface Category {
  id: string;           // UUID
  language_id: string;  // FK → languages.id
  slug: string;         // "builtin-functions"
  name: string;         // "組み込み関数"
  sort_order: number;   // 表示順
}
```

### 4.3 Entry（エントリ）
```typescript
type EntryType = 'function' | 'syntax' | 'class' | 'module' | 'operator';
type Difficulty = 'beginner' | 'intermediate' | 'advanced';

interface Entry {
  id: string;               // UUID
  slug: string;             // "print"
  name: string;             // "print()"
  language_id: string;      // FK → languages.id
  category_id: string;      // FK → categories.id
  entry_type: EntryType;
  difficulty: Difficulty;
  short_desc: string;       // カード用短い説明
  full_desc: string;        // Markdown形式の詳細説明
  code_example?: string;    // コード例
  sarcastic_title?: string; // 「静かなる出力者」等
  sarcastic_notes?: string[]; // 皮肉コメント配列
  is_published: boolean;
  source_file?: string;     // [Phase 2] Markdownファイルパス
  file_hash?: string;       // [Phase 2] 差分検出用ハッシュ
  created_at: string;
  updated_at: string;
}
```

### 4.4 Tag / EntryTag（タグ）
```typescript
interface Tag {
  id: string;
  name: string;         // "初心者向け", "よく使う"
}

interface EntryTag {
  entry_id: string;     // FK → entries.id
  tag_id: string;       // FK → tags.id
}
```

### 4.5 ER図
```
┌──────────────┐     ┌──────────────┐
│  languages   │────<│  categories  │
└──────────────┘     └──────────────┘
       │
       │
       ↓
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│   entries    │────<│  entry_tags  │>────│    tags      │
└──────────────┘     └──────────────┘     └──────────────┘
```

---

## 5. API設計

### 5.1 Supabase RPC関数
| 関数名 | 引数 | 説明 |
|--------|------|------|
| `search_entries` | `query: string, lang?: string` | 全文検索（日本語対応） |

### 5.2 Next.js API Routes [Phase 2]
| Method | Path | 説明 |
|--------|------|------|
| GET | `/api/entries` | エントリ一覧取得 |
| POST | `/api/entries` | エントリ作成（管理者） |
| PUT | `/api/entries/[id]` | エントリ更新（管理者） |
| DELETE | `/api/entries/[id]` | エントリ削除（管理者） |
| POST | `/api/sync` | Markdown同期実行 |

---

## 6. セキュリティ考慮事項

### 6.1 実装するセキュリティ対策
- [x] XSS対策: ReactのデフォルトエスケープによるMarkdownサニタイズ
- [ ] CSRF対策: Supabase Authのセッション管理（Phase 2）
- [x] 入力バリデーション: Zodによるスキーマ検証
- [x] 機密情報の適切な管理: 環境変数でSupabase URLとキーを管理

### 6.2 RLS（Row Level Security）ポリシー
```sql
-- 公開エントリのみ読み取り可能（誰でも）
CREATE POLICY "Public entries are viewable by everyone"
ON entries FOR SELECT
USING (is_published = true);

-- 管理者のみ書き込み可能（Phase 2）
CREATE POLICY "Only admins can insert entries"
ON entries FOR INSERT
WITH CHECK (auth.role() = 'admin');
```

### 6.3 対象外（スコープ外）
- ユーザー認証（Phase 1では管理者認証のみ、一般ユーザー認証なし）
- レート制限（トラフィック増加時に検討）

---

## 7. テスト戦略

### 7.1 テスト種別
| 種別 | ツール | カバレッジ目標 |
|------|--------|---------------|
| Unit | Vitest | 60%（ロジック中心） |
| Integration | Testing Library | 主要コンポーネント |
| E2E | Playwright | 主要フロー3つ |

### 7.2 テスト対象の優先度
1. ビジネスロジック（`lib/store.ts`, `hooks/`）
2. データ操作（`lib/supabase/`）
3. UIコンポーネント（`components/entry/`）

### 7.3 E2Eテストシナリオ
1. トップページ → 言語選択 → エントリ一覧 → エントリ詳細
2. 検索バーで検索 → 結果表示
3. テーマ切替 → 永続化確認

---

## 8. 画面遷移フロー

```
[トップページ]
    │
    ├──→ [Python一覧] ──→ [print()詳細]
    │         │              │
    │         ├── [検索結果] ─┘
    │         │
    │         └── [カテゴリフィルター]
    │
    └──→ [JavaScript一覧] ──→ [console.log()詳細]
```

---

## 設計品質チェックリスト

### 1. 技術選択
- [x] 全技術選択に「選択理由」が明記済み
- [x] 代替案との比較検討が記録済み
- [x] UI/UX優先の判断基準で選択済み
- [x] 学習コストが現実的に評価済み

### 2. アーキテクチャ
- [x] コンポーネント間の依存関係が明確
- [x] データフローが図示または説明済み
- [x] エラーハンドリング方針が定義済み
- [x] セキュリティ考慮事項が明記済み

### 3. UI/UX設計
- [x] 画面遷移フローが定義済み
- [x] レスポンシブ対応方針が明記済み（Tailwind CSS）
- [x] アクセシビリティ考慮事項が列挙済み（キーボード操作: Ctrl+K）
- [x] ユーザーフィードバック方法が設計済み（ローディング、エラー表示）

### 4. 実装準備
- [x] ディレクトリ構造が具体的に定義済み
- [x] ファイル命名規則が決定済み（PascalCase: コンポーネント、camelCase: その他）
- [x] 状態管理方針が明確（Zustand 2ストア）
- [x] API設計（必要な場合）が完了済み

### 5. テスト戦略
- [x] テスト範囲が定義済み
- [x] テストフレームワークが選定済み（Vitest）
- [x] カバレッジ目標が設定済み（60%）
- [x] E2Eテスト方針が決定済み（Playwright、主要3フロー）

### 6. 品質基準
- [x] lint/formatter設定が決定済み（ESLint + Prettier）
- [x] TypeScript strict modeの方針決定済み（有効）
- [x] コードレビュー観点が列挙済み（型安全性、DRY、単一責任）
- [x] パフォーマンス目標値が設定済み（検索500ms、LCP 3秒）

---

**次のステップ**: `.tmp/tasks.md`（タスクリスト）の作成
