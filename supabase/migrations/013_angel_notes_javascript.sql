-- 013_angel_notes_javascript.sql
-- JavaScript 天使のノート（49件）
-- 実用的なTips、ベストプラクティス、注意点

-- Array.prototype.map()
UPDATE entries SET angel_title = '配列変換の基本', angel_notes = ARRAY['元の配列は変更されない（イミュータブル）', 'コールバックの第2引数でインデックスを取得', '空の要素はスキップされる'] WHERE slug = 'array-map' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.filter()
UPDATE entries SET angel_title = '条件抽出の定番', angel_notes = ARRAY['truthyな値を返す要素だけが残る', 'Boolean関数を渡すとfalsyな値を除去', 'findとの違い：filterは配列、findは単一値'] WHERE slug = 'array-filter' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.reduce()
UPDATE entries SET angel_title = '汎用的な集約処理', angel_notes = ARRAY['初期値を省略すると最初の要素が使われる', 'オブジェクトへの変換にも使える', '複雑な処理はforループの方が読みやすい場合も'] WHERE slug = 'array-reduce' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.forEach()
UPDATE entries SET angel_title = 'シンプルな反復処理', angel_notes = ARRAY['戻り値は常にundefined', 'breakやcontinueは使えない', '途中で止めたい場合はsome/everyを検討'] WHERE slug = 'array-foreach' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.find()
UPDATE entries SET angel_title = '要素検索の便利メソッド', angel_notes = ARRAY['見つからない場合はundefinedを返す', '最初にマッチした要素のみ返す', 'インデックスが欲しい場合はfindIndexを使う'] WHERE slug = 'array-find' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.some()
UPDATE entries SET angel_title = '存在チェックの効率化', angel_notes = ARRAY['条件を満たす要素が1つでもあればtrue', '見つかった時点で評価を終了（短絡評価）', 'includesで足りる場合はincludesの方がシンプル'] WHERE slug = 'array-some' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.every()
UPDATE entries SET angel_title = '全要素チェック', angel_notes = ARRAY['全要素が条件を満たせばtrue', '空配列に対しては常にtrueを返す', '1つでも失敗したら即座にfalse（短絡評価）'] WHERE slug = 'array-every' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.includes()
UPDATE entries SET angel_title = '含有チェックの定番', angel_notes = ARRAY['NaNも正しく検出できる', '第2引数で検索開始位置を指定可能', 'オブジェクトの比較は参照で行われる'] WHERE slug = 'array-includes' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.sort()
UPDATE entries SET angel_title = '配列ソートの注意点', angel_notes = ARRAY['元の配列を変更する（破壊的メソッド）', 'デフォルトは文字列としてソート', '数値ソートは比較関数が必須'] WHERE slug = 'array-sort' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.slice()
UPDATE entries SET angel_title = '部分配列の抽出', angel_notes = ARRAY['元の配列は変更されない', '負のインデックスで末尾から指定可能', '引数なしで浅いコピーを作成'] WHERE slug = 'array-slice' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.splice()
UPDATE entries SET angel_title = '配列の直接操作', angel_notes = ARRAY['元の配列を変更する（破壊的）', '削除・挿入・置換が1メソッドで可能', '削除された要素が配列として返る'] WHERE slug = 'array-splice' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.concat()
UPDATE entries SET angel_title = '配列の結合', angel_notes = ARRAY['元の配列は変更されない', 'スプレッド構文 [...a, ...b] でも同じことが可能', 'ネストした配列はフラット化されない'] WHERE slug = 'array-concat' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.flat()
UPDATE entries SET angel_title = 'ネスト配列の平坦化', angel_notes = ARRAY['デフォルトは1階層のみ', 'Infinity指定で完全にフラット化', 'flatMapで変換と平坦化を同時に'] WHERE slug = 'array-flat' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.join()
UPDATE entries SET angel_title = '配列を文字列に', angel_notes = ARRAY['デフォルトの区切り文字はカンマ', '空文字で連結すると区切りなし', 'nullやundefinedは空文字になる'] WHERE slug = 'array-join' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.from()
UPDATE entries SET angel_title = '配列への変換', angel_notes = ARRAY['文字列、NodeList、Setなどを配列に', '第2引数でmap処理を同時に実行可能', '配列のコピーにも使える'] WHERE slug = 'array-from' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.isArray()
UPDATE entries SET angel_title = '配列判定の正解', angel_notes = ARRAY['typeofでは配列かどうか判定できない', 'instanceof より確実（iframe対応）', 'nullやundefinedにも安全に使える'] WHERE slug = 'array-isarray' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- console.log()
UPDATE entries SET angel_title = 'デバッグの第一歩', angel_notes = ARRAY['複数の値をカンマ区切りで渡せる', 'オブジェクトの中身を確認するのに便利', '本番環境では削除するか適切なロギングに置き換える'] WHERE slug = 'console-log' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- console.error()
UPDATE entries SET angel_title = 'エラー出力の標準', angel_notes = ARRAY['stderrに出力される', 'ブラウザでは赤色で表示', 'スタックトレースも一緒に出すと便利'] WHERE slug = 'console-error' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- console.warn()
UPDATE entries SET angel_title = '警告の出力', angel_notes = ARRAY['ブラウザでは黄色で表示', '非推奨機能の使用時などに', 'console.errorほど深刻ではない問題に'] WHERE slug = 'console-warn' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- console.table()
UPDATE entries SET angel_title = '表形式でのデバッグ', angel_notes = ARRAY['配列やオブジェクトを表で表示', '第2引数で表示するプロパティを選択', '大量データの確認に便利'] WHERE slug = 'console-table' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- console.time() / console.timeEnd()
UPDATE entries SET angel_title = '処理時間の計測', angel_notes = ARRAY['同じラベルでtime/timeEndをペアで使う', 'ミリ秒単位で計測', 'パフォーマンス改善の前後比較に'] WHERE slug = 'console-time' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- JSON.parse()
UPDATE entries SET angel_title = 'JSONを安全にパース', angel_notes = ARRAY['不正なJSONはSyntaxErrorを投げる', 'try-catchで囲むのが安全', 'reviverで変換処理をカスタマイズ可能'] WHERE slug = 'json-parse' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- JSON.stringify()
UPDATE entries SET angel_title = 'JSONへの変換', angel_notes = ARRAY['循環参照があるとエラーになる', '第3引数でインデント付きの整形出力', 'undefinedやfunctionは変換で消える'] WHERE slug = 'json-stringify' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Object.keys()
UPDATE entries SET angel_title = 'キー一覧の取得', angel_notes = ARRAY['列挙可能なプロパティのみ', '配列に対して使うとインデックスの配列', 'Symbol キーは含まれない'] WHERE slug = 'object-keys' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Object.values()
UPDATE entries SET angel_title = '値一覧の取得', angel_notes = ARRAY['キーの順序で値が並ぶ', 'Object.keysとmapの組み合わせより簡潔', 'ES2017で追加された比較的新しいメソッド'] WHERE slug = 'object-values' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Object.entries()
UPDATE entries SET angel_title = 'キーと値のペア取得', angel_notes = ARRAY['[key, value] の配列の配列を返す', 'for...of との組み合わせが便利', 'Object.fromEntries() で逆変換'] WHERE slug = 'object-entries' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Object.assign()
UPDATE entries SET angel_title = 'オブジェクトのマージ', angel_notes = ARRAY['第1引数のオブジェクトを変更する', '浅いコピーなのでネストに注意', 'スプレッド構文 {...obj} の方が一般的'] WHERE slug = 'object-assign' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Object.freeze()
UPDATE entries SET angel_title = 'オブジェクトの凍結', angel_notes = ARRAY['プロパティの追加・削除・変更を禁止', '浅い凍結なのでネストは凍結されない', 'strict modeでないとエラーにならない'] WHERE slug = 'object-freeze' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.prototype.split()
UPDATE entries SET angel_title = '文字列を配列に', angel_notes = ARRAY['第2引数で分割数の上限を指定', '空文字で分割すると1文字ずつの配列', '正規表現も使用可能'] WHERE slug = 'string-split' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.prototype.trim()
UPDATE entries SET angel_title = '前後の空白除去', angel_notes = ARRAY['改行やタブも除去される', 'trimStart/trimEndで片側だけも可能', '元の文字列は変更されない'] WHERE slug = 'string-trim' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.prototype.replace()
UPDATE entries SET angel_title = '文字列の置換', angel_notes = ARRAY['デフォルトは最初の1つだけ置換', 'gフラグ付き正規表現で全置換', 'replaceAllも使える（ES2021）'] WHERE slug = 'string-replace' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.prototype.substring()
UPDATE entries SET angel_title = '部分文字列の抽出', angel_notes = ARRAY['負の値は0として扱われる', 'start > end の場合は自動で入れ替え', 'sliceの方が直感的な場合も多い'] WHERE slug = 'string-substring' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.prototype.charAt()
UPDATE entries SET angel_title = '文字の取得', angel_notes = ARRAY['範囲外は空文字を返す', '[]アクセスでもほぼ同じ結果', 'サロゲートペアには非対応'] WHERE slug = 'string-charat' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.prototype.indexOf()
UPDATE entries SET angel_title = '文字列検索', angel_notes = ARRAY['見つからない場合は-1を返す', '第2引数で検索開始位置を指定', 'includesの方がシンプルな場合も'] WHERE slug = 'string-indexof' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.prototype.startsWith()
UPDATE entries SET angel_title = '先頭一致の判定', angel_notes = ARRAY['大文字小文字を区別する', '第2引数で検索開始位置を指定可能', 'URL判定などに便利'] WHERE slug = 'string-startswith' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.prototype.endsWith()
UPDATE entries SET angel_title = '末尾一致の判定', angel_notes = ARRAY['拡張子チェックなどに便利', '第2引数で検索終了位置を指定可能', 'startsWithと対になるメソッド'] WHERE slug = 'string-endswith' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.prototype.padStart()
UPDATE entries SET angel_title = '先頭埋め文字', angel_notes = ARRAY['ゼロパディングに便利', '指定長より長い場合は何もしない', '第2引数を省略するとスペースで埋める'] WHERE slug = 'string-padstart' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.prototype.repeat()
UPDATE entries SET angel_title = '文字列の繰り返し', angel_notes = ARRAY['0を渡すと空文字を返す', '小数は切り捨てられる', '負の数はRangeErrorになる'] WHERE slug = 'string-repeat' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Promise
UPDATE entries SET angel_title = '非同期処理の基本', angel_notes = ARRAY['3つの状態：pending, fulfilled, rejected', 'async/awaitの方が読みやすい場合も', 'catchは必ず付ける習慣を'] WHERE slug = 'promise' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Promise.all()
UPDATE entries SET angel_title = '並列実行と待機', angel_notes = ARRAY['1つでも失敗すると全体が失敗', '成功時は結果の配列を返す', '独立した複数のAPI呼び出しに最適'] WHERE slug = 'promise-all' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Promise.race()
UPDATE entries SET angel_title = '最速の結果を取得', angel_notes = ARRAY['最初に完了したPromiseの結果を返す', 'タイムアウト実装に使える', '他のPromiseはキャンセルされない'] WHERE slug = 'promise-race' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- async/await
UPDATE entries SET angel_title = '非同期の同期的記述', angel_notes = ARRAY['Promiseを返す関数の前でawait', 'try-catchでエラーハンドリング', 'トップレベルawaitはES2022から'] WHERE slug = 'async-await' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- fetch()
UPDATE entries SET angel_title = 'HTTP通信の標準', angel_notes = ARRAY['404でもrejectしない（ok プロパティで判定）', 'JSONはresponse.json()で取得', 'AbortControllerでキャンセル可能'] WHERE slug = 'fetch' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- setTimeout()
UPDATE entries SET angel_title = '遅延実行', angel_notes = ARRAY['clearTimeout()でキャンセル可能', '0msでも即時実行ではない', 'setIntervalより再帰的なsetTimeoutの方が安全'] WHERE slug = 'settimeout' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- setInterval()
UPDATE entries SET angel_title = '定期実行', angel_notes = ARRAY['clearInterval()で停止', '処理時間が間隔を超えると溜まる', '長時間実行には注意が必要'] WHERE slug = 'setinterval' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Map
UPDATE entries SET angel_title = 'キーバリューの新定番', angel_notes = ARRAY['オブジェクトをキーにできる', 'sizeプロパティで要素数を取得', '順序が保証される'] WHERE slug = 'map' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Set
UPDATE entries SET angel_title = '重複なしコレクション', angel_notes = ARRAY['配列の重複除去：[...new Set(arr)]', 'has()で存在確認（O(1)）', 'オブジェクトは参照で比較'] WHERE slug = 'set' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Spread Operator
UPDATE entries SET angel_title = '展開構文の活用', angel_notes = ARRAY['配列のコピー：[...arr]', 'オブジェクトのマージ：{...a, ...b}', '関数呼び出し時の引数展開にも'] WHERE slug = 'spread-operator' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Destructuring
UPDATE entries SET angel_title = '分割代入の基本', angel_notes = ARRAY['デフォルト値を設定可能', 'ネストした構造にも対応', '関数の引数で直接分割可能'] WHERE slug = 'destructuring' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');
