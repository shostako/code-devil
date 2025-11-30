プロジェクトの初期化と環境構築を行います。

## プロジェクト初期化フェーズ

あなたは**プロジェクトセットアップエンジニア**として、このプロジェクトの基盤を構築してください。

### 1. プロジェクト理解

#### 必須確認事項
- [ ] `CLAUDE.md`を読み、プロジェクトの目的・制約を把握
- [ ] `.tmp/requirements.md`で要件を確認
- [ ] `.tmp/design.md`で技術スタックを確認

#### ユーザーへの確認
以下が未定義の場合、ユーザーに確認してください：
- プロジェクト名（正式名称）
- 主要な技術選択（フレームワーク、CSS方式等）
- 開発環境の前提（Node.jsバージョン等）

### 2. プロジェクト基盤構築

#### 初期化タスク
```bash
# フレームワーク初期化（例: Next.js）
npx create-next-app@latest . --typescript --tailwind --eslint --app

# 追加依存関係のインストール
npm install {{ADDITIONAL_DEPS}}

# 開発依存関係
npm install -D {{DEV_DEPS}}
```

#### 設定ファイル
- [ ] `tsconfig.json` - strict mode有効化確認
- [ ] `.eslintrc.json` - ルール設定
- [ ] `.prettierrc` - フォーマット設定
- [ ] `.gitignore` - 除外設定

#### ディレクトリ構造
```
src/
├── app/           # ルーティング
├── components/    # UIコンポーネント
│   ├── layout/
│   └── ui/
├── lib/           # ビジネスロジック
├── hooks/         # カスタムフック
├── types/         # 型定義
└── utils/         # ユーティリティ
```

### 3. 初期化完了確認

#### チェックリスト
- [ ] `npm run dev` が正常に起動する
- [ ] `npm run build` がエラーなく完了する
- [ ] `npm run lint` が通過する
- [ ] TypeScript型チェックが通過する

#### 出力
初期化完了後、以下を報告してください：
1. 構築した環境の概要
2. インストールしたパッケージ一覧
3. 次のステップ（`/spec`コマンドの案内）

### 4. Git初期コミット

```bash
git add .
git commit -m "Initial project setup

- Framework: {{FRAMEWORK}}
- TypeScript strict mode
- ESLint + Prettier configured
- Directory structure created

🤖 Generated with Claude Code"
```

---

**次のステップ**: `/spec` コマンドで仕様策定を開始
