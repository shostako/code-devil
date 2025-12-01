-- 023: 悪魔のノート 毒・ウィット改善
-- 対象: TypeScript (70件), SQL (80件), HTML/CSS (50件) = 計200件
-- 問題: 教科書的な記述になっていた
-- 修正: 経験談・感情・皮肉・共感ポイントを追加

-- ===========================================
-- TypeScript 悪魔のノート修正 (70件)
-- ===========================================

-- 型の基礎 (20件)
UPDATE entries SET sarcastic_notes = ARRAY[
  'typeとinterface、どっち使うか問題で会議が1時間潰れた経験、あるよね？',
  '宣言マージで同名interfaceが勝手に合体して「なんでこのプロパティあるの？」と混乱する日が来る',
  'extendsの多重継承で地獄を見た人、手を挙げて',
  'コード補完が効くようになった瞬間、TypeScriptに感謝し始める'
] WHERE slug = 'interface' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'type vs interface論争に巻き込まれて消耗した時間を返してほしい',
  '同名で宣言マージされないから安全...と思ったら再帰型で無限ループ作って詰んだ',
  'unionやintersectionを駆使して複雑な型を作り、1週間後の自分が読めない',
  '「これtypeで書くべき」「いやinterfaceでしょ」のループは終わらない'
] WHERE slug = 'type-alias' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'union型を10個以上並べて「読みやすい」と言い張る人、いるよね',
  '絞り込み忘れて「プロパティが存在しません」エラー、週3回は見る',
  'nullableを| nullで表現し始めてからが本当のTypeScript',
  'anyにしたくなったらまずunion。それでもダメならunknown。anyは最後の手段だぞ'
] WHERE slug = 'union-type' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'ミックスインのつもりで&したら同名プロパティがneverになって泣いた',
  'string & number = never という事実に気づくまで30分溶かした',
  'intersection使いまくってると型定義が読めなくなる病',
  '「これ&で合成すればいいじゃん」が沼の入り口'
] WHERE slug = 'intersection-type' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'enumやめてリテラル型にしたら「なんでenum使わないの？」と聞かれて説明に30分',
  'as constを覚えてからリテラル型推論が捗りすぎて戻れない',
  'typoしたら型エラーで教えてくれる安心感、これのためにTypeScript使ってる',
  '選択肢4つを|で並べるか配列にするかで悩む時間、もったいない'
] WHERE slug = 'literal-type' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'useStateの戻り値がタプルだと知った日、世界が広がった',
  'push()で要素追加できてしまう罠を踏んで「readonlyタプルにしろ」と怒られた',
  '[string, number, ...boolean[]]という可変長タプルを見て白目になった',
  '「配列でいいじゃん」と言われて「いや順番が...」と説明するの疲れる'
] WHERE slug = 'tuple-type' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'anyを使った瞬間、TypeScriptを導入した意味の半分が消える',
  '「一旦anyで」から始まった実装が本番まで残る恐怖',
  'eslintのno-explicit-anyを無効化する申請が通った瞬間、チームが終わる',
  '型がわからないならunknown使え。any使うな。本当に使うな。'
] WHERE slug = 'any-type' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'anyを書こうとした手を止めてunknownに変えた自分を褒めたい',
  '外部APIのレスポンス、まずunknownで受けて絞り込むのが大人の作法',
  '型ガードを強制されるおかげで実行時エラーが減った、unknownありがとう',
  'catchのエラーがunknownになってから「error as Error」と書く人が増えた'
] WHERE slug = 'unknown-type' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'switch文の網羅性チェックにnever使う黒魔術、一度覚えたら手放せない',
  '「この関数、戻り値neverだけど何？」と聞かれて説明に15分',
  'union型から型を引き算したらneverになって「消えた...」と呆然',
  'throw専用関数にnever書いて「プロだな」と自己満足する'
] WHERE slug = 'never-type' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'voidとundefinedの違いを説明できたら中級者、説明できなくても困らない',
  'コールバックの戻り値型、迷ったらvoidにしとけ',
  'void演算子とvoid型を混同して恥をかいた過去',
  'Promise<void>と書いて「何も返さないPromise」を表現するの、最初は違和感あった'
] WHERE slug = 'void-type' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'strictNullChecksをオンにした瞬間、プロジェクトが真っ赤になる儀式',
  'nullとundefined、どっち使うか論争で時間を溶かすな',
  '??演算子を覚えてからnullチェックが3倍楽になった',
  '「nullは意図的な空、undefinedは未定義」の説明を100回はした'
] WHERE slug = 'null-undefined' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'object型は使い道がほぼない、具体的な型を書け',
  '{}型が「何でもOK」に近いと知った時の驚き',
  'Object（大文字）を使ってしまい「なんか挙動おかしい」と悩んだ',
  'Record<string, unknown>を覚えてからobject型の出番が消えた'
] WHERE slug = 'object-type' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'string[]とArray<string>、どっちで書くかでコードレビューが荒れた',
  'readonly string[]にしておかないとうっかりpushされる未来',
  '多次元配列の型を書いてると頭がおかしくなってくる',
  'タプルと配列を間違えて「なんで長さ固定じゃないの」と聞かれた'
] WHERE slug = 'array-type' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'アロー関数の型定義、括弧の位置で毎回迷う',
  'オーバーロードの型を書いてると人生について考え始める',
  'this型を関数に付けられると知った日、TypeScriptの奥深さに震えた',
  'ジェネリック関数の型、書けるけど読めない問題'
] WHERE slug = 'function-type' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'enumをやめてリテラル型unionにする流れ、止まらない',
  'const enumの罠を踏んでバンドルサイズ爆発した話、聞いたことあるでしょ',
  'string enumにしておかないとデバッグで数値見て意味不明になる',
  'enumの逆引き（数値→名前）ができると知って感動した人、いるよね'
] WHERE slug = 'enum' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'as const付けた瞬間、配列がタプルに、オブジェクトがreadonlyになる魔法',
  '「なんでreadonlyになってるの」→「as constのせい」のやり取り週1回',
  'リテラル型推論させたいならas const、これ覚えとけ',
  'as constなしで定数定義して型が広がる悲劇、あるある'
] WHERE slug = 'as-const' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'satisfies、TS4.9で追加されてから使いまくってる',
  'as使うとwidening（型の拡大）されるけどsatisfiesならそのまま、最高',
  '「satisfiesって何？」と聞かれて説明するの難しすぎる',
  '型チェックしつつリテラル型を保持したい時の救世主'
] WHERE slug = 'satisfies' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'as unknown as Tという二段階アサーション、書いた瞬間負けを認めた気持ちになる',
  '型アサーションは「俺を信じろ」宣言、信じた結果バグる',
  'asを使いすぎるとTypeScriptの恩恵が消える、anyと同じ道',
  '「型が合わないならasで黙らせろ」は最悪のアドバイス'
] WHERE slug = 'type-assertion' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'readonlyつけても深いプロパティは変更可能という罠',
  'Readonly<T>でラップしたつもりが中身書き換えられて泣いた',
  'DeepReadonly作るの面倒すぎて諦めた人、多いでしょ',
  '「readonlyなのに変更できるんだけど」はTypeScriptあるある'
] WHERE slug = 'readonly' AND language_id = '44444444-4444-4444-4444-444444444444';

