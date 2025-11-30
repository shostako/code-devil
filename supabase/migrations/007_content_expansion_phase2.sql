-- 007: コンテンツ拡充フェーズ2（統合版）
-- Python 29件（新規追加）
-- JavaScript 25件（重複除外: array-map, array-filter, async-await, console-log）
-- Bash 17件（重複除外: chmod, if, for）
-- 合計71件追加

-- ===========================================
-- PYTHON 追加エントリ (30件)
-- language_id: 11111111-1111-1111-1111-111111111111
-- category_id: aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa
-- ===========================================

INSERT INTO entries (slug, name, language_id, category_id, entry_type, difficulty, short_desc, full_desc, code_example, sarcastic_title, sarcastic_notes, is_published) VALUES

-- 文字列メソッド
('str-split', 'str.split()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'文字列を分割してリストに',
'str.split(sep)は区切り文字でを分割してリストを返します。引数なしで空白文字で分割。',
'"a,b,c".split(",")  # ["a", "b", "c"]\n"hello world".split()  # ["hello", "world"]',
'文字列をバラバラにする',
ARRAY['引数なしだと連続空白もまとめて処理してくれる', 'maxsplitで分割回数を制限できる', 'rsplit()は右から分割', '空文字で分割すると空リストになる罠'], true),

('str-join', 'str.join()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'リストを結合して文字列に',
'sep.join(iterable)はイテラブルの要素を区切り文字で結合した文字列を返します。',
'",".join(["a", "b", "c"])  # "a,b,c"\n" ".join(["hello", "world"])  # "hello world"',
'splitの逆操作',
ARRAY['区切り文字.join(リスト)という順番に注意', '数値リストは先にstr変換が必要', '空リストは空文字を返す', 'リスト内包表記と組み合わせると便利'], true),

('str-strip', 'str.strip()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'両端の空白を削除',
'str.strip()は文字列の両端から空白文字を削除します。引数で削除文字を指定可能。',
'"  hello  ".strip()  # "hello"\n"###test###".strip("#")  # "test"',
'余計な空白を消す掃除屋',
ARRAY['lstrip()は左だけ、rstrip()は右だけ', '改行やタブも消える', '引数は削除する文字の集合であって部分文字列ではない', 'ファイル読み込み時の定番処理'], true),

('str-replace', 'str.replace()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'文字列を置換',
'str.replace(old, new)は部分文字列を置換した新しい文字列を返します。',
'"hello".replace("l", "L")  # "heLLo"\n"aaa".replace("a", "b", 2)  # "bba"',
'検索と置換の基本',
ARRAY['元の文字列は変更されない（イミュータブル）', '第3引数で置換回数を制限できる', '正規表現を使いたければre.sub()', '大文字小文字を区別する'], true),

-- リストメソッド
('list-append', 'list.append()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'リストの末尾に要素を追加',
'list.append(x)はリストの末尾に要素を追加します。リスト自体を変更します。',
'lst = [1, 2]\nlst.append(3)  # lst = [1, 2, 3]',
'リストを育てる基本操作',
ARRAY['extend()と違って要素を1つ追加するだけ', '戻り値はNone、よくある間違い', 'リストを追加するとネストする', '+=演算子はextend相当'], true),

('list-extend', 'list.extend()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'リストを結合',
'list.extend(iterable)はイテラブルの全要素をリストに追加します。',
'lst = [1, 2]\nlst.extend([3, 4])  # lst = [1, 2, 3, 4]',
'リストを伸ばす',
ARRAY['append()と違って展開して追加', '+=と同じ動作', '文字列を渡すと1文字ずつ追加される罠', '戻り値はNone'], true),

('list-pop', 'list.pop()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'リストから要素を取り出して削除',
'list.pop(index)は指定位置の要素を削除して返します。引数なしで末尾。',
'lst = [1, 2, 3]\nx = lst.pop()  # x=3, lst=[1, 2]\ny = lst.pop(0)  # y=1, lst=[2]',
'取り出しながら削除',
ARRAY['スタックとして使うなら引数なし', '空リストでpopするとIndexError', 'del lst[i]は値を返さない', 'collections.dequeの方が先頭操作は速い'], true),

