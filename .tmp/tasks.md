# CodeDevil - タスクリスト

**作成日**: 2025-11-30
**ベース**: `.tmp/requirements.md`, `.tmp/design.md`

---

## Claude Code最適化制約

### タスク粒度ルール
- **1タスク = 1-3時間**（コンテキスト内完結）
- **1タスク = 3-5ファイル以下**の変更
- **依存関係**を明確にし、並行実行可能なタスクを識別

### 並行実行の活用
```
Task A（型定義）  ←→  Task B（Supabase設定）
  └─ 依存なし、並行可能

Task C（UIコンポーネント）  →  Task D（ページ実装）
  └─ Task CはTask Dの前提、順次実行
```

---

## Phase 1: MVP（必須機能）

### 1.1 プロジェクト基盤 [約1時間]
- [ ] **T1.1.1** Next.js 14プロジェクト初期化
  - `npx create-next-app@latest` (App Router, TypeScript, Tailwind, ESLint)
  - **完了条件**: `npm run dev`で起動確認
  - **ファイル**: package.json, tsconfig.json, tailwind.config.ts
- [ ] **T1.1.2** 追加依存インストール
  - zustand, next-themes, react-syntax-highlighter, @supabase/supabase-js
  - **完了条件**: package.jsonに依存追加済み
- [ ] **T1.1.3** ディレクトリ構造作成
  - src/components/{layout,ui,entry}/, src/lib/, src/hooks/, src/types/
  - **完了条件**: 空ディレクトリまたはプレースホルダー配置

### 1.2 データ層 [約2時間]
- [ ] **T1.2.1** 型定義作成（types/entry.ts）
  - Entry, Language, Category, Tag, EntryTag インターフェース
  - EntryType, Difficulty 型エイリアス
  - ヘルパー定数（difficultyLabels, entryTypeLabels）
  - **完了条件**: TypeScript型チェック通過
  - **ファイル**: src/types/entry.ts
- [ ] **T1.2.2** Supabaseクライアント設定
  - lib/supabase/client.ts（Browser用）
  - lib/supabase/server.ts（Server用）
  - **完了条件**: Supabase接続確認（環境変数設定後）
  - **ファイル**: src/lib/supabase/client.ts, src/lib/supabase/server.ts, .env.local.example
- [ ] **T1.2.3** Zustandストア作成
  - EntryStore（エントリ、言語、カテゴリ、フィルター状態）
  - UIStore（テーマ、サイドバー）+ persist
  - **完了条件**: ストア作成、型チェック通過
  - **ファイル**: src/lib/store.ts
- [ ] **T1.2.4** モックデータ作成
  - Python 5件、JavaScript 5件のエントリ
  - 各言語2カテゴリ程度
  - 皮肉タイトル・コメント付き
  - **完了条件**: モックデータでUI表示確認可能
  - **ファイル**: src/lib/mockData.ts

### 1.3 UI基盤 [約2時間]
- [ ] **T1.3.1** レイアウトコンポーネント
  - Header.tsx（ロゴ、ナビ、テーマ切替）
  - Footer.tsx
  - **完了条件**: ダークモード切替動作確認
  - **ファイル**: src/components/layout/Header.tsx, Footer.tsx
- [ ] **T1.3.2** 汎用UIコンポーネント
  - Card.tsx, Button.tsx
  - **完了条件**: Tailwind CSSでスタイル適用済み
  - **ファイル**: src/components/ui/Card.tsx, Button.tsx
- [ ] **T1.3.3** next-themes設定
  - ThemeProvider設定（layout.tsx）
  - suppressHydrationWarning対応
  - **完了条件**: ライト/ダーク/システムの3モード切替
  - **ファイル**: src/app/layout.tsx, src/components/layout/ThemeToggle.tsx

### 1.4 エントリ表示機能（FR-1.1）[約3時間]
- [ ] **T1.4.1** EntryCard コンポーネント
  - 関数名、皮肉タイトル、短い説明、難易度バッジ
  - ホバーエフェクト、リンク
  - **完了条件**: カードが正しくレンダリング
  - **ファイル**: src/components/entry/EntryCard.tsx
- [ ] **T1.4.2** EntryList コンポーネント
  - グリッドレイアウト（レスポンシブ）
  - エントリがない場合の空状態
  - **完了条件**: モックデータでリスト表示
  - **ファイル**: src/components/entry/EntryList.tsx