-- ジェネリクス (15件)
UPDATE entries SET sarcastic_notes = ARRAY[
  '<T>を初めて見た時「Tって何？」と3時間悩んだ',
  'ジェネリクスを使いこなせるようになった時、初めてTypeScriptを理解した気がした',
  '「型変数に意味のある名前をつけろ」と言われたけどTやUが楽すぎる',
  'Array<T>のTが「何でもいい」と気づくまで時間かかった'
] WHERE slug = 'generics-basic' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'extendsで制約かけたら「なんで通らないの」と30分悩んだ',
  'T extends stringと書いてstring以外を弾く、最初は魔法に見えた',
  'keyof Tで制約かけてオブジェクトのキーだけ受け取る技、実務で使いまくる',
  '制約なしのジェネリクスはanyと変わらない、ちゃんと絞れ'
] WHERE slug = 'generic-constraint' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'keyof typeofのコンボを初めて見た時、呪文かと思った',
  'オブジェクトのキーをunion型で取り出せる便利さ、一度知ったら戻れない',
  'keyof anyがstring | number | symbolになるの、罠でしかない',
  '「keyofって何？」→「キーのunion型」で終わる説明、雑すぎない？'
] WHERE slug = 'keyof' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  '型コンテキストのtypeofと値コンテキストのtypeof、同じキーワードなのに別物',
  'const x = {...}; type X = typeof x; のパターン、毎日書いてる',
  '変数から型を抽出できる、これぞTypeScriptの真骨頂',
  'typeofで取った型をさらにkeyofする...型パズルの始まり'
] WHERE slug = 'typeof-type' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'T["key"]で型を取り出せると知った日、世界が変わった',
  'ネストしたプロパティの型をT["a"]["b"]["c"]で取るの、読みにくい',
  'インデックスアクセス型とkeyofの組み合わせで型パズルが始まる',
  'T[number]で配列の要素型を取れる、これ知らない人多すぎ'
] WHERE slug = 'indexed-access' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'フォームの初期状態をPartialで定義して「未入力OK」を表現する定番',
  'Required型と組み合わせてバリデーション済みの型を作る技',
  '全部オプショナルにしたいだけなのに自作するの面倒...Partialありがとう',
  'Partial<T>の?を手動で書いてた過去の自分に教えてあげたい'
] WHERE slug = 'partial' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'Partialで作った型を全部必須に戻すRequired、セットで覚えろ',
  'オプショナルプロパティを強制的に必須にする、API境界でよく使う',
  '「なんで全部必須になってるの」→「Requiredかけてる」のやり取り',
  'Required<Partial<T>>って書いて元に戻るの、なんか無駄に見える'
] WHERE slug = 'required' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  '巨大な型から必要なプロパティだけ抜き出すPick、神',
  'Pick<User, "id" | "name">で軽量DTOの型を作る日常',
  'PickとOmit、どっち使うか迷って結局両方試す',
  '「全部欲しいけどこれとこれはいらない」→それOmitの仕事'
] WHERE slug = 'pick' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  '除外したいプロパティが多すぎてOmitの引数が長くなる悲しみ',
  'Omit<User, "password">でパスワード抜きの型作る、セキュリティ的にも安心',
  'PickとOmitを組み合わせて型をこねくり回す中毒',
  '「これ除外すればいいじゃん」→Omit使え'
] WHERE slug = 'omit' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'Record<string, any>を見たらanyをunknownに直したくなる病',
  'オブジェクトの型をサクッと作りたい時のRecord、便利すぎ',
  '{ [key: string]: T }より Record<string, T> のほうが読みやすい',
  'Record<UserId, User>で辞書型作る、これが正解'
] WHERE slug = 'record' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'union型から特定の型を除外するExclude、Omitと混同しがち',
  'Exclude<T, null | undefined>でnullableを排除する日常',
  '「これってPickだっけExcludeだっけ」と毎回調べる',
  '型のフィルタリングにExclude、プロパティの除外にOmit、覚えろ'
] WHERE slug = 'exclude' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'Excludeの逆がExtract、セットで覚えないと混乱する',
  'union型から特定の型だけ抽出するExtract、使いどころ限定的',
  'Extract<T, string>で文字列型だけ抜き出す、型パズルの道具',
  'ExcludeとExtract、名前似すぎて間違える'
] WHERE slug = 'extract' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  '関数の戻り値の型を取り出すReturnType、型定義し忘れた関数の救済策',
  'ReturnType<typeof fn>で既存関数から型を生成、DRYの極み',
  '戻り値の型を手動で書いて同期ズレする恐怖からの解放',
  '「この関数の戻り値なんだっけ」→ReturnTypeで一発'
] WHERE slug = 'return-type' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  '関数の引数の型をタプルで取り出すParameters、高階関数で重宝',
  'Parameters<typeof fn>[0]で第1引数の型を取る技',
  '引数の型を個別に取り出すの面倒...Parametersありがとう',
  'スプレッドで引数を転送する時に型を合わせるのに使う'
] WHERE slug = 'parameters' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'Promise<T>のTを取り出すAwaited、async/awaitと相性抜群',
  'ネストしたPromise<Promise<T>>もフラットにしてくれる神',
  'ReturnType<typeof asyncFn>がPromise<...>になって困った時の救世主',
  'TS4.5で追加された比較的新しいやつ、知らない人まだ多い'
] WHERE slug = 'awaited' AND language_id = '44444444-4444-4444-4444-444444444444';

-- 型ガード (10件)
UPDATE entries SET sarcastic_notes = ARRAY[
  'typeof x === "string"と書いてxがstringに絞り込まれる魔法',
  'typeofで判定できるのはプリミティブだけ、オブジェクトは別の方法',
  '「typeofで絞り込めるのにifの中で型エラー」→書き方が悪い',
  'typeof null === "object"という歴史的バグ、TypeScriptでも健在'
] WHERE slug = 'typeof-guard' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'クラスのインスタンス判定にinstanceof、これだけは迷わない',
  'プリミティブのラッパー（String, Number）にinstanceof使うと罠',
  '異なるRealmのオブジェクトでinstanceofが失敗する闇',
  'interfaceにはinstanceof使えない、クラスじゃないと無理'
] WHERE slug = 'instanceof-guard' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  '"key" in objでプロパティ存在確認と型絞り込みを同時に',
  'optional propertyがあるオブジェクトの型ガードに便利',
  'in演算子の型ガード、地味だけど実務で使いまくる',
  'hasOwnPropertyより inのほうがTypeScript的に優秀'
] WHERE slug = 'in-guard' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'type: "success" | "error"みたいなタグで分岐、これがTypeScriptの本領',
  'switch文でdiscriminated union回す快感、一度味わうと戻れない',
  'kindとかtypeとか、タグの名前で悩む時間もったいない',
  '判別可能なunionを設計できるかで設計力がバレる'
] WHERE slug = 'discriminated-union' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'function isUser(x): x is User、この「is」が型ガードのキモ',
  'カスタム型ガードを書けるようになったら一人前',
  '型述語の実装が間違ってても型エラーにならない恐怖',
  'x is Tと書いてtrueを返せば型が絞り込まれる、魔法かよ'
] WHERE slug = 'type-predicate' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'asserts x is Tでthrowしなければ型が確定する、攻撃的な型ガード',
  'バリデーション関数をアサーション関数にする設計、美しい',
  'assertsを使うとreturnの後で型が絞り込まれてる、不思議',
  '実装ミスると実行時エラーなのに型は通る、危険と隣り合わせ'
] WHERE slug = 'assertion-function' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'ifで絞り込んでelseで別の型になる、これがnarrowing',
  'TypeScriptのControl Flow Analysisは賢い、でも限界もある',
  '関数に切り出したら絞り込みが効かなくて「は？」となった経験',
  'narrowingを理解してからTypeScriptが楽しくなった'
] WHERE slug = 'narrowing' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'if (x != null)でnullとundefined両方弾く、!==だと片方だけ',
  '??と?.の登場でnullチェックが劇的に楽になった',
  'strictNullChecksオンにしてから人生変わった',
  'nullチェック忘れて本番でTypeError、TypeScript使ってるのに...'
] WHERE slug = 'nullish-check' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'x!と書いてnullじゃないと宣言、でもnullだったら死ぬ',
  '非nullアサーションは「俺を信じろ」宣言、asと同じ危険性',
  '!を乱用すると型安全の意味がなくなる、本当に確実な時だけ使え',
  'document.getElementById()!、このパターン多すぎ問題'
] WHERE slug = 'non-null-assertion' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'Number(x)で変換したのにNaNが返ってくる虚しさ',
  'String(x)は安全、Number(x)は危険、これ覚えとけ',
  '型強制と型アサーションは別物、前者は実行時に影響する',
  'ParseIntでも文字列渡すとNaN返すの、罠でしかない'
] WHERE slug = 'type-coercion' AND language_id = '44444444-4444-4444-4444-444444444444';