('list-insert', 'list.insert()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'指定位置に要素を挿入',
'list.insert(index, x)は指定位置に要素を挿入します。',
'lst = [1, 3]\nlst.insert(1, 2)  # lst = [1, 2, 3]',
'割り込み挿入',
ARRAY['先頭挿入はinsert(0, x)', 'O(n)の操作、頻繁にやるならdeque', '戻り値はNone', 'スライスでも同じことができる'], true),

('list-remove', 'list.remove()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'値で要素を削除',
'list.remove(x)は最初に見つかった値xを削除します。',
'lst = [1, 2, 3, 2]\nlst.remove(2)  # lst = [1, 3, 2]',
'値を探して消す',
ARRAY['最初の1つだけ削除、全部消すにはループ', '見つからないとValueError', 'del lst[i]はインデックス指定', 'pop()は値を返すがremove()はNone'], true),

-- 辞書メソッド
('dict-get', 'dict.get()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'キーで値を取得（デフォルト値付き）',
'dict.get(key, default)はキーが存在しない場合にデフォルト値を返します。',
'd = {"a": 1}\nd.get("a")  # 1\nd.get("b", 0)  # 0',
'KeyErrorを回避する紳士的な方法',
ARRAY['d[key]と違ってKeyErrorにならない', 'デフォルト省略でNone', 'setdefault()は値をセットもする', 'in演算子でキー存在確認もできる'], true),

('dict-keys', 'dict.keys()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'全キーを取得',
'dict.keys()は辞書の全キーのビューオブジェクトを返します。',
'd = {"a": 1, "b": 2}\nlist(d.keys())  # ["a", "b"]',
'キー一覧を見る',
ARRAY['Python3ではリストではなくビュー', '辞書をイテレートするとキーが返る', 'for k in d: と for k in d.keys(): は同じ', 'リストが欲しければlist()で変換'], true),

('dict-values', 'dict.values()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'全値を取得',
'dict.values()は辞書の全値のビューオブジェクトを返します。',
'd = {"a": 1, "b": 2}\nlist(d.values())  # [1, 2]',
'値だけ欲しい時に',
ARRAY['ビューオブジェクトなので辞書の変更が反映される', '重複値も全部返る', 'sum(d.values())は定番', 'キーも欲しければitems()'], true),

('dict-items', 'dict.items()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'キーと値のペアを取得',
'dict.items()は(キー, 値)タプルのビューオブジェクトを返します。',
'd = {"a": 1, "b": 2}\nfor k, v in d.items():\n    print(k, v)',
'キーと値を同時にイテレート',
ARRAY['for k, v in d.items(): が定番パターン', 'dict()に渡すとコピーになる', 'sorted(d.items())でソート', 'dict内包表記で変換もできる'], true),

('dict-update', 'dict.update()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'辞書を更新・結合',
'dict.update(other)は他の辞書やキーワード引数で辞書を更新します。',
'd = {"a": 1}\nd.update({"b": 2, "a": 10})  # d = {"a": 10, "b": 2}',
'辞書のマージ',
ARRAY['同じキーは上書きされる', 'd | other でも結合できる（Python 3.9+）', 'キーワード引数も受け付ける', '戻り値はNone'], true),

-- 組み込み関数
('any', 'any()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'intermediate',
'いずれかがTrueか判定',
'any(iterable)は要素のいずれかがTrueならTrueを返します。',
'any([False, True, False])  # True\nany([0, "", None])  # False',
'OR条件のショートカット',
ARRAY['空のイテラブルはFalse', 'ジェネレータと組み合わせると効率的', 'all()は全部True版', '短絡評価される'], true),

('all', 'all()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'intermediate',
'全てがTrueか判定',
'all(iterable)は全要素がTrueならTrueを返します。',
'all([True, True, True])  # True\nall([1, 2, 0])  # False',
'AND条件のショートカット',
ARRAY['空のイテラブルはTrue（直感に反する）', 'バリデーションでよく使う', 'any()と組み合わせて条件チェック', 'Falseが見つかった時点で終了'], true),

('sum', 'sum()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'合計を計算',
'sum(iterable, start=0)はイテラブルの要素の合計を返します。',
'sum([1, 2, 3])  # 6\nsum([1, 2, 3], 10)  # 16',
'足し算を一行で',
ARRAY['文字列の結合には使えない、join()を使え', '第2引数で初期値を指定', 'math.fsum()は浮動小数点の精度が高い', 'reduceより速い'], true),

