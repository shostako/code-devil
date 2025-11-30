-- 007: Python追加エントリ（29件）
-- JavaScript/Bashは既にDBに適用済みのため除外


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