-- ユーティリティ型 (11件)
UPDATE entries SET sarcastic_notes = ARRAY[
  'Readonlyで包んでも中のオブジェクトは書き換え可能、浅いコピーと同じ罠',
  'DeepReadonlyを自作するかライブラリ入れるか、毎回悩む',
  'React.Stateをreadonly propに渡す時にReadonly使う',
  'readonlyなのに変更できる現象、TypeScript初心者が必ずハマる'
] WHERE slug = 'readonly-utility' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'T | null | undefinedからnull | undefinedを除去するNonNullable、地味に便利',
  'Exclude<T, null | undefined>と同じことをよりセマンティックに',
  'nullableな型を非nullableにしたい時の定番',
  'NonNullable知らないでExclude書いてた過去の自分に教えたい'
] WHERE slug = 'nonnullable' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'コンストラクタの引数の型をタプルで取り出すマニアックなやつ',
  'new(...args)の...argsの型を取りたい時に使う、使う機会少ない',
  'ファクトリパターン実装する時に重宝するかも',
  'Parametersのコンストラクタ版、存在知らない人多い'
] WHERE slug = 'constructor-parameters' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'クラスのインスタンスの型を取り出すInstanceType、リフレクション的',
  'typeof Classがコンストラクタ型で、InstanceType<typeof Class>がインスタンス型',
  'ジェネリックなファクトリ関数作る時に必要になる',
  '「型からインスタンス型を取る」、言葉にすると意味不明'
] WHERE slug = 'instance-type' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'thisの型を指定するマニアックなユーティリティ型',
  'メソッドチェーンのthis型を制御したい時に使う...かもしれない',
  '正直使ったことない人が大半、知識としては知っておけ',
  'オブジェクトリテラルのメソッド定義でthisを型付けする用途'
] WHERE slug = 'this-type' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'Uppercase<T>、Lowercase<T>、Capitalize<T>、Uncapitalize<T>の4兄弟',
  '型レベルで文字列操作できる、テンプレートリテラル型と組み合わせると強力',
  'APIのレスポンスキーをcamelCaseに変換する型とか作れる',
  '「型で文字列操作？」と最初は意味不明だった'
] WHERE slug = 'string-manipulation' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  '`${A}_${B}`みたいな型を作れる、文字列結合を型で表現',
  'イベント名の型を厳密に定義したい時に輝く',
  'テンプレートリテラル型で型パズルが更に複雑に、楽しいけど読めない',
  'unionとテンプレートリテラル型の組み合わせで組み合わせ爆発'
] WHERE slug = 'template-literal' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  '[K in keyof T]: T[K]という呪文、これがMapped Typesの基本',
  'Partial、Required、Readonly、全部Mapped Typesで実装されてる',
  '既存の型を変換して新しい型を作る、型のmap関数',
  'Mapped Types書けるようになったら型職人名乗っていい'
] WHERE slug = 'mapped-types' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'T extends U ? X : Yという三項演算子、型バージョン',
  '条件分岐を型レベルで書ける、プログラミングじゃん',
  'Conditional Typesとinferの組み合わせで黒魔術が始まる',
  '「型で条件分岐？」から「型でプログラミング」への進化'
] WHERE slug = 'conditional-types' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'inferは条件型の中で型を抽出するキーワード、最初は意味不明',
  'T extends Promise<infer U> ? U : Tでラップを剥がす',
  'inferを使いこなせると型パズルの難易度が上がる',
  'ReturnTypeの実装見てinferの使い方を理解する人多い'
] WHERE slug = 'infer' AND language_id = '44444444-4444-4444-4444-444444444444';

-- 高度な型 (14件)
UPDATE entries SET sarcastic_notes = ARRAY[
  'declare const x: Tで型だけ宣言、実装はJavaScript側にある前提',
  '.d.tsファイルでdeclare書きまくる日々',
  '「declareって何？」→「実装なしで型だけ宣言するやつ」',
  'ambient declarationとも呼ばれる、知らなくても困らない'
] WHERE slug = 'declare' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'namespace、ESモジュール時代には古い...と思いきや型定義では現役',
  'declare namespaceでグローバル型を拡張する技',
  'module.exports使うライブラリの型定義でnamespace見かける',
  'namespaceとmoduleの違い、説明できる人少ない'
] WHERE slug = 'namespace' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'declare module "xxx"で外部モジュールの型を宣言、型定義ファイルの基本',
  '型定義がないnpmパッケージを使う時の救済策',
  '@types/xxxがない時に自分でdeclare module書く辛さ',
  'アンビエントモジュール、名前からして近寄りがたい'
] WHERE slug = 'ambient-module' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  '同名のinterfaceが勝手にマージされる、便利なような怖いような',
  'ライブラリの型を拡張する時に宣言マージが活躍',
  'namespaceとinterfaceをマージできる、知らない人多い',
  '「なんでこのプロパティあるの」→「どこかでマージされてる」'
] WHERE slug = 'declaration-merging' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  '永遠に終わらないtype vs interface論争、結論は「好きな方使え」',
  'union/intersectionならtype、extendsならinterface、という使い分け派',
  'React propsはinterface派とtype派で分かれる',
  'どっちでも動くのに議論する時間、もったいなくない？'
] WHERE slug = 'type-vs-interface' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  '形が同じなら型が違っても代入できる、TypeScriptの根本思想',
  'Java脳で「継承してないのに代入できる？」と混乱する人多い',
  'ダックタイピングの型バージョン、これがTypeScript',
  '構造が同じなら同じ型として扱う、名前は関係ない'
] WHERE slug = 'structural-typing' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'type UserId = string & { __brand: "UserId" }で名前的型付けを実現',
  'UserIdとProductIdを取り違えるバグを型で防ぐ',
  'ブランド型は実行時コストゼロで安全性アップ',
  '__brandとか_nominalとか、アンダースコアの命名は宗教'
] WHERE slug = 'branded-type' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'オブジェクトリテラルで余計なプロパティ書くとエラー、厳しい',
  '変数経由で渡すとチェックが緩くなる罠',
  '「なんで直接渡すとエラーで変数だとOKなの」問題',
  '過剰プロパティチェックはオブジェクトリテラルだけ、これ重要'
] WHERE slug = 'excess-property' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'as constの別名、オブジェクトを完全にreadonlyにしてリテラル型推論',
  '{ readonly a: "foo" }になる、ただの{ a: string }じゃない',
  'constアサーションで配列がタプルに、これ覚えとけ',
  '設定オブジェクトをas constで定義する定番パターン'
] WHERE slug = 'const-assertion' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  '共変性と反変性、説明できたら型システムマニア',
  '関数の引数は反変、戻り値は共変、覚えたら忘れる',
  'strictFunctionTypes有効にしないと変な挙動する',
  '「varianceって何？」→「型の互換性の方向」で終わる説明'
] WHERE slug = 'variance' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'union型に条件型を適用すると各要素に分配される、最初は意味不明',
  'Exclude<A | B, A>がBになる仕組み、分配条件型のおかげ',
  '分配を止めたい時は[T]で包む、黒魔術感ある',
  'Distributive Conditional Types、名前長すぎ'
] WHERE slug = 'distributive-conditional' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'type Tree = { value: T; children: Tree[] }、自分を参照する型',
  'JSONを表現する型も再帰型、再帰データには再帰型',
  '無限再帰で「Type instantiation is excessively deep」エラー、あるある',
  '再帰型を書けると型の表現力が爆上がり'
] WHERE slug = 'recursive-type' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'declare module "xxx" { interface Yyy { ... } }で既存モジュールを拡張',
  'process.envに独自の環境変数の型を追加する定番',
  'Express.Requestにカスタムプロパティ追加する時に使う',
  'モジュール拡張できると知った時、可能性を感じた'
] WHERE slug = 'module-augmentation' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'strict: trueにして全部有効にしろ、個別に設定する意味ない',
  'noImplicitAny、strictNullChecks、これがないとTypeScriptじゃない',
  'strictを後から有効にすると地獄のエラー祭り',
  'プロジェクト開始時にstrict: true、これ絶対'
] WHERE slug = 'strict-options' AND language_id = '44444444-4444-4444-4444-444444444444';

UPDATE entries SET sarcastic_notes = ARRAY[
  'import type { X } from "y"で型だけインポート、バンドルサイズ削減',
  'isolatedModulesでtype-onlyじゃないとエラーになる設定',
  '型と値を分けてインポートする習慣、あると綺麗',
  'verbatimModuleSyntaxでimport typeが強制される未来'
] WHERE slug = 'type-only-import' AND language_id = '44444444-4444-4444-4444-444444444444';

-- ===========================================
-- SQL 悪魔のノート修正 (80件)
-- ===========================================