('max-min', 'max()/min()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'最大値・最小値を取得',
'max(iterable)とmin(iterable)は最大値と最小値を返します。',
'max([1, 3, 2])  # 3\nmin("abc")  # "a"\nmax([1, 2], [3, 0])  # [3, 0]',
'一番大きい・小さいやつを見つける',
ARRAY['key引数でカスタム比較ができる', '空のイテラブルはエラー、defaultで回避', '複数引数も受け付ける', '文字列は辞書順で比較'], true),

('abs', 'abs()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'絶対値を取得',
'abs(x)は数値の絶対値を返します。複素数の場合は大きさ。',
'abs(-5)  # 5\nabs(3+4j)  # 5.0',
'マイナスを消す',
ARRAY['整数、浮動小数点、複素数に対応', '複素数の場合はsqrt(a^2+b^2)', 'math.fabs()は常にfloatを返す', '距離計算でよく使う'], true),

('round', 'round()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'四捨五入',
'round(number, ndigits)は指定した桁数で四捨五入します。',
'round(3.14159, 2)  # 3.14\nround(2.5)  # 2 (銀行丸め)',
'丸める',
ARRAY['Python3は銀行丸め（偶数丸め）', '2.5は2になり3.5は4になる', '負のndigitsで10の位以上を丸められる', 'Decimalを使えば通常の四捨五入'], true),

('input', 'input()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'ユーザー入力を受け取る',
'input(prompt)は標準入力から一行読み取り、文字列を返します。',
'name = input("名前を入力: ")\nage = int(input("年齢: "))',
'対話型プログラムの入り口',
ARRAY['常に文字列を返す、数値はint()で変換', 'EOFでEOFError', 'Ctrl+CでKeyboardInterrupt', 'セキュリティ注意、eval()に渡すな'], true),

('isinstance', 'isinstance()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'intermediate',
'型をチェック',
'isinstance(obj, classinfo)はオブジェクトが指定した型かどうかを判定します。',
'isinstance(1, int)  # True\nisinstance("a", (str, bytes))  # True',
'type()より推奨される型チェック',
ARRAY['継承を考慮する、type()は厳密比較', 'タプルで複数型を指定できる', 'ABCでダックタイピング的チェックもできる', '過度な型チェックはPythonicではない'], true),

('hasattr', 'hasattr()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'intermediate',
'属性の存在確認',
'hasattr(obj, name)はオブジェクトが指定した属性を持つかを判定します。',
'hasattr([], "append")  # True\nhasattr({}, "keys")  # True',
'属性があるか聞いてみる',
ARRAY['内部的にgetattr()を呼んで例外をキャッチ', 'EAFPよりLBYL寄りの書き方', 'getattr()のデフォルト値でも代用可', 'プロパティのgetterが呼ばれる点に注意'], true),

('getattr', 'getattr()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'intermediate',
'属性を動的に取得',
'getattr(obj, name, default)は属性を文字列名で取得します。',
'getattr([], "append")  # <method append>\ngetattr({}, "foo", None)  # None',
'属性名を変数で指定したい時に',
ARRAY['第3引数でAttributeErrorを回避', 'setattr()で動的に設定', 'メタプログラミングの基本', 'obj.attrと同じだが動的'], true),

('setattr', 'setattr()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'intermediate',
'属性を動的に設定',
'setattr(obj, name, value)は属性を文字列名で設定します。',
'class C: pass\nobj = C()\nsetattr(obj, "x", 10)  # obj.x = 10',
'属性を動的に生やす',
ARRAY['obj.attr = valueと同じだが動的', 'delattrで削除', '__slots__があると制限される', 'ビルトイン型には使えないことが多い'], true),

-- 例外・制御
('raise', 'raise', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'syntax', 'intermediate',
'例外を発生させる',
'raise文で明示的に例外を発生させます。',
'raise ValueError("不正な値")\nraise  # 現在の例外を再送出',
'自分でエラーを起こす',
ARRAY['引数なしraiseは現在の例外を再送出', 'raise from eで例外チェーン', 'カスタム例外クラスも作れる', 'assertと使い分けろ'], true),

