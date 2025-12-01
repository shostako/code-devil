# プロジェクト進捗状況

## 現在の状態
- **最終更新**: 2025-12-01 23:00
- **アクティブタスク**: なし（区切り）

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
- [x] Phase 3 - デプロイ（Vercel）
- [x] Phase 4 - コンテンツ拡充
  - Bash/Shell言語追加（39エントリ）
  - Python 53エントリ、JavaScript 49エントリ
  - 全141エントリに天使・悪魔のノート追加
- [x] Phase 5 - 機能改善（2025-12-01）
  - GlobalSearchのBash検索対応（mockData→Supabaseクライアント）
  - 用語詳細ページに前後ナビゲーション追加

## 次セッションへの引き継ぎ
- **次のアクション**: 用語（エントリ）の追加
- **重要な発見**:
  - GlobalSearchはクライアントコンポーネントなので、server.ts経由のSupabaseは使えない（next/headers依存）
  - クライアントコンポーネントからは`@/lib/supabase/client`を直接使用する
  - slug命名はDBと完全一致させること（SQL作成前に確認必須）
- **参照すべきリソース**: `.tmp/requirements.md`, `.tmp/design.md`

## Vercel情報
- **Project**: code-devil
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
- d30d1b9 feat: 用語詳細ページに前後ナビゲーションを追加
- 27c2759 fix: GlobalSearchでBashが検索候補に出ない問題を修正
- f5ad77b feat: 天使のノート機能追加