-- 基本クエリ (20件)
UPDATE entries SET sarcastic_notes = ARRAY[
  'SELECT * を本番環境で使って「なんで遅いの？」と言う人、毎年必ずいる',
  '「全部取ればいいや」のSELECT *が後々の悲劇を生む',
  '必要な列だけ指定しろ、通信量もメモリも無駄にするな',
  'カラム増やしたらSELECT *の結果変わって障害とか、笑えない'
] WHERE slug = 'select' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'WHERE忘れてUPDATE全件更新した時の絶望感、忘れられない',
  '= NULL書いて「条件効かないんだけど」と30分悩んだ過去',
  'ANDとORの優先順位知らないで謎の結果になるやつ、あるある',
  'インデックス効く条件と効かない条件、この差が命取り'
] WHERE slug = 'where' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'ORDER BY忘れて「なんで順番バラバラなの」と聞かれる日常',
  'NULL値のソート順がDBMSで違って本番で事故る',
  'ORDER BY + LIMITでTop N取るの定番だけど、インデックスないと地獄',
  'DESC書き忘れて昇順になってるの、レビューで指摘されがち'
] WHERE slug = 'order-by' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'OFFSET 100000でページネーションしたら激遅になって泣いた',
  'カーソルベースのページネーションを知った時の感動',
  'ORDER BY なしで LIMIT すると毎回違う結果、これバグじゃないの',
  'LIMIT 1 つけ忘れて全件取得、メモリ爆発'
] WHERE slug = 'limit-offset' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  '列名省略して全列にINSERTしようとしてカラム数エラー',
  'VALUES複数行で一気にINSERTすると速い、知らない人多すぎ',
  'RETURNING使えば挿入した値が戻ってくる、PostgreSQL最高',
  'AUTO_INCREMENTの値知りたくてSELECT MAX(id)する初心者時代'
] WHERE slug = 'insert' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'WHERE忘れて全件UPDATE、これ本当にやらかすとクビが飛ぶ',
  'トランザクション張らずにUPDATE流して巻き戻せない恐怖',
  'SET price = price * 1.1 を2回実行して値段1.21倍、冪等性大事',
  '本番DBでWHERE付きUPDATE流す前の緊張感、何年経っても慣れない'
] WHERE slug = 'update' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'WHERE忘れて全件DELETE、UPDATE以上にやばい。本当にやばい',
  '物理削除と論理削除の議論、永遠に終わらない',
  'TRUNCATEと違ってDELETEは遅い、でも条件指定できる',
  '外部キー制約でDELETEできなくて「なんで消せないの」と悩む'
] WHERE slug = 'delete' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  '前方一致以外LIKE検索でインデックス効かない、これ常識',
  '% % で囲んで部分一致、フルテーブルスキャンの始まり',
  '全文検索使えばいいのにLIKEで頑張る時代は終わった',
  'ILIKE知らなくて LOWER() || LIKE してた黒歴史'
] WHERE slug = 'like' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  '= NULL 書いて「結果0件なんだけど」と悩んだ初心者時代',
  'NULLは「値がない」じゃなくて「わからない」、三値論理の闇',
  'NOT IN にNULLが混ざると結果が空になる罠、知らない人多い',
  'COALESCE使ってNULLを潰す習慣、これ大事'
] WHERE slug = 'is-null' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'DISTINCTつけたら遅くなった、ソートが走るからね',
  'GROUP BYで代替できる場面も多い、使い分け大事',
  'DISTINCT ON (PostgreSQL)を知った時の衝撃',
  '「重複消したい」のDISTINCTがパフォーマンス問題の入口'
] WHERE slug = 'distinct' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'IN (サブクエリ) が遅すぎてEXISTSに書き換えた経験',
  'NOT IN + NULL = 結果0件、この罠に何度ハマったか',
  '1000件超のIN句でエラー、バッチ分割する羽目に',
  'IN使うかJOIN使うか、実行計画見て決めろ'
] WHERE slug = 'in' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'BETWEENは境界値含む、「以上以下」と「超未満」の違い大事',
  '日付のBETWEENで時刻部分忘れて1日分データ漏れ',
  '>= AND <= と同じだけど、BETWEENの方が読みやすいでしょ',
  'NOT BETWEEN書くより >= OR <= の方が意図明確'
] WHERE slug = 'between' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'CASEの入れ子が3段超えたら関数に切り出せ、読めない',
  'ELSE忘れてNULLが返ってきて「あれ？」となる',
  'CASE WHEN使いまくると可読性死ぬ、でも便利すぎる',
  'プログラムでやるかSQLでやるか、この判断センス問われる'
] WHERE slug = 'case' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'COALESCE知らないでNVL使ってる人、MySQLでも動くよ...動かないか',
  'NULL合体演算子のSQL版、??を知ってればすぐ理解できる',
  'COALESCE(a, b, c)で最初の非NULLを返す、地味に便利',
  'IFNULL、NVL、COALESCE、DBMS違いで混乱する'
] WHERE slug = 'coalesce' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'CONCAT vs ||、DBMS違いで動かない問題',
  'NULLと連結するとNULLになる、CONCATは大丈夫だけど',
  '文字列連結しまくるより配列使った方がいい場面もある',
  'MySQL の CONCAT_WS 便利、セパレータ付き連結'
] WHERE slug = 'concat' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  '型変換ミスって暗黙変換で性能劣化、よくある',
  'CAST vs ::（PostgreSQL）、どっち使うか統一しろ',
  '数値→文字列はいいけど逆は危険、変換エラー起きる',
  'CASTで型変えてインデックス効かなくなる罠'
] WHERE slug = 'cast' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'NOW()の結果がトランザクション内で固定されるの知らない人多い',
  'CURRENT_TIMESTAMPとNOW()の違い、説明できる？',
  'タイムゾーンの罠、UTCで保存しろ',
  'created_atにDEFAULT NOW()、これ基本'
] WHERE slug = 'now' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'DATE_TRUNC知らないでSUBSTRING使ってた黒歴史',
  'EXTRACT vs DATE_PART、PostgreSQLユーザーの日常',
  '日付計算の関数名がDBMSで違いすぎて毎回調べる',
  'タイムゾーン考慮した日付関数、これ本当に難しい'
] WHERE slug = 'date-functions' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'UPPER/LOWER/TRIMは基本、知らないと話にならない',
  'SUBSTRING vs SUBSTR vs LEFT/RIGHT、DBMS違い地獄',
  'REPLACE使いすぎて何がなんだかわからなくなる',
  'LENGTH vs CHAR_LENGTH、マルチバイトで違いが出る'
] WHERE slug = 'string-functions' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'ROUND、CEIL、FLOOR、TRUNC、違いわかってる？',
  '浮動小数点の罠、金額計算はDECIMAL使え',
  'MODで割り算の余り、% 演算子より移植性高い',
  'ABSくらいは覚えとけ、符号反転'
] WHERE slug = 'numeric-functions' AND language_id = '55555555-5555-5555-5555-555555555555';