('assert', 'assert', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'syntax', 'intermediate',
'条件が偽なら例外',
'assert文は条件がFalseの時AssertionErrorを発生させます。',
'assert x > 0, "xは正の数でなければならない"\nassert isinstance(obj, list)',
'デバッグ用の検証',
ARRAY['-Oオプションで無効化される', '本番コードの入力検証には使うな', 'テストで大活躍', 'タプルにすると常にTrue、注意'], true),

('global', 'global', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'syntax', 'intermediate',
'グローバル変数を参照',
'global文で関数内からグローバル変数を変更できます。',
'x = 10\ndef func():\n    global x\n    x = 20',
'グローバル変数を触る宣言',
ARRAY['読むだけならglobal不要', '多用するとコードが汚くなる', 'nonlocalはクロージャ用', 'グローバル変数自体を避けるのがベスト'], true),

('nonlocal', 'nonlocal', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'syntax', 'advanced',
'外側のスコープの変数を参照',
'nonlocal文でクロージャ内から外側のローカル変数を変更できます。',
'def outer():\n    x = 10\n    def inner():\n        nonlocal x\n        x = 20\n    inner()\n    return x  # 20',
'クロージャでの変数束縛',
ARRAY['globalと違って一つ外のスコープ', 'クロージャで状態を持たせる時に必要', 'Python3で追加された', '使いすぎると可読性が落ちる'], true);

-- ===========================================
-- JAVASCRIPT 追加エントリ (30件)
-- language_id: 22222222-2222-2222-2222-222222222222
-- category_id: bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb
-- ===========================================

INSERT INTO entries (slug, name, language_id, category_id, entry_type, difficulty, short_desc, full_desc, code_example, sarcastic_title, sarcastic_notes, is_published) VALUES

-- 配列メソッド
('array-includes', 'Array.includes()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'beginner',
'要素が含まれるか判定',
'includes()は配列に指定した要素が含まれるかをbooleanで返します。',
'[1, 2, 3].includes(2)  // true\n["a", "b"].includes("c")  // false',
'配列に入ってるか確認',
ARRAY['indexOf() !== -1より読みやすい', 'NaNも正しく判定できる', 'オブジェクトは参照比較', 'ES2016で追加'], true),

('array-indexof', 'Array.indexOf()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'beginner',
'要素のインデックスを取得',
'indexOf()は要素が最初に現れる位置を返します。見つからなければ-1。',
'[1, 2, 3].indexOf(2)  // 1\n["a", "b"].indexOf("c")  // -1',
'何番目にいるか調べる',
ARRAY['見つからないと-1、falsy判定に注意', 'lastIndexOf()は後ろから検索', 'includes()で存在確認だけなら十分', '厳密等価(===)で比較'], true),

('array-slice', 'Array.slice()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'beginner',
'配列の一部を取り出す',
'slice(start, end)は指定範囲の要素を新しい配列として返します。',
'[1, 2, 3, 4].slice(1, 3)  // [2, 3]\n[1, 2, 3].slice(-2)  // [2, 3]',
'非破壊的な切り出し',
ARRAY['元の配列は変更されない', 'endは含まれない', '負のインデックスは末尾から', 'splice()と名前が紛らわしい'], true),

('array-splice', 'Array.splice()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'intermediate',
'配列を直接変更して要素を削除・追加',
'splice(start, deleteCount, ...items)は配列を直接変更し、削除された要素を返します。',
'const arr = [1, 2, 3];\narr.splice(1, 1, "a", "b");  // arr = [1, "a", "b", 3]',
'破壊的な配列操作',
ARRAY['元の配列を変更する', '戻り値は削除された要素の配列', 'slice()と名前が紛らわしい', '挿入だけならdeleteCountを0に'], true),

('array-sort', 'Array.sort()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'intermediate',
'配列をソート',
'sort()は配列を直接ソートします。デフォルトは文字列としてソート。',
'[3, 1, 2].sort()  // [1, 2, 3]\n[10, 2, 1].sort((a, b) => a - b)',
'並び替えの罠だらけ',
ARRAY['元の配列を変更する', 'デフォルトは文字列比較、10が2より前になる', '数値ソートは比較関数必須', 'toSorted()なら非破壊（ES2023）'], true),

('array-reverse', 'Array.reverse()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'beginner',
'配列を反転',
'reverse()は配列の要素の順序を逆にします。元の配列を変更します。',
'[1, 2, 3].reverse()  // [3, 2, 1]',
'ひっくり返す',
ARRAY['元の配列を変更する', 'toReversed()なら非破壊（ES2023）', '文字列反転は[...str].reverse().join("")', 'sort()と組み合わせて降順'], true),

