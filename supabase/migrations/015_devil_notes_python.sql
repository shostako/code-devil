-- 015_devil_notes_python.sql
-- Python 悪魔のノート（53件）
-- 本物の皮肉、開発者あるある、★★★★★レベル

-- print()
UPDATE entries SET sarcastic_title = 'デバッグの王様', sarcastic_notes = ARRAY['「printデバッグで十分」と言い張る人、一生debugger覚えない', '本番にprint文残してリリースした回数、正直に言ってみ？', '「ここまで来た」「ここも来た」「なんで来ない」←お前のコード'] WHERE slug = 'print' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- len()
UPDATE entries SET sarcastic_title = '長さ測定士', sarcastic_notes = ARRAY['if len(list) > 0 って書く人、if list で済むの知ってる？', 'len(list) == 0 と not list、どっちが Pythonic か論争、終わりなき戦い', '「リストの長さを取得」←それ、コメントに書く必要ある？'] WHERE slug = 'len' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- range()
UPDATE entries SET sarcastic_title = '数列生成機', sarcastic_notes = ARRAY['for i in range(len(list)) ←お前 enumerate 知らないの？', 'range(0, 10, 1) って全部デフォルト値だけど、わざわざ書く派？', 'range(10, 0, -1) の結果、毎回試してから使うよね、正直に'] WHERE slug = 'range' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- input()
UPDATE entries SET sarcastic_title = '標準入力の門番', sarcastic_notes = ARRAY['int(input()) でエラーになって「なんで？」って顔してた過去', '「数字を入力してください」→ユーザー「abc」→プログラム「💀」', 'input() の戻り値が常に str なの、何年経っても忘れるよね'] WHERE slug = 'input' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- type()
UPDATE entries SET sarcastic_title = '型の審判官', sarcastic_notes = ARRAY['if type(x) == int より isinstance 使えって何回言われた？', '「とりあえずtype()で確認」←型アノテーション書けばいいのに', 'type(True) が bool で、isinstance(True, int) が True な Python の闇'] WHERE slug = 'type' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- str()
UPDATE entries SET sarcastic_title = '万物の文字列化', sarcastic_notes = ARRAY['str(None) が "None" になって DB に保存しちゃった人、手を挙げて', 'f-string 時代に str() + str() で連結してる人、まだいる', '"" + str(数字) ←これ書いてた過去の自分を殴りたい'] WHERE slug = 'str' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- int()
UPDATE entries SET sarcastic_title = '整数変換の刃', sarcastic_notes = ARRAY['int("3.14") がエラーになる理由、最初納得できなかったよね', 'int(True) が 1 になるの、便利なのか罠なのか', 'int("10", 2) でバイナリ変換できるの、知ってる人少ないよね'] WHERE slug = 'int' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- float()
UPDATE entries SET sarcastic_title = '浮動小数点の罠', sarcastic_notes = ARRAY['0.1 + 0.2 == 0.3 が False になって「Python壊れた」と思った初心者時代', 'float("inf") が存在することを知った時の衝撃', 'お金の計算にfloat使って上司に怒られた人、結構いるでしょ'] WHERE slug = 'float' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- list()
UPDATE entries SET sarcastic_title = 'リスト錬成術', sarcastic_notes = ARRAY['list(range(10)) って書く人、[*range(10)] の方がモダンだよ', 'list("abc") が ["a", "b", "c"] になるの、便利だけど初見殺し', '空リストを list() で作る人、[] でいいのに'] WHERE slug = 'list' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- dict()
UPDATE entries SET sarcastic_title = '辞書の錬金術', sarcastic_notes = ARRAY['dict(a=1, b=2) と {"a": 1, "b": 2}、どっち派か論争', 'dict.fromkeys() の罠にハマった人、ミュータブルなデフォルト値で', '空の辞書を dict() で作る人、{} でいいのに'] WHERE slug = 'dict' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- set()
UPDATE entries SET sarcastic_title = '重複撲滅委員会', sarcastic_notes = ARRAY['list(set(list)) で重複削除して順序が変わって泣いた経験', '空のsetを {} で作ろうとして dict になった人、正直に', 'set の順序が保証されないの忘れてテスト落ちた回数'] WHERE slug = 'set' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- tuple()
UPDATE entries SET sarcastic_title = '不変のコレクション', sarcastic_notes = ARRAY['(1) がタプルじゃなくて int なの、カンマ忘れて何回泣いた？', 'tuple は immutable だから辞書のキーにできる、これ知らない人多い', '「タプルって何に使うの？」←それ、面接で聞かれるやつ'] WHERE slug = 'tuple' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- bool()
UPDATE entries SET sarcastic_title = '真偽判定官', sarcastic_notes = ARRAY['bool([]) が False なの、「空は偽」ルール覚えるまで時間かかったよね', 'bool("False") が True になる罠、設定ファイルで何回ハマった？', 'if x == True より if x って書けって何回言われた？'] WHERE slug = 'bool' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- sorted()
UPDATE entries SET sarcastic_title = 'ソート職人', sarcastic_notes = ARRAY['list.sort() と sorted() の違い、何回調べ直した？', 'key=lambda x: x[1] ってよく書くけど、itemgetter 使った方が速いよ', 'reverse=True を忘れて昇順のまま提出したレポート'] WHERE slug = 'sorted' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- reversed()
UPDATE entries SET sarcastic_title = '逆転の発想', sarcastic_notes = ARRAY['reversed() がイテレータ返すの忘れて list() で囲み忘れ', 'list[::-1] と reversed()、どっちがPythonicか永遠の議論', '「reverseとreversedの違いは？」面接で聞かれて固まった'] WHERE slug = 'reversed' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- enumerate()
UPDATE entries SET sarcastic_title = 'インデックス配達員', sarcastic_notes = ARRAY['for i in range(len(list)) 書いてる人、これ使えって何回言った', 'start=1 オプションの存在を知って「もっと早く教えてよ」', '「enumurateだっけ？enumerateだっけ？」←毎回スペル間違える'] WHERE slug = 'enumerate' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- zip()
UPDATE entries SET sarcastic_title = '並列イテレーション', sarcastic_notes = ARRAY['zip() が短い方に合わせるの忘れてデータ消えた経験', 'zip(*list) でアンパックできるの、何年目で知った？', 'zip_longest の存在を知らずに自前実装してた過去'] WHERE slug = 'zip' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- map()
UPDATE entries SET sarcastic_title = '変換工場', sarcastic_notes = ARRAY['list(map(int, input().split())) 競プロ勢の常套句', 'map() 使うよりリスト内包表記の方がPythonicって言われた時の顔', 'map() がイテレータ返すの忘れて何回もハマる'] WHERE slug = 'map' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- filter()
UPDATE entries SET sarcastic_title = '条件フィルター', sarcastic_notes = ARRAY['filter(None, list) でFalsyな値を除去できるの、知ってる？', 'リスト内包表記の方が読みやすいって言われて存在意義を問う', 'filter() も map() もイテレータ返すの、Python 3 の罠'] WHERE slug = 'filter' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- sum()
UPDATE entries SET sarcastic_title = '合計計算機', sarcastic_notes = ARRAY['sum(list, []) でリストを平坦化できるけど、やらない方がいい', 'start引数の存在を知った時「え、そんなのあったの？」', 'sum() に文字列渡してエラー、"".join() 使えってこと'] WHERE slug = 'sum' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- max() / min()
UPDATE entries SET sarcastic_title = '最大最小決定戦', sarcastic_notes = ARRAY['空のシーケンスで ValueError、default引数知らなかった頃の俺', 'key=len で最長の文字列取れるの、地味に便利', 'max(a, b, c) と max([a, b, c])、どっちでもいいのに悩む'] WHERE slug = 'max-min' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- abs()
UPDATE entries SET sarcastic_title = '絶対値の番人', sarcastic_notes = ARRAY['複素数の abs() がノルム返すの知ってる人、手を挙げて', '「絶対値って何？」って聞いてきた後輩に数学から教えた日', 'abs(-0.0) が 0.0 なの、当たり前だけど考えると深い'] WHERE slug = 'abs' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- round()
UPDATE entries SET sarcastic_title = '四捨五入の罠', sarcastic_notes = ARRAY['round(2.5) が 2 になる銀行家の丸め、最初バグだと思った', 'round(2.675, 2) が 2.67 になる浮動小数点の闇', '「四捨五入したいだけなのに...」なぜこんなに難しいのか'] WHERE slug = 'round' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- any() / all()
UPDATE entries SET sarcastic_title = '存在と普遍の哲学', sarcastic_notes = ARRAY['all([]) が True になる理由、論理学やってないと納得できない', 'any() と all() 逆に覚えてバグ出した回数', '「全部 True なら True」って、空リストは「全部 True」なの？'] WHERE slug = 'any-all' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- open()
UPDATE entries SET sarcastic_title = 'ファイルの門番', sarcastic_notes = ARRAY['with を使わずに f.close() 忘れてリソースリーク', 'encoding="utf-8" つけ忘れて Windows で文字化け祭り', '「r」「w」「a」の違い、何回ドキュメント見た？'] WHERE slug = 'open' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- join()
UPDATE entries SET sarcastic_title = '文字列結合の逆転劇', sarcastic_notes = ARRAY['list.join(sep) じゃなくて sep.join(list) な理由、未だに納得してない', '", ".join(list) で数値リストがエラー、str変換忘れ', '空文字で join して「あれ、区切りがない」って言ってた過去'] WHERE slug = 'join' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- split()
UPDATE entries SET sarcastic_title = '文字列分割職人', sarcastic_notes = ARRAY['split() と split(" ") の違いで1時間溶かした経験', '「カンマ区切りなのに split() だけでいけた」←連続スペースの挙動', 'maxsplit 引数の存在を知らずに自前で実装してた'] WHERE slug = 'split' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- strip()
UPDATE entries SET sarcastic_title = '空白の掃除人', sarcastic_notes = ARRAY['strip() で改行も消えるの、最初知らなかった', 'strip("abc") が「a、b、cのどれか」を消すの、直感に反する', 'lstrip、rstrip、strip の使い分け、正直面倒'] WHERE slug = 'strip' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- replace()
UPDATE entries SET sarcastic_title = '文字列置換師', sarcastic_notes = ARRAY['replace() は新しい文字列を返す、元は変わらない←これ忘れがち', '連続 replace() でチェーンするの、re.sub 使えって言われた', 'replace("", "x") で各文字の間に挿入できるの、知ってた？'] WHERE slug = 'replace' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- format()
UPDATE entries SET sarcastic_title = 'f-string以前の遺産', sarcastic_notes = ARRAY['f-string 時代にまだ .format() 使ってる人、時代に取り残されてる', '"{0} {1}".format(a, b) ← インデックス省略できるの知ってる？', '"{:,.2f}".format(1234567.89) の書式指定、毎回調べる'] WHERE slug = 'format' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- find()
UPDATE entries SET sarcastic_title = '文字列探索家', sarcastic_notes = ARRAY['見つからない時 -1 返すの、None じゃないのが地味にハマる', 'index() は例外投げるけど find() は -1、使い分け面倒', 'in 演算子で存在確認して find() で位置取得、二度手間感'] WHERE slug = 'find' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- count()
UPDATE entries SET sarcastic_title = '出現回数カウンター', sarcastic_notes = ARRAY['list.count() と str.count() 両方あるの、Python の優しさ？', 'Counter 使えばいいのに count() をループで回す人', '「この文字、何回出てくる？」を手動で数えてた新人時代'] WHERE slug = 'count' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- append()
UPDATE entries SET sarcastic_title = 'リスト追加の基本', sarcastic_notes = ARRAY['list.append(x) が None 返すの、a = list.append(x) で「あれ？」', 'extend() と append() の違い、append([1,2]) でネストして泣く', '毎回 append() するより内包表記の方が速いって知ってた？'] WHERE slug = 'append' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- extend()
UPDATE entries SET sarcastic_title = 'リスト拡張術', sarcastic_notes = ARRAY['list += other_list と extend() 同じなの、どっち使う派？', 'extend() に文字列渡すと1文字ずつ追加される罠', 'append() と extend() 間違えて無限ネストしたリスト'] WHERE slug = 'extend' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- pop()
UPDATE entries SET sarcastic_title = '要素取り出し師', sarcastic_notes = ARRAY['pop(0) は O(n) だから deque 使えって言われた時の衝撃', '空リストで pop() して IndexError、チェックしろよ俺', 'pop() の戻り値を無視して捨てるだけなら del 使えば？'] WHERE slug = 'pop' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- remove()
UPDATE entries SET sarcastic_title = '値による削除', sarcastic_notes = ARRAY['remove() は最初の1つだけ消す、全部消したいならループ', '存在しない値で ValueError、in で確認してから呼ぶ面倒さ', 'del list[index] と remove(value)、どっち使うか毎回迷う'] WHERE slug = 'remove' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- insert()
UPDATE entries SET sarcastic_title = 'リスト挿入職人', sarcastic_notes = ARRAY['insert(0, x) は O(n)、頻繁にやるなら deque 使え', 'insert() も None 返すの、append() と同じ罠', 'スライスで挿入 list[i:i] = [x] できるの知ってる人少ない'] WHERE slug = 'insert' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- index()
UPDATE entries SET sarcastic_title = 'インデックス探偵', sarcastic_notes = ARRAY['存在しない値で ValueError、try-except か in で確認必須', 'find() と違って例外投げるの、文字列とリストで統一してくれ', '第2引数で検索開始位置指定できるの、知らなかった'] WHERE slug = 'index' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- copy()
UPDATE entries SET sarcastic_title = '浅いコピーの罠', sarcastic_notes = ARRAY['ネストしたリストで copy() 使ってバグ、deepcopy 必要だった', 'list[:] と copy() と list(list)、全部同じことできる謎', '「コピーしたはずなのに元も変わった」←浅いコピーの犠牲者'] WHERE slug = 'copy' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- clear()
UPDATE entries SET sarcastic_title = '全消去の刃', sarcastic_notes = ARRAY['list = [] と list.clear() の違い、参照がある場合に効いてくる', 'clear() も None 返すの、Python のミュータブルメソッドの伝統', '「全部消すだけなのに clear() ってメソッド必要？」←del list[:] でもできる'] WHERE slug = 'clear' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- keys() / values() / items()
UPDATE entries SET sarcastic_title = '辞書ビュー三兄弟', sarcastic_notes = ARRAY['Python 3 でリストじゃなくなった、list() で囲む一手間', 'for k, v in dict.items() は定番、for k in dict でキーだけ取れるのに', '.keys() は省略可能、でも明示的に書く派と書かない派の戦争'] WHERE slug = 'keys-values-items' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- get()
UPDATE entries SET sarcastic_title = '安全な辞書アクセス', sarcastic_notes = ARRAY['dict[key] で KeyError 出して「get() 使えよ」と言われた回数', 'デフォルト値に [] 渡して「あれ、同じリストが...」', 'setdefault() との違い、毎回ドキュメント見る'] WHERE slug = 'get' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- update()
UPDATE entries SET sarcastic_title = '辞書マージ職人', sarcastic_notes = ARRAY['Python 3.9 から | 演算子でマージできるの、知ってる？', 'update() は破壊的、元の辞書変わるの忘れがち', '{**dict1, **dict2} でマージしてたのが懐かしい'] WHERE slug = 'update' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- setdefault()
UPDATE entries SET sarcastic_title = '存在確認と設定の一石二鳥', sarcastic_notes = ARRAY['collections.defaultdict 使えばいいのに setdefault() をループで回す', '「setdefault って何？」って聞かれて説明に困る', 'get() との違いを説明できる人、意外と少ない'] WHERE slug = 'setdefault' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- fromkeys()
UPDATE entries SET sarcastic_title = '一括初期化の罠', sarcastic_notes = ARRAY['dict.fromkeys(keys, []) で全部同じリストを参照する罠', '「全部同じ値で初期化したいだけなのに...」辞書内包表記使え', 'この罠にハマらなかった Python 初心者、いないでしょ'] WHERE slug = 'fromkeys' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- lambda
UPDATE entries SET sarcastic_title = '無名関数の誘惑', sarcastic_notes = ARRAY['lambda 使いすぎてコードが読めなくなった経験', 'sorted(data, key=lambda x: (x[1], x[0])) ←何度書いたか', '「lambda って何？」を説明するの、意外と難しい'] WHERE slug = 'lambda' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- def
UPDATE entries SET sarcastic_title = '関数定義の入口', sarcastic_notes = ARRAY['デフォルト引数に [] 使って「なぜ値が残る？」と絶望した日', '引数の順序: 位置、*args、キーワードのみ、**kwargs、覚えた？', 'return 書き忘れて None 返して「あれ？」ってなる'] WHERE slug = 'def' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- class
UPDATE entries SET sarcastic_title = 'オブジェクト指向の扉', sarcastic_notes = ARRAY['self 忘れて「引数の数が合わない」エラーで30分溶かした', '__init__ と __new__ の違い、聞かれると困る', 'クラス変数とインスタンス変数の違いでバグらせた人、手を挙げて'] WHERE slug = 'class' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- import
UPDATE entries SET sarcastic_title = 'モジュール召喚術', sarcastic_notes = ARRAY['循環インポートで ImportError、設計見直せってこと', 'from module import * って書いて怒られた経験', '__all__ の存在を知った時「なるほど」と思った'] WHERE slug = 'import' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- try-except
UPDATE entries SET sarcastic_title = '例外処理の盾', sarcastic_notes = ARRAY['except: で全部キャッチして「なぜ動かない？」と1時間', 'except Exception as e: print(e) ←ログ取れよ、消えるぞ', '「Pokemon Exception Handling」←全部キャッチするなって話'] WHERE slug = 'try-except' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- with
UPDATE entries SET sarcastic_title = 'コンテキストマネージャーの扉', sarcastic_notes = ARRAY['with 使わずに f.close() 忘れてファイルロック地獄', '__enter__ と __exit__ 自作したことある人、手を挙げて', 'contextlib.contextmanager 使えばもっと楽なのに'] WHERE slug = 'with' AND language_id = (SELECT id FROM languages WHERE slug = 'python');
