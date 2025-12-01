-- 016_devil_notes_javascript.sql
-- JavaScript 悪魔のノート（49件）
-- 本物の皮肉、開発者あるある、★★★★★レベル

-- Array.prototype.map()
UPDATE entries SET sarcastic_title = '配列変換の魔術', sarcastic_notes = ARRAY['map() の中で副作用起こす人、forEach() 使えよ', '.map().filter().reduce() チェーン芸、パフォーマンス死ぬぞ', 'return 書き忘れて undefined だらけの配列作った回数'] WHERE slug = 'array-map' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.filter()
UPDATE entries SET sarcastic_title = '条件抽出の刃', sarcastic_notes = ARRAY['filter(Boolean) で falsy 除去できるの、知らない人多すぎ', 'filter() と find() 間違えて配列と単一値で型エラー', '「filter の方が読みやすい」と言いながら reduce で書く人'] WHERE slug = 'array-filter' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.reduce()
UPDATE entries SET sarcastic_title = '万能ナイフ症候群', sarcastic_notes = ARRAY['reduce で何でもできるからって何でも reduce で書くな', '初期値なしで空配列渡してエラー、何回やった？', '「reduce 使えばワンライナー」←読めないワンライナーに価値はない'] WHERE slug = 'array-reduce' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.forEach()
UPDATE entries SET sarcastic_title = 'ループの誘惑', sarcastic_notes = ARRAY['forEach() で async/await 使って「なぜ待たない？」と絶望', 'return しても何も返らない、それ forEach の仕様だから', 'break したくなったら forEach 使うな、for...of 使え'] WHERE slug = 'array-foreach' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.find()
UPDATE entries SET sarcastic_title = '要素探索の旅', sarcastic_notes = ARRAY['find() で見つからなくて undefined、== null で判定して事故', 'filter()[0] って書いてる人、find() 使えよ', '「find は最初の1つだけ」を知らずに全部取れると思ってた新人'] WHERE slug = 'array-find' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.some()
UPDATE entries SET sarcastic_title = '存在確認の一撃', sarcastic_notes = ARRAY['filter().length > 0 って書いてる人、some() 使えば一発', 'some() と every() 逆に覚えてバグ出した回数', '「some は短絡評価」を知らずにパフォーマンス損してた'] WHERE slug = 'array-some' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.every()
UPDATE entries SET sarcastic_title = '全員合格判定', sarcastic_notes = ARRAY['空配列で every() が true 返すの、直感に反するよね', 'some と every、名前だけじゃ挙動分からんのよ', '!arr.some(x => !condition) と arr.every(condition)、同じだけど'] WHERE slug = 'array-every' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.includes()
UPDATE entries SET sarcastic_title = '含有チェッカー', sarcastic_notes = ARRAY['indexOf() !== -1 って書いてる人、includes() の存在知ってる？', 'NaN を includes() で見つけられるの、indexOf() との違い', 'オブジェクトの includes()、参照比較だから同じ値でも false'] WHERE slug = 'array-includes' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.sort()
UPDATE entries SET sarcastic_title = '破壊的ソートの罠', sarcastic_notes = ARRAY['[10, 2, 1].sort() が [1, 10, 2] になる JS の闇', 'sort() が元配列を変更するの忘れてバグ量産', 'toSorted() 使えばいいのに、まだ sort() でコピーしてから？'] WHERE slug = 'array-sort' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.slice()
UPDATE entries SET sarcastic_title = '部分切り出し師', sarcastic_notes = ARRAY['slice() と splice() 間違えて元配列ぶっ壊した経験', '配列コピーに [...arr] か slice() か、宗教戦争', 'slice(-1)[0] で最後の要素取れるの、at(-1) 使えばいいのに'] WHERE slug = 'array-slice' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.splice()
UPDATE entries SET sarcastic_title = '配列手術の危険', sarcastic_notes = ARRAY['splice() の引数の順番、毎回ドキュメント見る', '削除した要素が返るの、元配列が変わるの、両方で混乱', 'slice と splice、名前似すぎ問題'] WHERE slug = 'array-splice' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.concat()
UPDATE entries SET sarcastic_title = '配列結合の古参', sarcastic_notes = ARRAY['[...arr1, ...arr2] 時代に concat() 使ってる人、懐古主義？', 'concat() でネストした配列がフラットにならなくて「え？」', 'push(...arr) と concat()、破壊的かどうかで使い分け'] WHERE slug = 'array-concat' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.flat()
UPDATE entries SET sarcastic_title = 'ネスト崩壊装置', sarcastic_notes = ARRAY['flat(Infinity) で完全フラット化、怖いけど便利', 'flatMap() の存在を知らずに map().flat() してた時代', 'flat() がないブラウザ対応で polyfill 地獄'] WHERE slug = 'array-flat' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.prototype.join()
UPDATE entries SET sarcastic_title = '文字列化の儀式', sarcastic_notes = ARRAY['join() のデフォルトがカンマなの、空文字指定忘れがち', 'null や undefined が "null", "undefined" になる罠', 'split() と join() のペア、文字列操作の定番技'] WHERE slug = 'array-join' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.from()
UPDATE entries SET sarcastic_title = '配列変換の魔法', sarcastic_notes = ARRAY['NodeList を配列にするやつ、[...nodeList] でもできるけど', 'Array.from({length: 5}, (_, i) => i) ←これ初見で理解できる？', 'arguments を配列にする時代、rest parameter 使えば不要'] WHERE slug = 'array-from' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.isArray()
UPDATE entries SET sarcastic_title = '配列判定官', sarcastic_notes = ARRAY['typeof [] が "object" 返す JS の闇を救う関数', 'instanceof Array が iframe 跨ぐと壊れる問題を解決', '配列かどうか判定するのにこんな関数が必要な言語'] WHERE slug = 'array-isarray' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- console.log()
UPDATE entries SET sarcastic_title = 'デバッグの王様', sarcastic_notes = ARRAY['本番に console.log 残してリリースした回数、正直に言え', '「console.log デバッグで十分」←debugger 使ったことある？', 'console.log(obj) でオブジェクトの中身が後から変わる罠'] WHERE slug = 'console-log' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- console.error()
UPDATE entries SET sarcastic_title = 'エラー出力の赤い警告', sarcastic_notes = ARRAY['console.log で十分なのに error 使ってる人、几帳面すぎ', 'catch ブロックで console.error(e) だけ、それで終わり？', 'Sentry とか入れてるのに console.error も書く、二重管理'] WHERE slug = 'console-error' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- console.warn()
UPDATE entries SET sarcastic_title = '黄色い注意報', sarcastic_notes = ARRAY['warn 出してるけど誰も見てない、あるある', '「これ warning です」←それ、error じゃないの？', 'React の Warning: 、無視し続けて後で痛い目見る'] WHERE slug = 'console-warn' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- console.table()
UPDATE entries SET sarcastic_title = '表形式デバッグ', sarcastic_notes = ARRAY['console.table() の存在を知らずに console.log で配列を見てた日々', '「表で見やすい！」と思ったけど結局 log に戻る', 'ネストしたオブジェクトは見づらい、万能ではない'] WHERE slug = 'console-table' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- console.time() / console.timeEnd()
UPDATE entries SET sarcastic_title = '処理時間計測器', sarcastic_notes = ARRAY['Performance API 使えばいいのに console.time で済ませる', 'ラベル間違えて timeEnd がマッチしない、地味にハマる', '「このループ遅い」を証明するために毎回使う'] WHERE slug = 'console-time' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- JSON.parse()
UPDATE entries SET sarcastic_title = '文字列からの復活', sarcastic_notes = ARRAY['不正な JSON で SyntaxError 吐いて「なんで？」', 'try-catch 忘れてアプリがクラッシュ、本番で', 'JSON.parse(JSON.stringify(obj)) でディープコピー、遅いけど'] WHERE slug = 'json-parse' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- JSON.stringify()
UPDATE entries SET sarcastic_title = 'オブジェクトの文字列化', sarcastic_notes = ARRAY['循環参照で TypeError、「なんで stringify できない？」', 'undefined と function が消える仕様、知らなかった人多い', '第3引数でインデント入れられるの、デバッグ時だけ使う'] WHERE slug = 'json-stringify' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Object.keys()
UPDATE entries SET sarcastic_title = 'キー一覧取得係', sarcastic_notes = ARRAY['for...in で十分なのに Object.keys().forEach() する人', 'Symbol キーが取れないの、知ってた？', '配列に使うとインデックスが文字列で返る、地味に罠'] WHERE slug = 'object-keys' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Object.values()
UPDATE entries SET sarcastic_title = '値だけ抽出器', sarcastic_notes = ARRAY['ES2017 で追加、IE 対応で使えなかった悲しい時代', 'Object.keys().map(k => obj[k]) って書いてた頃が懐かしい', '順序保証の話、オブジェクトのキー順って実は仕様あるの'] WHERE slug = 'object-values' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Object.entries()
UPDATE entries SET sarcastic_title = 'キーと値のペア', sarcastic_notes = ARRAY['for (const [key, value] of Object.entries(obj)) ←長い', 'Object.fromEntries() で逆変換、知ってる人少ない', 'Map に変換: new Map(Object.entries(obj))、便利だけど'] WHERE slug = 'object-entries' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Object.assign()
UPDATE entries SET sarcastic_title = 'オブジェクトマージャー', sarcastic_notes = ARRAY['スプレッド構文 {...obj} 時代に assign 使う理由、ある？', '第1引数が変更されるの忘れて元オブジェクト壊す', '浅いコピーだから、ネストしたオブジェクトは参照のまま'] WHERE slug = 'object-assign' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Object.freeze()
UPDATE entries SET sarcastic_title = '凍結の魔法', sarcastic_notes = ARRAY['浅い凍結だから、ネストは普通に変更できちゃう', 'strict mode じゃないとエラーにもならず黙って失敗', 'Immutable.js 使えばいいのに freeze で頑張る人'] WHERE slug = 'object-freeze' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.prototype.split()
UPDATE entries SET sarcastic_title = '文字列分割師', sarcastic_notes = ARRAY['split("") で1文字ずつ、サロゲートペアで壊れるの知ってる？', '正規表現でスプリット、キャプチャグループあると結果に含まれる罠', 'limit 引数の存在、意外と知られてない'] WHERE slug = 'string-split' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.prototype.trim()
UPDATE entries SET sarcastic_title = '空白の処刑人', sarcastic_notes = ARRAY['IE8 で trim() なくて polyfill 地獄だった時代', 'trimStart/trimEnd (trimLeft/trimRight)、どっちが新しい名前？', '全角スペースも消えるの、日本語処理で助かる'] WHERE slug = 'string-trim' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.prototype.replace()
UPDATE entries SET sarcastic_title = '置換の罠', sarcastic_notes = ARRAY['最初の1つしか置換されないの忘れて「なんで全部変わらない？」', 'g フラグ付き正規表現か replaceAll か、どっち使う？', '$1, $2 でキャプチャグループ使えるの、知らない人多い'] WHERE slug = 'string-replace' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.prototype.substring()
UPDATE entries SET sarcastic_title = '部分文字列の兄弟', sarcastic_notes = ARRAY['substring, substr, slice の違い、毎回調べる', 'substr は非推奨なの知ってた？', 'substring(5, 2) が substring(2, 5) と同じ動作、は？'] WHERE slug = 'string-substring' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.prototype.charAt()
UPDATE entries SET sarcastic_title = 'インデックスアクセスの元祖', sarcastic_notes = ARRAY['str[0] で済むのに charAt(0) 使う人、IE6 対応？', 'サロゲートペアで半分の文字が返る、絵文字時代の罠', 'at() メソッド使えば負のインデックスも使える'] WHERE slug = 'string-charat' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.prototype.indexOf()
UPDATE entries SET sarcastic_title = '文字列検索の古参', sarcastic_notes = ARRAY['indexOf() !== -1 って書くより includes() 使えよ', '-1 返すの、なんで null や undefined じゃないの', 'lastIndexOf との使い分け、正直あんまり使わない'] WHERE slug = 'string-indexof' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.prototype.startsWith()
UPDATE entries SET sarcastic_title = '先頭チェッカー', sarcastic_notes = ARRAY['indexOf() === 0 って書いてた時代があったよね', 'URL判定で startsWith("http") 使うけど、// から始まるのもあるぞ', 'ES6 で追加、IE 死んでよかった'] WHERE slug = 'string-startswith' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.prototype.endsWith()
UPDATE entries SET sarcastic_title = '末尾チェッカー', sarcastic_notes = ARRAY['拡張子判定に使うけど .JPEG と .jpeg 両方チェックしてる？', 'slice(-n) === suffix って書いてた時代もあった', '第2引数で検索終了位置指定できるの、使ったことない'] WHERE slug = 'string-endswith' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.prototype.padStart()
UPDATE entries SET sarcastic_title = 'ゼロ埋めの救世主', sarcastic_notes = ARRAY['("0" + n).slice(-2) って書いてた時代が懐かしい', '日付のゼロパディング、毎回これ使う', 'padEnd との使い分け、表の整形くらいしか使わない'] WHERE slug = 'string-padstart' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.prototype.repeat()
UPDATE entries SET sarcastic_title = '文字列増殖器', sarcastic_notes = ARRAY['"=".repeat(50) でセパレーター作る、地味に便利', 'Array(n+1).join(str) って書いてた時代もあった', '負の数渡すと RangeError、0 は空文字'] WHERE slug = 'string-repeat' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Promise
UPDATE entries SET sarcastic_title = '非同期の約束', sarcastic_notes = ARRAY['Promise 地獄から async/await で救われた人、手を挙げて', '.then().then().then() チェーン、結局コールバック地獄と変わらん', 'reject されたのに catch 忘れて UnhandledPromiseRejection'] WHERE slug = 'promise' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Promise.all()
UPDATE entries SET sarcastic_title = '全員待機の刑', sarcastic_notes = ARRAY['1つ失敗すると全部失敗、Promise.allSettled 使えよ', '並列実行してると思ったら、実は作成時点で開始してる', '空配列渡すと即座に resolve、これ仕様通りだけど'] WHERE slug = 'promise-all' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Promise.race()
UPDATE entries SET sarcastic_title = '早い者勝ちレース', sarcastic_notes = ARRAY['タイムアウト実装に使うけど、他の Promise はキャンセルされない', '空配列渡すと永遠に pending、これ罠だろ', 'Promise.any() との違い、reject の扱いが違う'] WHERE slug = 'promise-race' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- async/await
UPDATE entries SET sarcastic_title = '非同期の救世主', sarcastic_notes = ARRAY['await 付け忘れて Promise オブジェクト直接使って「なんで？」', 'forEach 内で await しても待たない、for...of 使え', 'try-catch ネストしすぎてコールバック地獄の再来'] WHERE slug = 'async-await' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- fetch()
UPDATE entries SET sarcastic_title = 'HTTP 通信の新星', sarcastic_notes = ARRAY['404 でも reject しないの、response.ok チェック必須', 'axios 入れる前に fetch で十分か考えろ', 'AbortController でキャンセルできるの、知らない人多い'] WHERE slug = 'fetch' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- setTimeout()
UPDATE entries SET sarcastic_title = '遅延実行の罠', sarcastic_notes = ARRAY['setTimeout(fn, 0) で「すぐ実行」と思ったら違った', 'this の束縛忘れてアロー関数で回避、あるある', 'clearTimeout 忘れてメモリリーク、React でやりがち'] WHERE slug = 'settimeout' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- setInterval()
UPDATE entries SET sarcastic_title = '定期実行の危険', sarcastic_notes = ARRAY['clearInterval 忘れて無限にAPIコールしてサーバー殺した', '処理時間が interval 超えると地獄、setTimeout で再帰した方が安全', 'React で useEffect のクリーンアップ忘れて二重実行'] WHERE slug = 'setinterval' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Map
UPDATE entries SET sarcastic_title = 'モダンな辞書', sarcastic_notes = ARRAY['Object でいいのに Map 使う人、過剰設計では？', 'JSON.stringify で Map が {} になるの、シリアライズ自前必要', 'オブジェクトをキーにできるの、使いどころ難しい'] WHERE slug = 'map' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Set
UPDATE entries SET sarcastic_title = '重複排除の救世主', sarcastic_notes = ARRAY['[...new Set(arr)] で重複除去、これ知らない人まだいる？', 'オブジェクトの重複は除去できない、参照比較だから', 'Array.from(new Set(arr)) と書くか、スプレッドか、宗教'] WHERE slug = 'set' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Spread Operator
UPDATE entries SET sarcastic_title = '展開の魔法', sarcastic_notes = ARRAY['浅いコピーしかできないの忘れてバグ、あるある', '[...arr1, ...arr2, ...arr3] のパフォーマンス、気にしてる？', 'オブジェクトのスプレッド、後勝ちルール覚えてる？'] WHERE slug = 'spread-operator' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Destructuring
UPDATE entries SET sarcastic_title = '分割代入の誘惑', sarcastic_notes = ARRAY['const { a: { b: { c } } } = obj ←読めるか？これ', 'デフォルト値の罠、null と undefined で挙動違う', '「分割代入使いこなせる＝JS中級者」って本当？'] WHERE slug = 'destructuring' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');