('array-flat', 'Array.flat()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'intermediate',
'ネストした配列を平坦化',
'flat(depth)はネストした配列を指定した深さまで平坦化します。',
'[1, [2, [3]]].flat()  // [1, 2, [3]]\n[1, [2, [3]]].flat(2)  // [1, 2, 3]',
'配列のネストを解消',
ARRAY['デフォルトの深さは1', 'Infinityで完全に平坦化', 'flatMap()はmap+flatを一度に', 'ES2019で追加'], true),

('array-join', 'Array.join()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'beginner',
'配列を文字列に結合',
'join(separator)は配列の要素を区切り文字で結合した文字列を返します。',
'["a", "b", "c"].join(",")  // "a,b,c"\n[1, 2, 3].join("")  // "123"',
'split()の逆操作',
ARRAY['デフォルトの区切りはカンマ', 'null/undefinedは空文字になる', '配列を文字列にする基本', 'Pythonと呼び出し方向が逆'], true),

-- 文字列メソッド
('string-split', 'String.split()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'beginner',
'文字列を分割して配列に',
'split(separator)は区切り文字で文字列を分割し配列を返します。',
'"a,b,c".split(",")  // ["a", "b", "c"]\n"hello".split("")  // ["h", "e", "l", "l", "o"]',
'join()の逆操作',
ARRAY['正規表現も使える', '空文字で分割すると1文字ずつ', '第2引数で分割数を制限', 'limitは取得数の上限'], true),

('string-trim', 'String.trim()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'beginner',
'両端の空白を削除',
'trim()は文字列の両端から空白文字を削除します。',
'"  hello  ".trim()  // "hello"\n"\\n\\ttest\\n".trim()  // "test"',
'余計な空白を消す',
ARRAY['trimStart()/trimEnd()で片側だけ', '元の文字列は変更されない', 'フォーム入力の前処理に必須', '全角スペースも削除される'], true),

('string-includes', 'String.includes()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'beginner',
'部分文字列が含まれるか',
'includes()は指定した文字列が含まれるかをbooleanで返します。',
'"hello world".includes("world")  // true\n"hello".includes("x")  // false',
'文字列検索の基本',
ARRAY['indexOf() !== -1より読みやすい', '第2引数で検索開始位置', '大文字小文字を区別する', '正規表現を使いたければtest()'], true),

('string-replace', 'String.replace()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'beginner',
'文字列を置換',
'replace()は最初にマッチした部分を置換した新しい文字列を返します。',
'"hello".replace("l", "L")  // "heLlo"\n"aaa".replace(/a/g, "b")  // "bbb"',
'最初の1つだけ置換する罠',
ARRAY['デフォルトは最初の1つだけ', '全置換はreplaceAll()か正規表現/g', 'コールバック関数も使える', '元の文字列は変更されない'], true),

('string-substring', 'String.substring()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'beginner',
'部分文字列を取得',
'substring(start, end)は指定範囲の部分文字列を返します。',
'"hello".substring(1, 3)  // "el"\n"hello".substring(2)  // "llo"',
'文字列の一部を切り出す',
ARRAY['endは含まれない', 'slice()との違いは負の数の扱い', 'substr()は非推奨', 'slice()の方が直感的'], true),

-- Promise/非同期
('promise-all', 'Promise.all()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'intermediate',
'複数のPromiseを並行実行',
'Promise.all()は全てのPromiseが解決されるまで待ち、結果の配列を返します。',
'const results = await Promise.all([\n  fetch("/api/a"),\n  fetch("/api/b")\n]);',
'並行処理の基本',
ARRAY['1つでも失敗すると全体が失敗', 'Promise.allSettled()なら全結果を取得', '順番は保証される', 'N+1問題の解決に'], true),

('promise-race', 'Promise.race()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'intermediate',
'最初に完了したPromiseの結果を取得',
'Promise.race()は最初に解決または拒否されたPromiseの結果を返します。',
'const result = await Promise.race([\n  fetch("/api/data"),\n  timeout(5000)\n]);',
'競争させる',
ARRAY['タイムアウト実装によく使う', '残りのPromiseも実行は続く', 'Promise.any()は最初の成功だけ', '使用頻度は低め'], true),