-- 結合とサブクエリ (15件)
UPDATE entries SET sarcastic_notes = ARRAY[
  'INNER JOIN書かずにWHEREで結合してた時代、懐かしい',
  'ONの条件間違えてデカルト積になって激遅、あるある',
  'JOINしすぎて何テーブル結合してるか分からなくなる病',
  'INNER JOINは省略してJOINだけでも同じ、でも明示的に書け'
] WHERE slug = 'inner-join' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'LEFT JOINで右テーブルがNULLになる感覚、最初は混乱する',
  '「該当なし」をNULLで表現するの、ビジネス的にどうなの論争',
  'LEFT JOIN + WHERE = NULLで「存在しないもの」を探す定番',
  'RIGHT JOINはLEFT JOINで書き直せ、可読性の問題'
] WHERE slug = 'left-join' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'RIGHT JOIN使う人、見たことない。LEFT JOINで書き直せ',
  'テーブルの順序入れ替えてLEFT JOINにする方が読みやすい',
  'RIGHT JOINの存在意義、マジで分からない',
  '「RIGHT JOIN使うな」がコーディング規約に入ってる会社もある'
] WHERE slug = 'right-join' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'FULL OUTER JOIN、使う機会ほとんどない',
  '両方にないレコードも欲しい時に使う、レアケース',
  'MySQLにFULL OUTER JOINがなくてUNIONで代用する悲しみ',
  '完全外部結合の使いどころ、データ比較くらい？'
] WHERE slug = 'full-outer-join' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'CROSS JOIN、うっかり書くとデータ爆発',
  'カルテシアン積、組み合わせ生成に使うけど普段使わない',
  'JOIN条件忘れると暗黙的にCROSS JOINになるDBもある、怖い',
  '意図的に全組み合わせ欲しい時以外使うな'
] WHERE slug = 'cross-join' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  '自分自身をJOINする、最初は意味不明だった',
  '階層構造や前後比較でSELF JOIN使う、覚えておけ',
  'エイリアス必須、同じテーブルを区別するため',
  '組織図とか親子関係の表現、再帰CTEの方がモダン'
] WHERE slug = 'self-join' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'WHERE IN (SELECT ...) が遅すぎてJOINに書き換えた経験',
  'サブクエリが先に実行される勘違い、オプティマイザ任せだよ',
  '相関サブクエリは行ごとに実行される、遅い理由これ',
  'サブクエリ vs JOIN、実行計画見て判断しろ'
] WHERE slug = 'subquery-where' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'FROM句のサブクエリ、インラインビューとも呼ぶ',
  '複雑なクエリを段階的に書くのに便利',
  'サブクエリにエイリアス必須、忘れるとエラー',
  'CTEで書き直した方が読みやすい、モダンな方法'
] WHERE slug = 'subquery-from' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'SELECT句のサブクエリ、1行1列返さないとエラー',
  '相関サブクエリで行ごとに計算、遅いけど便利',
  'LATERAL JOINで代替できる場面、PostgreSQLなら',
  'スカラサブクエリ多用すると可読性死ぬ'
] WHERE slug = 'subquery-select' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'EXISTS vs IN、パフォーマンス違い説明できる？',
  'EXISTSは存在確認したら即終了、INは全部見る',
  'NOT EXISTSでNULLの罠がない、NOT INより安全',
  '「このIDに紐づくデータがあるか」はEXISTSが速い'
] WHERE slug = 'exists' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'UNION vs UNION ALL、重複削除コストを理解してる？',
  '重複がないならUNION ALLを使え、速度全然違う',
  '列数と型を合わせる必要がある、面倒',
  '複数テーブルの結果を縦に結合、これの名前が「合併」'
] WHERE slug = 'union' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'INTERSECT、両方に存在するレコードだけ、使用機会少ない',
  'INNER JOINで代替できること多い',
  'MySQLにINTERSECTがなかった時代、苦労したね',
  '集合演算、数学的には美しいけど実務では...'
] WHERE slug = 'intersect' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'EXCEPT/MINUS、DBMSで名前違う問題',
  '差集合、「Aにあって Bにないもの」を取る',
  'LEFT JOIN + IS NULLで代替する派もいる',
  'データ比較やマイグレーションチェックで使う'
] WHERE slug = 'except' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'ANY/ALL、使いこなしてる人見たことない',
  '> ALL (SELECT ...) で「全部より大きい」を表現',
  'MAX/MIN使った方が分かりやすくない？',
  'SQL標準にはあるけど実務で見かけない四天王'
] WHERE slug = 'any-all' AND language_id = '55555555-5555-5555-5555-555555555555';

-- 集約とグループ化 (16件)
UPDATE entries SET sarcastic_notes = ARRAY[
  'COUNT(*)とCOUNT(列名)の違い、NULLの扱いで差が出る',
  '1億行COUNT(*)したら終わらない、見積もり大事',
  'COUNT(DISTINCT column)の遅さに絶望した経験',
  'COUNT(1)と書く人、COUNT(*)と同じだよ'
] WHERE slug = 'count' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'SUM(NULL)がNULLになって「0じゃないの？」となる',
  '文字列をSUMしようとしてエラー、型確認しろ',
  'COALESCE(SUM(...), 0)のパターン、覚えとけ',
  '売上合計でSUM使うの基本中の基本'
] WHERE slug = 'sum' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'AVG(NULL)はスキップされる、0として計算されない',
  '整数同士の割り算で小数切り捨てられる罠、CASTしろ',
  '平均値だけ見て外れ値に騙される、統計の基本',
  'AVGと中央値の違い、ビジネスで重要'
] WHERE slug = 'avg' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'MAXとMINはNULL無視、知らないと困る',
  '日付のMAXで「最新」を取る定番',
  'ORDER BY + LIMIT 1で代替できる場面もある',
  'MAX(id)で最大ID取るの非効率、AUTO_INCREMENT使え'
] WHERE slug = 'max-min-sql' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'SELECT句に集約関数とそうでない列を混ぜると怒られる',
  'GROUP BY忘れて「エラーなんだけど」となる日常',
  'GROUP BY 1, 2みたいな数字指定、賛否両論',
  'GROUP BYに列追加するたびSELECT句も修正、面倒'
] WHERE slug = 'group-by' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'WHEREとHAVINGの違いを説明できたら中級者',
  'HAVINGは集約後のフィルタ、WHEREは集約前',
  'HAVING COUNT(*) > 5みたいな条件、WHEREでは書けない',
  'HAVING使うべきところでWHERE使って「動かない」問題'
] WHERE slug = 'having' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'GROUP_CONCAT vs STRING_AGG、DBMS違い地獄',
  '区切り文字指定忘れてカンマ区切りになる',
  'ORDER BY指定できるの知らない人多い',
  'NULLが混ざると結果がNULLになるDBもある、注意'
] WHERE slug = 'group-concat' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'ROLLUP使うと小計行が追加される、レポートに便利',
  '「これ何の行？」と聞かれるNULLの小計行',
  'GROUP BY ROLLUP(a, b)の順序で結果が変わる',
  'ExcelのピボットテーブルみたいなことがSQL'
] WHERE slug = 'rollup' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'CUBEは全組み合わせの小計、ROLLUPより多い',
  '分析用途で使うけど、結果行数が爆発する',
  'ROLLUPとCUBEの違い、聞かれると困る',
  '多次元分析、OLAPの世界に足を踏み入れる'
] WHERE slug = 'cube' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'GROUPINGでNULLが「小計行のNULL」か「本当のNULL」か判別',
  'ROLLUP/CUBEとセットで使う、単独では意味ない',
  'GROUPING_ID()でビットパターン判定、マニアック',
  '小計行だけフィルタしたい時に使う'
] WHERE slug = 'grouping' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'Window関数のPARTITION BY、GROUP BYと混同しがち',
  '行を減らさずにグループ計算できる、これが革命',
  'PARTITION BY忘れると全行が1つのウィンドウになる',
  'Window関数使いこなせたらSQL上級者名乗れる'
] WHERE slug = 'partition' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'PostgreSQL 9.4+のFILTER句、他のDBMSにない',
  'CASE WHEN + 集約関数の代替、可読性上がる',
  'COUNT(*) FILTER (WHERE status = active)みたいな書き方',
  'MySQLユーザー「そんな便利なのあるの？」'
] WHERE slug = 'filter' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'GROUP BY結果を配列で返す、JSON返すより型安全',
  'ORDER BY指定できるの地味に便利',
  'NULLの扱い注意、配列にNULL入ることもある',
  'アプリ側で配列作るよりDB側でやった方が速い場面'
] WHERE slug = 'array-agg' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'JSON_AGG vs JSON_ARRAYAGG、PostgreSQL vs MySQL',
  'ネストしたJSONを1クエリで作る、APIレスポンス生成に便利',
  'JSON_BUILD_OBJECTと組み合わせて構造作る',
  'これ知ってるとN+1問題をSQLで解決できる'
] WHERE slug = 'json-agg' AND language_id = '55555555-5555-5555-5555-555555555555';

