# code-devil

{{PROJECT_DESCRIPTION}}

## Quick Start

```bash
# 依存関係インストール
npm install

# 開発サーバー起動
npm run dev
```

## Tech Stack

- **Framework**: Next.js 14 (App Router)
- **Language**: TypeScript (strict mode)
- **Styling**: Tailwind CSS
- **State Management**: Zustand

## Project Structure

```
├── .claude/commands/  # Claude Code カスタムコマンド
├── .tmp/              # 仕様書（requirements, design, tasks）
├── docs/              # ドキュメント
├── logs/              # 作業ログ
├── src/
│   ├── app/           # ルーティング
│   ├── components/    # UIコンポーネント
│   ├── lib/           # ビジネスロジック
│   ├── hooks/         # カスタムフック
│   ├── types/         # 型定義
│   └── utils/         # ユーティリティ
└── public/            # 静的ファイル
```

## Development Workflow

このプロジェクトはKiro-Style Spec-Driven Developmentを採用しています。

### カスタムコマンド

| コマンド | 説明 |
|----------|------|
| `/init` | プロジェクト初期化 |
| `/spec` | 仕様策定（requirements, design, tasks） |
| `/implement` | 実装フェーズ |
| `/review` | レビュー・検証 |

### 仕様書

- `.tmp/requirements.md` - 要件定義
- `.tmp/design.md` - 技術設計
- `.tmp/tasks.md` - タスクリスト

## Scripts

```bash
npm run dev          # 開発サーバー
npm run build        # プロダクションビルド
npm run start        # ビルド後のプレビュー
npm run lint         # ESLint実行
npm run type-check   # TypeScript型チェック
npm run test         # テスト実行
```

## License

{{LICENSE}}
