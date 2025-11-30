# プロジェクト進捗状況

## 現在の状態
- **最終更新**: 2025-11-30 19:28
- **アクティブタスク**: Phase 2 Supabase連携準備完了

## 完了済み
- [x] プロジェクト作成
- [x] /spec - 仕様策定（requirements.md, design.md, tasks.md）
- [x] Phase 1 MVP実装
  - Next.js 14 + TypeScript + Tailwind CSS 環境構築
  - トップページ（言語カード表示）
  - 言語別ページ（エントリ一覧）
  - エントリ詳細ページ（説明・コード・悪魔のノート）
  - ダークモード対応（next-themes）
  - コードシンタックスハイライト（react-syntax-highlighter）
  - モックデータ：Python 5件、JavaScript 5件
- [x] Phase 1.6 - 検索機能
  - SearchBarコンポーネント（再利用可能な検索入力）
  - useSearchフック（検索ロジックの共通化）
  - EntryListWithSearch（言語ページ用検索付きリスト）
  - GlobalSearch（トップページの全言語横断検索）
- [x] Phase 2 - Supabase連携準備
  - Supabaseクライアント設定（@supabase/ssr）
  - Database型定義
  - DBマイグレーション（001_initial_schema.sql, 002_seed_data.sql）
  - データ統合レイヤー（src/lib/data.ts）
  - 環境変数未設定時はモックデータにフォールバック

## 未完了・保留
- [ ] Phase 2 続き - Supabaseプロジェクト作成・接続テスト
- [ ] Phase 3 - デプロイ・テスト

## 次セッションへの引き継ぎ
- **次のアクション**: Supabaseダッシュボードでプロジェクト作成→マイグレーション実行→.env.local設定
- **重要な発見**: Next.js 14.2はnext.config.tsをサポートしない（.mjs必須）
- **参照すべきリソース**: `.tmp/requirements.md`, `.tmp/design.md`, `supabase/migrations/`

## Supabase接続手順
1. https://supabase.com で新規プロジェクト作成
2. SQL Editorで `supabase/migrations/001_initial_schema.sql` を実行
3. SQL Editorで `supabase/migrations/002_seed_data.sql` を実行
4. `.env.local` を作成し、Project Settings → APIからURLとAnon Keyをコピー
```bash
cp .env.example .env.local
# NEXT_PUBLIC_SUPABASE_URL, NEXT_PUBLIC_SUPABASE_ANON_KEYを設定
```
5. `npm run dev` で動作確認

## 動作確認方法
```bash
cd ~/ClaudeCode/code-devil
npm run dev -- -H 0.0.0.0 -p 3000
# http://localhost:3000 でアクセス（WSL環境では-H 0.0.0.0必須）
```

## 直近のGitコミット
- 8eaf0a7 feat: Phase 2 Supabase連携準備
- a4cc3a8 feat: Phase 1.6 検索機能追加
- c6de149 feat: Phase 1 MVP - エントリ表示機能（モックデータ）