-- その他重要な構文
('typeof', 'typeof', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'operator', 'beginner',
'値の型を文字列で取得',
'typeof演算子は値の型を表す文字列を返します。',
'typeof "hello"  // "string"\ntypeof 42  // "number"\ntypeof null  // "object" (バグ)',
'型を調べる...つもりが',
ARRAY['typeof null === "object"は歴史的バグ', '配列もobjectになる', 'typeof undefinedはundefined', '関数はfunctionを返す'], true),

('instanceof', 'instanceof', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'operator', 'intermediate',
'オブジェクトがクラスのインスタンスか判定',
'instanceof演算子はオブジェクトが特定のコンストラクタのインスタンスかを判定します。',
'[] instanceof Array  // true\n{} instanceof Object  // true',
'継承チェーンを辿る',
ARRAY['プロトタイプチェーンを確認する', 'iframe間では動かない', 'Array.isArray()の方が確実', 'プリミティブには使えない'], true),

('let-const-var', 'let/const/var', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'syntax', 'beginner',
'変数宣言',
'let/const/varは変数を宣言します。constは再代入不可、letとconstはブロックスコープ。',
'const x = 1;  // 再代入不可\nlet y = 2;  // 再代入可\nvar z = 3;  // 関数スコープ',
'変数宣言の三兄弟',
ARRAY['varは使うな、letかconstを使え', 'constでもオブジェクトの中身は変更可能', 'letとconstはTDZ（一時的デッドゾーン）あり', 'ループカウンタはletで'], true),

('for-of-in', 'for...of/for...in', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'syntax', 'intermediate',
'イテレーション構文',
'for...ofは値を、for...inはキー（プロパティ名）をイテレートします。',
'for (const x of [1, 2, 3]) {}  // 値\nfor (const k in {a: 1}) {}  // キー',
'ofとinを間違えると地獄',
ARRAY['配列にはfor...ofを使え', 'for...inは継承プロパティも含む', 'オブジェクトはfor...inかObject.entries()', 'forEachより早期終了できる'], true),

('array-from', 'Array.from()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'intermediate',
'配列ライクなものを配列に変換',
'Array.from()はイテラブルや配列ライクオブジェクトから配列を生成します。',
'Array.from("abc")  // ["a", "b", "c"]\nArray.from({length: 3}, (_, i) => i)  // [0, 1, 2]',
'配列っぽいものを本物の配列に',
ARRAY['NodeListを配列にする定番', '第2引数でmapと同時にできる', '[...iterable]でも同じことができる', 'Set/Mapの配列化にも'], true),

('array-isarray', 'Array.isArray()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'beginner',
'配列かどうか判定',
'Array.isArray()は値が配列かどうかをbooleanで返します。',
'Array.isArray([1, 2])  // true\nArray.isArray("abc")  // false',
'配列判定の正解',
ARRAY['typeof []は"object"なので使えない', 'instanceof Arrayはiframe間で失敗', 'これが最も確実な方法', 'ES5で追加'], true),

('object-assign', 'Object.assign()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'intermediate',
'オブジェクトをコピー・マージ',
'Object.assign(target, ...sources)はソースのプロパティをターゲットにコピーします。',
'const merged = Object.assign({}, obj1, obj2);\nObject.assign(target, source);',
'オブジェクトを合体させる',
ARRAY['シャローコピー、ネストは参照', 'スプレッド構文{...obj}の方がモダン', '同じキーは後勝ち', 'ターゲットを変更する'], true),

('object-freeze', 'Object.freeze()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'intermediate',
'オブジェクトを凍結',
'Object.freeze()はオブジェクトを変更不可にします。',
'const obj = Object.freeze({a: 1});\nobj.a = 2;  // 無視される（strictモードではエラー）',
'オブジェクトを不変にする',
ARRAY['シャローフリーズ、ネストは凍結されない', 'strictモードでは変更時にエラー', 'Object.isFrozen()で確認', '定数オブジェクトに'], true),

('setinterval', 'setInterval()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'beginner',
'一定間隔で繰り返し実行',
'setInterval(callback, delay)は指定ミリ秒ごとにコールバックを繰り返し実行します。',
'const id = setInterval(() => {\n  console.log("tick");\n}, 1000);\nclearInterval(id);',
'定期実行の定番',
ARRAY['clearInterval()で停止', '前の実行が終わる前に次が始まることも', 'setTimeoutの再帰呼び出しの方が安全な場合も', 'アニメーションにはrequestAnimationFrame()'], true),