-- 制約とインデックス (16件)
UPDATE entries SET sarcastic_notes = ARRAY[
  'PRIMARY KEY忘れてあとから追加する羽目になる',
  '自然キー vs サロゲートキー論争、終わりが見えない',
  '複合主キーにして後悔する未来',
  'UUIDを主キーにしてインデックス効率悪くなる罠'
] WHERE slug = 'primary-key' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'ON DELETE CASCADE設定忘れて「なんで消えないの」問題',
  '循環参照作ってマイグレーションでハマる',
  '外部キー制約が本番で邪魔になって無効化する悲しみ',
  'パフォーマンス理由で外部キー張らない派もいる、是非はともかく'
] WHERE slug = 'foreign-key' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'UNIQUE制約 vs UNIQUEインデックス、違い分かる？',
  'NULLが複数入れられる（DBMSによる）の罠',
  'メールアドレスにUNIQUE、これ基本',
  '複合UNIQUE制約の順序、意味あるの知ってた？'
] WHERE slug = 'unique' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'NOT NULL制約あとから追加するのデータ移行大変',
  'NULL許容にしすぎて地獄を見るか、NOT NULLにしすぎて地獄を見るか',
  'DEFAULT値とセットで設計するのが吉',
  '「この列NULLあるの？」の確認作業、何度やったか'
] WHERE slug = 'not-null' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'CHECK制約、アプリ側でバリデーションしてるからいらない説',
  'でもDBで守った方が安全、両方やるのがベスト',
  'PostgreSQLのCHECK制約は結構使う、MySQLは8.0から',
  '複雑な条件入れすぎると管理大変'
] WHERE slug = 'check' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'DEFAULT NOW()忘れてcreated_atがNULL、あるある',
  'DEFAULT使うか、アプリ側で設定するか、統一しろ',
  'DEFAULT値を後から変更、既存データには影響しない',
  '空文字列のDEFAULTはNULLより扱いやすい場面もある'
] WHERE slug = 'default' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'インデックス作りすぎてINSERTが遅くなる本末転倒',
  '「インデックスあれば速いんでしょ」という誤解',
  'カーディナリティ低い列にインデックス、意味ない',
  '複合インデックスの列順序で効果が全然違う'
] WHERE slug = 'index-create' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'UNIQUE INDEXとUNIQUE制約、実質同じだけど意味が違う',
  '重複チェック + 高速検索のセット、一石二鳥',
  'インデックス名の命名規則、チームで統一しろ',
  'UNIQUE違反エラーの原因特定に時間かかるやつ'
] WHERE slug = 'unique-index' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'インデックス消すの怖い、本番で消したら戻せない',
  'CONCURRENTLY オプション（PostgreSQL）知らないと本番事故',
  '使われてないインデックス、放置してない？',
  'DROP INDEX前にEXPLAIN見て確認、これ鉄則'
] WHERE slug = 'drop-index' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'EXPLAIN読めないとSQLチューニングできない',
  'Seq Scan見たら「インデックス効いてない」と分かる',
  'EXPLAIN ANALYZEで実際の時間が分かる、これ大事',
  '実行計画の読み方、最初は意味不明だった'
] WHERE slug = 'explain' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'ANALYZEしないと統計情報古くて実行計画がおかしい',
  '本番で定期的にANALYZE回す運用、忘れがち',
  'テーブル作りたてはANALYZE必須、統計ないから',
  'autoanalyze任せにして痛い目見た経験'
] WHERE slug = 'analyze' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'VACUUMしないとテーブル肥大化、PostgreSQLユーザーの悩み',
  'VACUUM FULLはロックかかる、本番では使うな',
  'autovacuumあるけど追いつかないことも',
  'DELETE多いテーブルは定期的にVACUUM、これ運用'
] WHERE slug = 'vacuum' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'インデックス壊れた時のREINDEX、お世話になりたくない',
  'REINDEX CONCURRENTLYで無停止リビルド、PostgreSQL 12+',
  '「なんかクエリ遅くなった」→インデックス肥大化→REINDEX',
  'インデックス再構築、定期メンテナンスに入れとけ'
] WHERE slug = 'reindex' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'ALTER TABLE ADD COLUMNで本番止まる恐怖',
  'NOT NULL + DEFAULTの追加は行数によっては地獄',
  'オンラインDDLあるDBMSとないDBMSで運用変わる',
  'スキーマ変更のダウンタイム、ゼロにするの難しい'
] WHERE slug = 'alter-table' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'TRUNCATEは速いけどROLLBACKできない、DELETE と違う',
  '外部キー参照されてるとTRUNCATEできない',
  'AUTO_INCREMENTもリセットされる、これ覚えとけ',
  'テストデータ消すのにTRUNCATE、本番で打つなよ絶対'
] WHERE slug = 'truncate' AND language_id = '55555555-5555-5555-5555-555555555555';

-- 高度な機能 (13件)
UPDATE entries SET sarcastic_notes = ARRAY[
  'ROW_NUMBERで連番振る、これ使いまくる',
  'PARTITION BY忘れて全行に1から番号振られて困惑',
  'ORDER BY忘れると順番が不定、意図した番号にならない',
  'ページネーションの実装、ROW_NUMBERが定番'
] WHERE slug = 'row-number' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'RANKとDENSE_RANKの違い、同順位の次の番号が違う',
  'RANK: 1, 1, 3（飛ぶ）、DENSE_RANK: 1, 1, 2（飛ばない）',
  'ランキング機能の実装、これで一発',
  'ROW_NUMBER vs RANK vs DENSE_RANK、要件で使い分け'
] WHERE slug = 'rank-dense-rank' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'NTILE(4)で四分位に分ける、統計処理っぽい',
  '均等に分割されないことがある、端数の扱い注意',
  '「上位25%」みたいな条件に使える',
  'NTILEの存在知らない人、結構いる'
] WHERE slug = 'ntile' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'LAGで1行前の値を取る、前日比の計算に',
  'LEADは1行後、未来予測には使えないけどね',
  'パーティション境界でNULLになる、COALESCE忘れるな',
  '自己結合で書いてた処理がLAG/LEADで一発になる快感'
] WHERE slug = 'lag-lead' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'FIRST_VALUEは最初の値、LAST_VALUEは最後...のはずが',
  'LAST_VALUEがデフォルトで現在行までになる罠',
  'ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING忘れるな',
  'Window Frame指定しないとLAST_VALUEが期待通り動かない'
] WHERE slug = 'first-last-value' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'WITH句使うと複雑なクエリが段階的に読める',
  'サブクエリのネスト地獄からの解放、CTE最高',
  'CTEを何個も定義して縦に長くなる病',
  'パフォーマンス的にはサブクエリと変わらない場合も多い'
] WHERE slug = 'cte-with' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  '再帰CTE、最初は意味不明だった',
  '階層構造の展開、ツリー構造のトラバース',
  'UNION ALLが必須、UNIONだと重複削除されて無限ループ防止',
  '無限ループしてDB死亡、再帰CTE怖い'
] WHERE slug = 'recursive-cte' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'ROWS vs RANGE vs GROUPS、違い説明できる？',
  'ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING で前後1行',
  'デフォルトのフレームを知らないと罠にハマる',
  '移動平均の実装、Window Frameで一発'
] WHERE slug = 'window-frame' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'BEGIN/COMMITで囲まないとAUTO COMMITで即確定',
  'ROLLBACKのつもりがCOMMIT打ったトラウマ',
  'トランザクション張りっぱなしでロック地獄',
  '本番障害の半分はトランザクション絡み、体感'
] WHERE slug = 'transaction' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'READ COMMITTEDとSERIALIZABLEの違い、試験に出る',
  '分離レベル上げすぎてデッドロック多発',
  'Dirty Read, Non-Repeatable Read, Phantom Read、覚えたか？',
  '本番はだいたいREAD COMMITTED、SERIALIZABLE使う機会少ない'
] WHERE slug = 'isolation-level' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'FOR UPDATE忘れて同時更新でデータ壊れた',
  'デッドロック検知、どっちのトランザクションが犠牲になるか',
  '悲観ロック vs 楽観ロック、要件で選べ',
  'ロック待ちタイムアウト、設定確認しとけ'
] WHERE slug = 'lock' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'マテビュー、VIEWと違って結果をキャッシュ',
  'REFRESH忘れて古いデータ返してた事故',
  'REFRESH MATERIALIZED VIEW CONCURRENTLY、知ってるか？',
  'バッチで定期REFRESH、リアルタイム性は諦めろ'
] WHERE slug = 'materialized-view' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'VIEWは仮想テーブル、実体はない',
  '複雑なJOINをVIEWにして見通し良く',
  'VIEWへのINSERT/UPDATE、できるけど制限多い',
  'VIEW重ねすぎてパフォーマンス死亡'
] WHERE slug = 'view' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'プレースホルダ使わないとSQLインジェクション、これ基本',
  'PREPAREで構文解析キャッシュ、同じクエリ何度も実行するなら速い',
  '$1, $2のプレースホルダ、DBMSで記法違う',
  'ORMが勝手にPrepared Statement使ってくれる時代'
] WHERE slug = 'prepared-statement' AND language_id = '55555555-5555-5555-5555-555555555555';

