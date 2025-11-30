# code-devil

This file provides guidance to Claude Code when working with this repository.

---

## セッション開始時の必須アクション
**重要：新しいセッションでこのプロジェクトに入った際は、以下を最初に実行すること**

1. **PROGRESS.md を読む**: `PROGRESS.md` を開き、現在の状態と未完了タスクを把握
2. **次のアクション確認**: 「次セッションへの引き継ぎ」セクションを確認し、継続すべきタスクを認識
3. **ユーザーへの報告**: 認識した未完了タスクをユーザーに報告し、優先度を確認

**目的**: セッション間の引き継ぎを確実にし、前回の作業を途切れなく継続するため

---

## プロジェクト概要

**code-devil**は、{{PROJECT_DESCRIPTION}}

### コアバリュー
1. **{{VALUE_1}}**: {{DESCRIPTION}}
2. **{{VALUE_2}}**: {{DESCRIPTION}}
3. **{{VALUE_3}}**: {{DESCRIPTION}}

---

## 技術スタック

### フロントエンド
- **Next.js 14 (App Router)**: {{REASON}}
- **TypeScript (strict mode)**: 型安全性
- **Tailwind CSS**: {{REASON}}
- **Zustand**: {{REASON}}

### データ層
- **{{DATABASE}}**: {{REASON}}

### 開発ツール
- **Vitest**: テスト
- **ESLint + Prettier**: コード品質

---

## 開発コマンド

```bash
# 依存関係インストール
npm install

# 開発サーバー起動
npm run dev

# プロダクションビルド
npm run build

# 型チェック
npm run type-check

# Lint
npm run lint

# テスト
npm run test
```

---

## ディレクトリ構造

```
code-devil/
├── .claude/commands/     # カスタムコマンド
├── .tmp/                 # 仕様書（requirements, design, tasks）
├── docs/                 # ドキュメント
├── logs/                 # 作業ログ
├── public/               # 静的ファイル
├── src/
│   ├── app/              # ルーティング
│   ├── components/       # UIコンポーネント
│   │   ├── layout/       # レイアウト系
│   │   ├── ui/           # 汎用UI
│   │   └── {{DOMAIN}}/   # ドメイン固有
│   ├── lib/              # ビジネスロジック
│   ├── hooks/            # カスタムフック
│   ├── types/            # 型定義
│   └── utils/            # ユーティリティ
├── CLAUDE.md             # このファイル
└── package.json
```

---

## 開発ワークフロー（Kiro-Style Spec-Driven）

### ワークフローコマンド

| コマンド | フェーズ | 説明 |
|----------|---------|------|
| `/init` | 初期化 | プロジェクト基盤構築 |
| `/spec` | 仕様策定 | requirements, design, tasks作成 |
| `/implement` | 実装 | 仕様に基づいた実装 |
| `/review` | 検証 | 品質検証・リリース判定 |

### 段階的実装フロー

```
1. /init      → プロジェクト初期化
2. /spec      → 仕様策定（ユーザー承認）
3. /implement → Phase 1実装（ユーザー確認）
4. /review    → 品質検証
5. /implement → Phase 2実装...（繰り返し）
```

**重要**: 各フェーズ終了時にはユーザー確認を挟むこと。

---

## コーディング規約

### TypeScript
- `strict mode` 必須
- `any`型の使用禁止
- 関数型アプローチ優先

### React
- Server Componentsをデフォルト
- `'use client'`は必要な場合のみ
- コンポーネントはPascalCase

### 命名規則
- コンポーネント: PascalCase (`TermCard.tsx`)
- フック: camelCase + `use`プレフィックス (`useTerm.ts`)
- ユーティリティ: camelCase (`formatDate.ts`)
- 型: PascalCase (`interface UserProgress {}`)

### インポート順序
```typescript
// 1. React関連
import { useState } from 'react';
// 2. 外部ライブラリ
import { create } from 'zustand';
// 3. 内部モジュール
import { db } from '@/lib/db';
// 4. 型定義
import type { Term } from '@/types/term';
```

---

## 禁止事項

以下の行為は厳禁です：

- [ ] 仕様にない機能の追加（スコープクリープ）
- [ ] `any`型の使用
- [ ] テストなしでのビジネスロジック実装
- [ ] ハードコーディングされた設定値
- [ ] ユーザー確認なしでのフェーズ移行

---

## 品質基準

### パフォーマンス
- 検索/操作応答: {{TARGET_RESPONSE_TIME}}以内
- 初回ロード: {{TARGET_LOAD_TIME}}以内

### テスト
- カバレッジ目標: {{COVERAGE_TARGET}}%
- ビジネスロジックは必須テスト

### アクセシビリティ
- キーボードナビゲーション対応
- ARIA属性の適切な設定
- WCAG AA準拠のコントラスト

---

## トラブルシューティング

### よくある問題

#### 問題1: {{COMMON_ISSUE}}
**症状**: {{SYMPTOM}}
**原因**: {{CAUSE}}
**対処法**: {{SOLUTION}}

---

## 参考資料

- **仕様書**: `.tmp/requirements.md`
- **設計書**: `.tmp/design.md`
- **タスクリスト**: `.tmp/tasks.md`

---

**最後に**: このプロジェクトは「{{VALUE_1}}」「{{VALUE_2}}」「{{VALUE_3}}」の原則に基づいています。技術選択に迷った場合は、常にこれらの原則に立ち返ってください。
