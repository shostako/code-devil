# プロジェクト進捗状況

## 現在の状態
- **最終更新**: 2025-12-01 05:10
- **アクティブタスク**: Phase 4 コンテンツ拡充完了

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
- [x] Phase 2 - Supabase連携
  - Supabaseクライアント設定（@supabase/ssr）
  - Database型定義
  - DBマイグレーション（001_initial_schema.sql, 003_corrected_seed.sql）
  - データ統合レイヤー（src/lib/data.ts）
  - Supabaseプロジェクト作成・接続完了
  - 本番データでの動作確認OK

## 未完了・保留
- [x] Phase 3 - デプロイ（Render）
- [x] Phase 4 - コンテンツ拡充
  - Bash/Shell言語追加（12エントリ）
  - 既存Python/JSエントリの皮肉強化（10件）

## 次セッションへの引き継ぎ
- **次のアクション**: 追加機能実装（必要に応じて）
- **重要な発見**:
  - SupabaseのUIが更新され、anon keyは「Publishable key」という名前に変更された
  - Next.js 14.2はnext.config.tsをサポートしない（.mjs必須）
  - Render環境には@typescript-eslintがないので、eslint-disableコメントでこのルールを参照すると失敗する
  - `as unknown as Type`のダブルキャストパターンが型安全なSupabase連携に有効
- **参照すべきリソース**: `.tmp/requirements.md`, `.tmp/design.md`

## Render情報
- **Service Name**: code-devil
- **GitHub**: shostako/code-devil

## Supabase情報
- **Project URL**: https://ginyzujmhlowxflslzvs.supabase.co
- **Organization**: shostako's Org
- **Project**: code-devil

## 動作確認方法
```bash
cd ~/ClaudeCode/code-devil
npm run dev -- -H 0.0.0.0 -p 3000
# http://localhost:3000 でアクセス（WSL環境では-H 0.0.0.0必須）
```

## 直近のGitコミット
- 4a6c8b1 fix: Remove @typescript-eslint dependency for Render deployment
- 7f95808 feat: Phase 2 Supabase連携完了
- bb60d56 docs: PROGRESS.md更新（Phase 2準備完了）