('localstorage', 'localStorage', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'syntax', 'beginner',
'ブラウザにデータを永続保存',
'localStorageはブラウザにキー・バリューのデータを永続保存します。',
'localStorage.setItem("key", "value");\nconst val = localStorage.getItem("key");',
'簡易データベース',
ARRAY['文字列しか保存できない、JSON.stringify()で', '同一オリジン内で共有', 'sessionStorageはタブを閉じると消える', '5MB程度の容量制限'], true);


-- BASH 追加エントリ (20件)
-- language_id: 33333333-3333-3333-3333-333333333333
-- category_id: ca111111-1111-1111-1111-111111111111
-- ===========================================

INSERT INTO entries (slug, name, language_id, category_id, entry_type, difficulty, short_desc, full_desc, code_example, sarcastic_title, sarcastic_notes, is_published) VALUES

-- コマンド
('head', 'head', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'beginner',
'ファイルの先頭を表示',
'headはファイルの先頭部分（デフォルト10行）を表示します。',
'head file.txt\nhead -n 20 file.txt\nhead -c 100 file.txt',
'最初だけ見たい時に',
ARRAY['-nで行数指定', '-cでバイト数指定', 'パイプで使うことが多い', 'tail と対になるコマンド'], true),

('tail', 'tail', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'beginner',
'ファイルの末尾を表示',
'tailはファイルの末尾部分（デフォルト10行）を表示します。',
'tail file.txt\ntail -n 20 file.txt\ntail -f /var/log/syslog',
'お尻を見る',
ARRAY['-fでリアルタイム監視（follow）', 'ログ監視の定番', '-n +10で10行目以降全部', 'head と対になるコマンド'], true),

('wc', 'wc', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'beginner',
'行数・単語数・バイト数をカウント',
'wc（word count）はファイルの行数、単語数、バイト数を表示します。',
'wc file.txt\nwc -l file.txt  # 行数のみ\ncat file.txt | wc -w',
'数を数える',
ARRAY['-lで行数だけ', '-wで単語数だけ', '-cでバイト数だけ', 'パイプで件数カウントによく使う'], true),

('diff', 'diff', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'intermediate',
'ファイルの差分を表示',
'diffは2つのファイルの違いを表示します。',
'diff file1.txt file2.txt\ndiff -u old.txt new.txt  # unified形式',
'違いを見つける',
ARRAY['-uでunified形式（見やすい）', '-rでディレクトリ再帰比較', 'git diffの元になった', 'パッチファイル作成にも使う'], true),

('tar', 'tar', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'intermediate',
'アーカイブの作成・展開',
'tarはファイルをまとめてアーカイブしたり、展開したりします。',
'tar -cvf archive.tar dir/\ntar -xvf archive.tar\ntar -czvf archive.tar.gz dir/',
'テープアーカイブの略',
ARRAY['-cで作成、-xで展開、-tで一覧', '-zでgzip圧縮', '-vで詳細表示', 'オプションの順番を覚えるのが難関'], true),

('chown', 'chown', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'intermediate',
'ファイルの所有者を変更',
'chownはファイルの所有者やグループを変更します。',
'chown user file.txt\nchown user:group file.txt\nchown -R user:group dir/',
'オーナーを変える',
ARRAY['root権限が必要なことが多い', 'user:groupで両方指定', '-Rで再帰的に変更', 'chgrpはグループだけ変更'], true),

('ln', 'ln', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'intermediate',
'リンクを作成',
'lnはファイルへのリンク（ハードリンクまたはシンボリックリンク）を作成します。',
'ln -s /path/to/file linkname\nln file hardlink',
'ショートカットを作る',
ARRAY['-sでシンボリックリンク（ほぼ必須）', 'シンボリックリンクは絶対パス推奨', 'ハードリンクは同じファイルシステム内のみ', '削除してもリンクは残る罠'], true),

