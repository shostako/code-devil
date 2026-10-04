# CodeDevil

プログラミング言語の関数・構文・標準ライブラリを、「悪魔の辞典」の調子で解説するリファレンスサイト。

各エントリには、普通の説明・構文・コード例に加えて、2種類の短評を付けている。

- 悪魔のノート: 現場のあるあるや落とし穴を、皮肉まじりに書いたもの
- 天使のノート: 同じ話を素直に言い直した助言

収録は Python・JavaScript・TypeScript・Bash・SQL・HTML/CSS の6言語。言語別の一覧、カテゴリ分け、全言語を横断する検索、エントリ間の前後移動、ライト/ダーク切替、スマホ表示に対応している。

## 動かし方

```bash
npm install
npm run dev        # http://localhost:3000
```

環境変数を何も置かなければ、`src/lib/mockData.ts` の見本データ（約20エントリ）で動く。
`.env.local` に Supabase の接続先（`NEXT_PUBLIC_SUPABASE_URL` と `NEXT_PUBLIC_SUPABASE_ANON_KEY`、書式は `.env.example`）を置くと、データベースから読む。どちらを使うかは `src/lib/data.ts` が切り替える。

## 技術構成

- Next.js 14（App Router）、TypeScript（strict）
- Tailwind CSS、next-themes
- Zustand
- Supabase（`@supabase/ssr`）
- コード例の色付けは react-syntax-highlighter

## 構成

```
src/
├── app/
│   ├── [lang]/            言語別の一覧
│   ├── [lang]/[slug]/     エントリの詳細
│   └── api/languages/     言語一覧の API
├── components/            画面部品（entry / layout / search / ui）
├── hooks/                 検索
├── lib/                   データ取得（data.ts が見本データと Supabase を切り替える）
└── types/
supabase/migrations/       言語とエントリを追加した SQL
```

## スクリプト

```bash
npm run dev          # 開発サーバ
npm run build        # 本番ビルド
npm run start        # ビルドした物を起動
npm run lint         # ESLint
npm run type-check   # 型チェック
```