UPDATE entries SET sarcastic_notes = ARRAY[
  'JSON型のカラム、便利だけど設計サボりの言い訳にするな',
  '->と->>の違い、JSON型とテキスト型',
  'JSONBの方がインデックス効く、PostgreSQL',
  'JSON操作の関数名、DBMS間で互換性なさすぎ問題'
] WHERE slug = 'json-functions' AND language_id = '55555555-5555-5555-5555-555555555555';

-- ===========================================
-- HTML/CSS 悪魔のノート修正 (50件)
-- ===========================================

-- HTML基礎 (10件)
UPDATE entries SET sarcastic_notes = ARRAY[
  '<!DOCTYPE html>書き忘れてQuirks Modeで表示崩壊、懐かしい思い出',
  '昔のDOCTYPEは長くて複雑だった、HTML5で短くなって感謝',
  'これ書かないとIEで地獄を見た時代、知らない人は幸せ',
  'おまじないだと思って意味も分からず書いてた初心者時代'
] WHERE slug = 'html-doctype' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'head内にbody用のタグ書いて「なんで表示されないの」問題',
  'meta、title、link、script、何をどこに書くか覚えるまでが長い',
  'OGPタグ入れ忘れてSNSシェアで真っ白、マーケから怒られる',
  'favicon忘れて404エラーがログに溜まる'
] WHERE slug = 'html-head' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  '文字化けしたらまずcharset確認、これ基本',
  'UTF-8以外使う理由がもうない、Shift_JIS時代は終わった',
  'headの先頭に書かないと効かない、順序大事',
  'BOMあり・なしで悩んだ時代、もう気にしなくていい'
] WHERE slug = 'html-meta-charset' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'viewport忘れてスマホで豆粒サイズ、「PCでは見えてたのに」',
  'width=device-widthがないと全部おかしくなる、必須',
  'user-scalable=noは基本使うな、アクセシビリティ的にアウト',
  'maximum-scale=1.0もiOSで問題起こすから注意'
] WHERE slug = 'html-meta-viewport' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'divの入れ子地獄、通称「div病」',
  'セマンティックタグあるのに全部divで済ませる怠惰',
  'spanにdisplay: block当てて「これdivでよくない？」',
  'div vs span、ブロックとインラインの違い分かってない人多い'
] WHERE slug = 'html-div-span' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'target="_blank"でrel="noopener"忘れてセキュリティホール',
  '空のhref="#"でページ先頭に飛ぶ罠、button使え',
  'aタグにdiv入れられるようになったHTML5、革命だった',
  'mailto:のスパム収集問題、今でも悩ましい'
] WHERE slug = 'html-a' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'alt属性空っぽ、アクセシビリティ監査で怒られる',
  'width/height書かないとCLS（レイアウトシフト）でLighthouse赤点',
  'loading="lazy"知らないでJS書いてた黒歴史',
  'WebP対応してないブラウザ？もう気にしなくていいよ'
] WHERE slug = 'html-img' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'type書かないとsubmitになってフォーム送信される罠',
  'divでボタン作るな、button使え、何度言えば分かるの',
  'disabled属性でグレーアウト、でもスタイル当て直しがち',
  'buttonの中にdiv入れる是非、議論になりがち'
] WHERE slug = 'html-button' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'action属性忘れて「送信できない」問題、初心者あるある',
  'method="GET"でパスワード送信してURL丸見え事故',
  'フォームのバリデーション、HTML5だけで結構できるの知らない人多い',
  'formタグなしでinput並べて「なんで動かないの」'
] WHERE slug = 'html-form' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'type="text"だと思ったらデフォルトがtextだった',
  'type="email"だけでバリデーションかかる、知らなかった？',
  'placeholderをlabel代わりにするな、アクセシビリティ違反',
  'autocomplete="off"が効かないブラウザ問題、Chromeお前だ'
] WHERE slug = 'html-input' AND language_id = '66666666-6666-6666-6666-666666666666';

-- セマンティックHTML (10件)
UPDATE entries SET sarcastic_notes = ARRAY[
  'header使わずに<div class="header">、それセマンティックじゃない',
  'headerは1ページに1つだけと思ってた、セクションごとにOK',
  'SEO的にheaderタグ使った方がいい、という話の真偽',
  'ヘッダーにナビゲーション入れるか外に出すか、設計次第'
] WHERE slug = 'html-header' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'nav使うとスクリーンリーダーが「ナビゲーション」と読む、だから大事',
  '全部のリンク集をnav囲むのは違う、主要ナビだけ',
  'フッターのリンクはnavじゃなくていい、判断難しい',
  'nav > ul > li > a のパターン、何度書いたか'
] WHERE slug = 'html-nav' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'mainタグは1ページに1つだけ、これ守れてない人多い',
  'header/footer以外の主要コンテンツをmainで囲む、シンプル',
  'mainタグの登場でdiv id="main"から解放された',
  'IE11対応でmain { display: block } 書いてた時代'
] WHERE slug = 'html-main' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'article vs section、使い分けで毎回悩む',
  '「独立して意味をなすコンテンツ」がarticle、分かりにくい',
  'ブログ記事はarticle、これは分かりやすい',
  'articleの中にarticle、入れ子OKだけど分かりにくい'
] WHERE slug = 'html-article' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'sectionは見出し(h1-h6)とセットで使う、これ守ってる？',
  'divの代わりにsection使う病、意味ないからやめろ',
  'sectionとarticleの違い、正直曖昧',
  'アウトラインアルゴリズム、仕様上は存在するけどブラウザは実装してない'
] WHERE slug = 'html-section' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'aside=サイドバーと思いがち、補足情報という意味',
  'メインコンテンツと関連するけど独立した情報、例えば広告とか',
  'asideの中にnavがあるのはOK、サイドナビとか',
  '使いどころ難しいセマンティックタグNo.1'
] WHERE slug = 'html-aside' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'コピーライトだけのfooter、それでいいの？',
  'footerにnav入れてフッターナビ、これはOK',
  '各セクションにfooter入れていい、知らない人多い',
  'sticky footerの実装で苦労した経験、flex時代は楽になった'
] WHERE slug = 'html-footer' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'h1が複数あってSEO的にどうなの問題、今は気にしなくていい説',
  '見出しレベルを飛ばす（h1→h3）と怒られる、アクセシビリティ',
  'h1をロゴに使う是非、議論が終わらない',
  'hタグの見た目を変えるならCSSでやれ、fontタグの時代は終わった'
] WHERE slug = 'html-h1-h6' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'ul vs ol、順序があるかないかで選べ、見た目で選ぶな',
  'list-style: noneでリストに見えないリスト、それでもul/ol使う意味',
  'dl/dt/dd使ってる人、レア',
  'liの中にdivは入れられる、HTML5からOKになった'
] WHERE slug = 'html-ul-ol' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'レイアウトにtable使う時代は終わった、けどメールHTMLでは現役',
  'thead/tbody/tfoot使い分けてる人、偉い',
  'colspan/rowspanの計算ミスで崩壊、あるある',
  'レスポンシブ対応のtable、overflow-xで横スクロールが楽'
] WHERE slug = 'html-table' AND language_id = '66666666-6666-6666-6666-666666666666';