('basename', 'basename', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'beginner',
'パスからファイル名を取得',
'basenameはパス文字列からディレクトリ部分を除いたファイル名を返します。',
'basename /path/to/file.txt  # file.txt\nbasename /path/to/file.txt .txt  # file',
'ファイル名だけ欲しい時に',
ARRAY['第2引数で拡張子も除去できる', 'dirname と対になる', 'シェルスクリプトでよく使う', '${var##*/}でも同じことができる'], true),

('dirname', 'dirname', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'beginner',
'パスからディレクトリ部分を取得',
'dirnameはパス文字列からファイル名を除いたディレクトリ部分を返します。',
'dirname /path/to/file.txt  # /path/to',
'ディレクトリだけ欲しい時に',
ARRAY['basename と対になる', 'シェルスクリプトでよく使う', '${var%/*}でも同じことができる', 'スクリプトの場所取得に$(dirname $0)'], true),

('while', 'while文', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'syntax', 'intermediate',
'条件が真の間繰り返す',
'while文は条件が真の間、処理を繰り返します。',
'while read line; do\n  echo "$line"\ndone < file.txt\n\nwhile true; do\n  sleep 1\ndone',
'条件付きループ',
ARRAY['doneで終わる', 'while read lineでファイル読み込み', 'while trueで無限ループ', 'breakとcontinueが使える'], true),

('case', 'case文', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'syntax', 'intermediate',
'パターンマッチで分岐',
'case文は値のパターンに応じて処理を分岐します。switch文に相当。',
'case "$1" in\n  start)\n    echo "Starting"\n    ;;\n  stop)\n    echo "Stopping"\n    ;;\n  *)\n    echo "Usage: $0 {start|stop}"\n    ;;\nesac',
'switch文のBash版',
ARRAY[';;でケース終了', '*)がdefault', 'esacで終わる（caseの逆）', 'パターンに|で複数指定できる'], true),

('function', 'function', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'syntax', 'intermediate',
'関数を定義',
'functionで再利用可能な処理をまとめます。',
'greet() {\n  echo "Hello, $1!"\n}\ngreet "World"',
'処理をまとめる',
ARRAY['function greet() {}でも同じ', '引数は$1, $2...でアクセス', '$@で全引数', 'localでローカル変数'], true),

-- 変数
('exit-status', '$?', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'syntax', 'beginner',
'直前のコマンドの終了ステータス',
'$?は直前に実行したコマンドの終了ステータス（0=成功）を返します。',
'grep pattern file.txt\nif [ $? -eq 0 ]; then\n  echo "Found"\nfi',
'成功したか確認する',
ARRAY['0が成功、それ以外はエラー', 'if commandで直接判定する方がスマート', '次のコマンドで上書きされる', 'exit $?で終了ステータスを引き継ぐ'], true),

('args', '$@/$*', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'syntax', 'intermediate',
'全ての引数を参照',
'$@と$*はスクリプトに渡された全ての引数を参照します。',
'for arg in "$@"; do\n  echo "$arg"\ndone',
'引数をまとめて扱う',
ARRAY['"$@"は各引数を個別に', '"$*"は全引数を1つの文字列に', 'ダブルクォートで囲むのが重要', '$#で引数の数'], true),

('argcount', '$#', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'syntax', 'beginner',
'引数の数',
'$#はスクリプトに渡された引数の数を返します。',
'if [ $# -lt 1 ]; then\n  echo "Usage: $0 <arg>"\n  exit 1\nfi',
'引数は足りてるか',
ARRAY['引数チェックの定番', '$0は含まれない', '関数内では関数の引数数', 'バリデーションに必須'], true),

('read', 'read', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'beginner',
'標準入力から読み込み',
'readは標準入力から一行読み込んで変数に格納します。',
'read -p "Name: " name\necho "Hello, $name"\n\nwhile read line; do\n  echo "$line"\ndone < file.txt',
'ユーザー入力を受け取る',
ARRAY['-pでプロンプト表示', '-sでエコーなし（パスワード向け）', '-rでバックスラッシュを保持', 'while readでファイル読み込み'], true),

('export', 'export', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'intermediate',
'環境変数を設定',
'exportは変数を環境変数として子プロセスに引き継ぎます。',
'export PATH="$PATH:/new/path"\nexport MY_VAR="value"',
'子プロセスに変数を渡す',
ARRAY['exportしないと子プロセスに引き継がれない', '.bashrcでよく使う', '-nで環境変数を解除', 'env で一覧表示'], true);