- [ ] **T1.4.3** EntryDetail コンポーネント
  - 関数名、説明（Markdown）、コード例
  - **完了条件**: 詳細情報がレンダリング
  - **ファイル**: src/components/entry/EntryDetail.tsx
- [ ] **T1.4.4** SarcasticNotes コンポーネント
  - 皮肉コメントを引用形式で表示
  - 「悪魔のノート」ヘッダー
  - **完了条件**: 皮肉コメントが目立つUIで表示
  - **ファイル**: src/components/entry/SarcasticNotes.tsx
- [ ] **T1.4.5** CodeBlock コンポーネント
  - react-syntax-highlighter使用
  - ダークモード対応テーマ
  - コピーボタン
  - **完了条件**: シンタックスハイライト動作
  - **ファイル**: src/components/entry/CodeBlock.tsx

### 1.5 ページ実装 [約2時間]
- [ ] **T1.5.1** トップページ（app/page.tsx）
  - 言語カード表示（Python, JavaScript）
  - ヒーローセクション（サイト紹介）
  - **完了条件**: 言語選択でページ遷移
  - **ファイル**: src/app/page.tsx
- [ ] **T1.5.2** 言語別一覧ページ（app/[lang]/page.tsx）
  - EntryList表示
  - パンくずリスト
  - **完了条件**: モックデータでエントリ一覧表示
  - **ファイル**: src/app/[lang]/page.tsx
- [ ] **T1.5.3** エントリ詳細ページ（app/[lang]/[slug]/page.tsx）
  - EntryDetail + SarcasticNotes表示
  - メタデータ生成（SEO）
  - **完了条件**: 個別エントリの詳細表示
  - **ファイル**: src/app/[lang]/[slug]/page.tsx

### 1.6 検索・フィルター機能（FR-1.3）[約2時間]
- [ ] **T1.6.1** SearchBar コンポーネント
  - 検索入力、デバウンス処理
  - Ctrl+Kショートカット
  - **完了条件**: 入力でストア更新
  - **ファイル**: src/components/ui/SearchBar.tsx
- [ ] **T1.6.2** フィルター機能
  - カテゴリ、難易度でフィルター
  - クリアボタン
  - **完了条件**: フィルター適用でリスト絞り込み
  - **ファイル**: src/components/entry/EntryFilters.tsx
- [ ] **T1.6.3** クライアント側検索ロジック
  - モックデータでの検索（名前、説明）
  - **完了条件**: 検索ワードでエントリ絞り込み
  - **ファイル**: src/hooks/useSearch.ts

### 1.7 Phase 1 完了確認 [約30分]
- [ ] **T1.7.1** 動作確認
  - トップ → 言語一覧 → 詳細の遷移
  - 検索・フィルター動作
  - ダークモード切替
  - **完了条件**: 全フロー正常動作
- [ ] **T1.7.2** 品質チェック
  - `npm run lint` 通過
  - `npm run build` 成功
  - **完了条件**: エラー・警告なし
- [ ] **T1.7.3** コミット
  - Phase 1完了コミット
  - `git tag v0.1.0-phase1`
  - **完了条件**: タグ付きコミット

---

## Phase 2: 拡張機能

### 2.1 Supabase接続 [約2時間]
- [ ] **T2.1.1** DBマイグレーション実行
  - Supabaseでプロジェクト作成
  - マイグレーションSQL実行
  - **完了条件**: テーブル作成確認
- [ ] **T2.1.2** 初期データ投入
  - モックデータをDBに移行
  - **完了条件**: Supabaseダッシュボードでデータ確認
- [ ] **T2.1.3** データ取得切替
  - モックデータ → Supabaseクエリ
  - **完了条件**: DBからデータ表示

### 2.2 全文検索 [約1時間]
- [ ] **T2.2.1** search_entries RPC関数作成
  - pg_trgm拡張有効化
  - 全文検索関数作成
  - **完了条件**: SQLで検索動作確認
- [ ] **T2.2.2** フロントエンド統合
  - useSearch.tsをSupabase RPCに変更
  - **完了条件**: UI検索がDB検索に連動

### 2.3 管理画面（FR-2.1）[約4時間]
- [ ] **T2.3.1** Supabase Auth設定
  - Email/Password認証有効化
  - 管理者ユーザー作成
  - **完了条件**: ログイン動作確認