-- CSS基礎 (10件)
UPDATE entries SET sarcastic_notes = ARRAY[
  '#id vs .class、どっち使うか問題、classでいい',
  '子孫セレクタの深すぎるネスト、詳細度地獄の入口',
  '*セレクタ使うな、パフォーマンス的にアウト',
  'セレクタの書き方で性能変わる、知らない人多すぎ'
] WHERE slug = 'css-selector' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  '#fff と white どっち使う？、統一しろ',
  'rgba覚えてhsla知らない人、hslaの方が色調整しやすいぞ',
  'currentColor知ってる？親要素のcolorを継承できる',
  'カラーコードのコピペで#抜けるやつ、あるある'
] WHERE slug = 'css-color' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'font-familyにシステムフォント並べる長い記述、もう飽きた',
  'font-sizeにpx使うな、rem使え、アクセシビリティ',
  'font-weightで数値指定、フォントファイルが対応してないと意味ない',
  'ウェブフォント読み込み中のFOUT/FOIT、font-displayで制御'
] WHERE slug = 'css-font' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'marginの相殺（マージン崩壊）で「なんで余白消えた」問題',
  'padding vs margin、内側か外側か、毎回考える',
  'margin: 0 auto でセンタリング、これ基本',
  'marginにネガティブ値使う黒魔術、レイアウトが壊れる原因'
] WHERE slug = 'css-margin-padding' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'display: none vs visibility: hidden、領域残すか残さないか',
  'display: inline-block時代を経てflexの時代へ',
  'display: contents知ってる？子要素だけ残して自分消える',
  'blockとinlineの違い分からないままCSS書いてた黒歴史'
] WHERE slug = 'css-display' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'position: relative + absolute のコンボ、何度書いたか',
  'fixedがiOSで挙動おかしい問題、何年経っても直らない',
  'stickyでヘッダー固定、JSいらなくなって感動した',
  'position: absoluteで親からはみ出て「あれ？」となる'
] WHERE slug = 'css-position' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'width: 100%とwidth: autoの違い、説明できる？',
  'max-width忘れて画面から飛び出す事故',
  'heightを指定すると中身がはみ出す問題、min-height使え',
  '親要素のheightが決まってないと%が効かない罠'
] WHERE slug = 'css-width-height' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'box-sizing: border-boxをリセットCSSに入れる、これ常識',
  'content-boxで計算がめんどくさかった時代、もう戻れない',
  'paddingとborderがwidthに含まれるか問題、border-boxで解決',
  '「なんで幅超えるの」→box-sizing確認しろ'
] WHERE slug = 'css-box-sizing' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'border-radius: 50%で丸くなる、正方形の時だけな',
  'border-color: transparent使ったCSS三角形、懐かしい',
  'borderショートハンドの順序、width style colorを覚えろ',
  'outline vs border、focusにはoutline使え、レイアウト崩れない'
] WHERE slug = 'css-border' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'opacity: 0 vs visibility: hidden、イベント発火するかしないか',
  '親要素のopacity下げると子要素も薄くなる問題',
  'rgba使えば背景だけ透明にできる、opacity使うな',
  'opacity でフェードアニメーション、GPU使うから軽い'
] WHERE slug = 'css-opacity' AND language_id = '66666666-6666-6666-6666-666666666666';

-- CSSレイアウト (10件)
UPDATE entries SET sarcastic_notes = ARRAY[
  'flex覚えたらfloatに戻れない、革命だった',
  'justify-contentとalign-items、主軸と交差軸で混乱',
  'flex: 1の意味を正確に説明できる人、少ない',
  'flexbox bugs、SafariとIE11でどれだけ苦しんだか'
] WHERE slug = 'css-flexbox' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'Grid覚えたらレイアウトが楽しくなった',
  'grid-template-areas使うと視覚的に分かりやすい、でも使わない人多い',
  'fr単位知らない人、損してる',
  'FlexとGrid使い分け、1次元ならFlex、2次元ならGrid'
] WHERE slug = 'css-grid' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  '@media (max-width: 768px)、この数字どこから来た？',
  'モバイルファーストかデスクトップファーストか、統一しろ',
  'メディアクエリ増えすぎて管理不能、CSS-in-JSで解決した',
  'container queriesの登場でメディアクエリが減る...かも'
] WHERE slug = 'css-media-query' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'カスケード、継承、詳細度、CSS3大難所',
  '後から書いたCSSが勝つと思ったら詳細度で負けてた',
  '!importantで黙らせる解決法、後で自分が苦しむ',
  'どのCSSが適用されてるかDevToolsで確認する日常'
] WHERE slug = 'css-cascade' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  '詳細度の計算、覚えてもすぐ忘れる',
  'idセレクタは詳細度高すぎ、classでいい理由これ',
  '!important使うと詳細度無視、でも使うな',
  ':where()で詳細度ゼロにできる、知ってた？'
] WHERE slug = 'css-specificity' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'colorは継承されるけどborderは継承されない、覚えろ',
  'inherit / initial / unset / revert、違いを説明できる？',
  '継承を利用してbody { font-family }で全体に適用',
  'all: unsetでリセットする技、知らない人多い'
] WHERE slug = 'css-inheritance' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'z-index: 9999 vs z-index: 99999 の争い、やめろ',
  'stacking context（重ね合わせコンテキスト）理解してる？',
  'z-index効かない→親要素のposition確認しろ',
  'z-indexに負の値使える、知らない人いる'
] WHERE slug = 'css-z-index' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'overflow: hidden で floatの親要素の高さを出す裏技、古い',
  'overflow: scroll と auto の違い、スクロールバー常に出すか出さないか',
  'text-overflow: ellipsis使うならwhite-space: nowrapとセット',
  'overflow-x と overflow-y を別々に指定できる、便利'
] WHERE slug = 'css-overflow' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'float時代を経験した人、flexの有り難みが分かる',
  'clearfix書いてた時代、もう戻りたくない',
  '今floatが必要なの、テキスト回り込みくらい',
  'float: noneでリセット、昔のCSSフレームワークあるある'
] WHERE slug = 'css-float' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'transform: translateX(-50%)でセンタリング、古典的テクニック',
  'transform: scale(1.1)でホバーエフェクト、定番',
  'transformはレイアウトに影響しない、これ重要',
  '3D transformでハードウェアアクセラレーション、パフォーマンスtips'
] WHERE slug = 'css-transform' AND language_id = '66666666-6666-6666-6666-666666666666';

-- CSS応用 (10件)
UPDATE entries SET sarcastic_notes = ARRAY[
  '--で始まる変数、Sassなしで変数使える時代',
  ':root { --color-primary: #007bff } がデザインシステムの始まり',
  'var(--xxx, fallback)でフォールバック設定できる',
  'CSS変数はJSから操作できる、これ知ってると便利'
] WHERE slug = 'css-custom-property' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'calc(100% - 20px)で計算できる、革命だった',
  'calc(100vh - ヘッダー高さ)でfullscreen風レイアウト',
  'calc()の中でCSS変数使える、組み合わせ最強',
  '単位違いの計算ができる、pxと%を混ぜられる'
] WHERE slug = 'css-calc' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  ':hover :focus :active、状態変化の三銃士',
  ':nth-child(odd)で縞模様、これ便利',
  ':not()セレクタ知らないと無駄なCSS書くことになる',
  ':is()と:where()、詳細度が違うの知ってた？'
] WHERE slug = 'css-pseudo-class' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  '::before ::after、contentプロパティ必須',
  '疑似要素でアイコン表示、Font Awesome時代の定番',
  '::placeholder でプレースホルダーの色変える',
  '::selection、テキスト選択時のスタイル変えられる'
] WHERE slug = 'css-pseudo-element' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'transition: all 0.3s ease、とりあえずこれ書く',
  'transitionをallにするとパフォーマンス悪い、プロパティ指定しろ',
  'cubic-bezierでイージングカスタマイズ、こだわり派',
  'hover時にtransition書くかデフォルトに書くかで議論'
] WHERE slug = 'css-transition' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  '@keyframesで複雑なアニメーション、CSS単体でここまでできる',
  'animation-fill-mode: forwards、終了状態を維持',
  'animation-play-state: paused、JSから制御できる',
  'アニメーションの無限ループ、battery消耗するからモバイルは控えめに'
] WHERE slug = 'css-animation' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'clamp(最小, 推奨, 最大)、レスポンシブフォントサイズに最適',
  'メディアクエリ書かずに可変サイズ実現、clamp神',
  'clamp(1rem, 2vw, 2rem)みたいな書き方',
  '古いブラウザでclamp効かない、フォールバック書けよ'
] WHERE slug = 'css-clamp' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'min()とmax()、名前と逆の動きをする感覚に混乱',
  'width: min(100%, 1200px)でmax-widthの代替',
  'calc()と組み合わせてさらに複雑な計算',
  'IE11対応でmin()/max()使えなかった時代、辛かった'
] WHERE slug = 'css-min-max' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'aspect-ratio: 16 / 9、padding-topハックから解放',
  '動画やiframeの比率維持が楽になった、神',
  'aspect-ratio + object-fit: coverのコンボ',
  '古いブラウザ対応でpadding-top: 56.25%書いてた時代、懐かしい'
] WHERE slug = 'css-aspect-ratio' AND language_id = '66666666-6666-6666-6666-666666666666';

UPDATE entries SET sarcastic_notes = ARRAY[
  'flex/gridの子要素間の余白、marginじゃなくてgapで',
  'row-gapとcolumn-gap、両方いっぺんにgapで指定できる',
  'flexboxでgap使えるようになったの最近、昔はmarginで頑張ってた',
  'IE11でgap使えない、さっさと滅びろIE'
] WHERE slug = 'css-gap' AND language_id = '66666666-6666-6666-6666-666666666666';