- [ ] **T2.3.2** 管理画面レイアウト
  - /admin ルート保護
  - サイドバーナビ
  - **完了条件**: 未認証時リダイレクト
- [ ] **T2.3.3** エントリCRUD UI
  - 一覧、作成、編集、削除
  - Markdownエディタ + プレビュー
  - **完了条件**: CRUD全操作動作

### 2.4 Phase 2 完了確認 [約30分]
- [ ] **T2.4.1** 動作確認
  - DB接続、検索、管理画面
  - **完了条件**: 全機能正常動作
- [ ] **T2.4.2** コミット
  - Phase 2完了コミット
  - `git tag v0.2.0-phase2`

---

## Phase 3: 品質向上・デプロイ

### 3.1 Markdown同期（FR-2.2）[約3時間]
- [ ] **T3.1.1** content/ディレクトリ構造
  - Markdownファイル配置
  - フロントマター形式定義
  - **完了条件**: サンプルMDファイル作成
- [ ] **T3.1.2** 同期スクリプト
  - gray-matterでフロントマター解析
  - ファイルハッシュで差分検出
  - **完了条件**: `npm run sync`で同期実行
- [ ] **T3.1.3** GitHub Actions設定
  - content/変更時に自動同期
  - **完了条件**: Push時に同期実行確認

### 3.2 デプロイ [約1時間]
- [ ] **T3.2.1** Render設定
  - 環境変数設定
  - ビルドコマンド設定
  - **完了条件**: デプロイ成功
- [ ] **T3.2.2** 本番動作確認
  - 全機能の動作テスト
  - **完了条件**: 本番環境で正常動作

### 3.3 テスト・ドキュメント [約2時間]
- [ ] **T3.3.1** ユニットテスト
  - ストア、フック、ユーティリティ
  - **完了条件**: カバレッジ60%以上
- [ ] **T3.3.2** E2Eテスト
  - 主要フロー3つ
  - **完了条件**: Playwright テスト通過
- [ ] **T3.3.3** ドキュメント整備
  - README更新
  - 作業ログ整理
  - **完了条件**: セットアップ手順明記

### 3.4 Phase 3 完了確認
- [ ] **T3.4.1** 最終確認
  - 全テスト通過
  - 本番デプロイ完了
  - **完了条件**: リリース可能状態
- [ ] **T3.4.2** リリース
  - `git tag v1.0.0`
  - **完了条件**: v1.0.0タグ付け

---

## 進捗管理

### マイルストーン
| Phase | 目標 | 実際完了日 | ステータス |
|-------|-----|-----------|----------|
| Phase 1 | MVP（モックデータ表示） | - | 未着手 |
| Phase 2 | DB接続・管理画面 | - | 未着手 |
| Phase 3 | デプロイ・テスト | - | 未着手 |

### ブロッカー・リスク
| 日付 | 内容 | 対応策 | ステータス |
|------|------|--------|----------|
| - | Supabase接続エラー | 環境変数確認、RLS設定確認 | - |
| - | next-themesハイドレーション警告 | suppressHydrationWarning設定 | - |

---

## 完了済みタスク履歴

### 2025-11-30
- [x] 要件定義書（requirements.md）作成
- [x] 技術設計書（design.md）作成
- [x] タスクリスト（tasks.md）作成

---

## タスク分解品質チェックリスト

### 1. 粒度
- [x] 全タスクが1-3時間で完了可能
- [x] 1タスクあたりの変更ファイル数が3-5以下
- [x] 各タスクの完了条件が明確
- [x] 依存関係が明示済み

### 2. 網羅性
- [x] 要件定義の全機能がカバーされている
- [x] 設計書の全コンポーネントが実装対象
- [x] テストタスクが含まれている
- [x] ドキュメント更新タスクが含まれている

### 3. 実行可能性
- [x] 各タスクが独立して検証可能
- [x] 並行実行可能なタスクが識別済み（T1.2.1 || T1.2.2）
- [x] ブロッカーとなる依存関係が特定済み
- [x] リスクの高いタスクが早期にスケジュール済み

### 4. 品質確認
- [x] 各Phaseに品質チェックポイントがある
- [x] lint/typecheck実行タスクが含まれている
- [x] ユーザー確認ポイントが設定済み
- [x] 最終検証タスクが定義済み

---

**次のステップ**: ユーザー承認後、`/implement`でPhase 1実装開始
