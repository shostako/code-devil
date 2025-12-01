-- 012_angel_notes_python.sql
-- Python 天使のノート（実用的なTips）

-- __init__()
UPDATE entries SET angel_title = 'インスタンス初期化の要', angel_notes = ARRAY['selfは必ず第一引数に書く', 'デフォルト値にミュータブルオブジェクト（リストなど）を使わない', 'super().__init__()で親クラスも初期化できる'] WHERE slug = 'init' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- @decorator
UPDATE entries SET angel_title = '関数を拡張する魔法', angel_notes = ARRAY['@functools.wrapsでメタデータを保持する', '引数付きデコレータは関数を二重にネストする', '@propertyでgetter/setterを簡潔に書ける'] WHERE slug = 'decorator' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- *args/**kwargs
UPDATE entries SET angel_title = '柔軟な引数受け取り', angel_notes = ARRAY['*argsはタプル、**kwargsは辞書として受け取る', '関数の引数を別の関数にそのまま渡す時に便利', '順序は: 通常引数 → *args → **kwargs'] WHERE slug = 'args-kwargs' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- abs()
UPDATE entries SET angel_title = '絶対値を取得', angel_notes = ARRAY['負の数を正の数に変換する', '複素数の場合は大きさ（magnitude）を返す', '距離計算や差分の絶対値を求める時に使う'] WHERE slug = 'abs' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- all()
UPDATE entries SET angel_title = '全要素がTrueか判定', angel_notes = ARRAY['空のイテラブルはTrueを返す', 'ジェネレータ式と組み合わせて条件チェックに使う', 'all(x > 0 for x in nums)のように書ける'] WHERE slug = 'all' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- any()
UPDATE entries SET angel_title = '一つでもTrueがあるか判定', angel_notes = ARRAY['空のイテラブルはFalseを返す', '短絡評価で最初のTrueで処理終了', 'any(x > 10 for x in nums)で条件マッチを確認'] WHERE slug = 'any' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- assert
UPDATE entries SET angel_title = 'デバッグ用の条件チェック', angel_notes = ARRAY['python -Oで無効化されるので本番のバリデーションには使わない', 'assert 条件, "エラーメッセージ"の形式で書く', 'テストコードでの検証に最適'] WHERE slug = 'assert' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- class
UPDATE entries SET angel_title = 'オブジェクト指向の基本', angel_notes = ARRAY['クラス名はCamelCase、メソッド名はsnake_case', 'クラス変数とインスタンス変数の違いを理解する', '@classmethodと@staticmethodの使い分けを覚える'] WHERE slug = 'class' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- dict.get()
UPDATE entries SET angel_title = 'キーが無くてもエラーにならない', angel_notes = ARRAY['第二引数でデフォルト値を指定できる', 'd.get("key", 0)でキーが無ければ0を返す', 'KeyErrorを避けたい時に使う'] WHERE slug = 'dict-get' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- dict.items()
UPDATE entries SET angel_title = 'キーと値のペアを取得', angel_notes = ARRAY['for k, v in d.items()でループできる', 'dict(d.items())で辞書のコピーを作れる', 'ソートしたい時はsorted(d.items())'] WHERE slug = 'dict-items' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- dict.keys()
UPDATE entries SET angel_title = 'キーの一覧を取得', angel_notes = ARRAY['list(d.keys())でリストに変換できる', 'in演算子でキーの存在確認に使える', '集合演算（&, |, -）が可能'] WHERE slug = 'dict-keys' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- dict.update()
UPDATE entries SET angel_title = '辞書を結合・更新', angel_notes = ARRAY['元の辞書が更新される（破壊的操作）', 'Python 3.9+では d | other_dict も使える', '同じキーがあれば後から渡した値で上書き'] WHERE slug = 'dict-update' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- dict.values()
UPDATE entries SET angel_title = '値の一覧を取得', angel_notes = ARRAY['list(d.values())でリストに変換', '値の合計はsum(d.values())', '重複を除くにはset(d.values())'] WHERE slug = 'dict-values' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- dict()
UPDATE entries SET angel_title = '辞書の作成', angel_notes = ARRAY['dict(key=value)でキーワード引数から作成可能', 'dict(zip(keys, values))でリストから辞書を作れる', '空の辞書は{}またはdict()で作成'] WHERE slug = 'dict' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- enumerate()
UPDATE entries SET angel_title = 'インデックス付きループ', angel_notes = ARRAY['for i, v in enumerate(lst)でインデックスと値を同時取得', 'start=1で1始まりにできる', 'range(len(lst))より可読性が高い'] WHERE slug = 'enumerate' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- f-string
UPDATE entries SET angel_title = '文字列フォーマットの最適解', angel_notes = ARRAY['f"{value:.2f}"で小数点以下2桁に', 'f"{value:>10}"で右寄せ10文字', '式も書ける: f"{x + y = }"でデバッグ出力'] WHERE slug = 'f-string' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- filter()
UPDATE entries SET angel_title = '条件に合う要素を抽出', angel_notes = ARRAY['list(filter(func, iterable))でリストに変換', 'Noneを渡すとFalsy値を除外', 'リスト内包表記の方が可読性高い場合も多い'] WHERE slug = 'filter' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- getattr()
UPDATE entries SET angel_title = '属性を動的に取得', angel_notes = ARRAY['getattr(obj, "name", default)でデフォルト値を指定可能', '属性名が文字列で渡される時に使う', 'hasattr()と組み合わせて安全にアクセス'] WHERE slug = 'getattr' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- global
UPDATE entries SET angel_title = 'グローバル変数を関数内で変更', angel_notes = ARRAY['関数内でglobal xと宣言してから使う', '読み取りだけならglobal宣言は不要', 'できるだけ使わない設計を心がける'] WHERE slug = 'global' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- hasattr()
UPDATE entries SET angel_title = '属性の存在確認', angel_notes = ARRAY['hasattr(obj, "name")でTrue/Falseを返す', 'try-exceptよりも簡潔に書ける', 'ダックタイピングの判定に使える'] WHERE slug = 'hasattr' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- import
UPDATE entries SET angel_title = 'モジュールの読み込み', angel_notes = ARRAY['from module import funcで特定の関数だけ読み込める', 'import module as mで別名を付けられる', '循環インポートに注意する'] WHERE slug = 'import' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- input()
UPDATE entries SET angel_title = 'ユーザー入力の受け取り', angel_notes = ARRAY['戻り値は常に文字列型', 'int(input())で数値として受け取る', 'プロンプト文字列を引数に渡せる'] WHERE slug = 'input' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- isinstance()
UPDATE entries SET angel_title = '型チェックの正しい方法', angel_notes = ARRAY['isinstance(x, (int, float))で複数の型をチェック', 'type(x) == intより継承も考慮される', 'ABCと組み合わせて抽象的な型チェックも可能'] WHERE slug = 'isinstance' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- lambda
UPDATE entries SET angel_title = '無名関数を簡潔に定義', angel_notes = ARRAY['sorted(lst, key=lambda x: x[1])でソートキー指定', '複雑なロジックは通常のdefで書く', 'mapやfilterと組み合わせて使う'] WHERE slug = 'lambda' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- len()
UPDATE entries SET angel_title = '長さ・要素数を取得', angel_notes = ARRAY['文字列、リスト、辞書など多くの型で使える', '空チェックはif lst:の方がPythonic', '__len__()を実装したクラスで使用可能'] WHERE slug = 'len' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- list.append()
UPDATE entries SET angel_title = '末尾に1要素追加', angel_notes = ARRAY['元のリストを変更する（破壊的操作）', '戻り値はNone（新しいリストは返さない）', '複数追加したい場合はextend()を使う'] WHERE slug = 'list-append' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- list.extend()
UPDATE entries SET angel_title = 'イテラブルを連結', angel_notes = ARRAY['lst.extend([1,2,3])で複数要素を追加', 'lst += [1,2,3]と同じ効果', 'appendと違いネストしない'] WHERE slug = 'list-extend' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- list.insert()
UPDATE entries SET angel_title = '指定位置に要素を挿入', angel_notes = ARRAY['lst.insert(0, x)で先頭に追加', 'インデックスが大きすぎても末尾に追加される', '頻繁な先頭挿入はcollections.dequeを検討'] WHERE slug = 'list-insert' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- list.pop()
UPDATE entries SET angel_title = '要素を取り出して削除', angel_notes = ARRAY['引数なしで末尾を取り出す', 'pop(0)で先頭を取り出す（ただし遅い）', 'キュー操作にはcollections.dequeを使う'] WHERE slug = 'list-pop' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- list.remove()
UPDATE entries SET angel_title = '値で要素を削除', angel_notes = ARRAY['最初に見つかった要素だけ削除される', '要素が無いとValueError', '存在確認してから削除するか、try-exceptで囲む'] WHERE slug = 'list-remove' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- list()
UPDATE entries SET angel_title = 'リストの作成・変換', angel_notes = ARRAY['list("abc")で["a","b","c"]に変換', 'list(range(10))で0-9のリスト', 'ジェネレータをリストに変換する時に使う'] WHERE slug = 'list' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- map()
UPDATE entries SET angel_title = '各要素に関数を適用', angel_notes = ARRAY['list(map(int, ["1","2"]))で文字列リストを数値に', 'ジェネレータを返すのでlist()で囲む', 'リスト内包表記の方が可読性高い場合も'] WHERE slug = 'map' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- max()/min()
UPDATE entries SET angel_title = '最大値・最小値を取得', angel_notes = ARRAY['key引数で比較基準を指定できる', 'max(lst, key=len)で最長の要素を取得', 'default引数で空の時のデフォルト値を指定'] WHERE slug = 'max-min' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- nonlocal
UPDATE entries SET angel_title = '外側のスコープの変数を変更', angel_notes = ARRAY['ネストした関数で外側の変数を変更する時に使う', 'globalと違いモジュールレベルではない', 'クロージャでカウンタを作る時に便利'] WHERE slug = 'nonlocal' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- open()
UPDATE entries SET angel_title = 'ファイルを開く', angel_notes = ARRAY['with文と組み合わせて自動クローズ', 'encoding="utf-8"を明示的に指定する', 'mode: "r"読み込み, "w"書き込み, "a"追記'] WHERE slug = 'open' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- os.getcwd()
UPDATE entries SET angel_title = '現在の作業ディレクトリを取得', angel_notes = ARRAY['スクリプトの実行場所ではなく作業ディレクトリ', 'os.chdir()で変更できる', '__file__でスクリプトの場所を取得する方が確実'] WHERE slug = 'os-getcwd' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- pathlib.Path
UPDATE entries SET angel_title = 'モダンなパス操作', angel_notes = ARRAY['os.pathより直感的で読みやすい', 'Path("/") / "dir" / "file"でパス結合', '.exists(), .is_file(), .read_text()など便利メソッド多数'] WHERE slug = 'pathlib' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- print()
UPDATE entries SET angel_title = '出力の基本', angel_notes = ARRAY['sep引数で区切り文字を変更できる', 'end引数で末尾の改行を制御', 'file引数でファイルに出力可能'] WHERE slug = 'print' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- raise
UPDATE entries SET angel_title = '例外を発生させる', angel_notes = ARRAY['raise ValueError("メッセージ")で例外を投げる', 'except内でraiseだけ書くと再送出', 'raise ... from ...で例外チェーンを作れる'] WHERE slug = 'raise' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- range()
UPDATE entries SET angel_title = '数列を生成', angel_notes = ARRAY['range(start, stop, step)で開始・終了・増分を指定', 'stopは含まれない（半開区間）', 'メモリ効率が良い（遅延評価）'] WHERE slug = 'range' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- round()
UPDATE entries SET angel_title = '四捨五入', angel_notes = ARRAY['round(3.5)は4ではなく4（銀行家の丸め）', '第二引数で小数点以下の桁数を指定', '負の値で整数部分を丸められる'] WHERE slug = 'round' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- setattr()
UPDATE entries SET angel_title = '属性を動的に設定', angel_notes = ARRAY['setattr(obj, "name", value)で属性を設定', '動的にプロパティを追加する時に使う', 'getattr()とセットで覚える'] WHERE slug = 'setattr' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- sorted()
UPDATE entries SET angel_title = '新しいソート済みリストを返す', angel_notes = ARRAY['元のリストは変更されない', 'key引数で比較キーを指定', 'reverse=Trueで降順ソート'] WHERE slug = 'sorted' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- str.join()
UPDATE entries SET angel_title = '文字列を結合', angel_notes = ARRAY['",".join(["a","b"])で"a,b"', '区切り文字.join(リスト)の順序に注意', '文字列のリストにしか使えない'] WHERE slug = 'str-join' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- str.replace()
UPDATE entries SET angel_title = '文字列を置換', angel_notes = ARRAY['s.replace("old", "new")で置換', '第三引数で置換回数を制限できる', '正規表現が必要ならre.sub()を使う'] WHERE slug = 'str-replace' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- str.split()
UPDATE entries SET angel_title = '文字列を分割', angel_notes = ARRAY['引数なしで空白文字で分割', 'maxsplit引数で分割回数を制限', '"a,b,c".split(",")で["a","b","c"]'] WHERE slug = 'str-split' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- str.strip()
UPDATE entries SET angel_title = '前後の空白を除去', angel_notes = ARRAY['lstrip()で左側だけ、rstrip()で右側だけ', '引数で除去する文字を指定できる', 'ユーザー入力のクリーンアップに便利'] WHERE slug = 'str-strip' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- sum()
UPDATE entries SET angel_title = '合計を計算', angel_notes = ARRAY['sum(lst, start)でstartから足し始める', '文字列の結合には使えない（"".join()を使う）', 'math.fsumで浮動小数点の精度を保つ'] WHERE slug = 'sum' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- try/except
UPDATE entries SET angel_title = '例外処理', angel_notes = ARRAY['except Exception as eでエラーオブジェクトを取得', 'finally句は必ず実行される', 'else句は例外が発生しなかった時に実行'] WHERE slug = 'try-except' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- with
UPDATE entries SET angel_title = 'コンテキストマネージャ', angel_notes = ARRAY['リソースの確実な解放を保証する', 'with open() as f:でファイルを安全に扱う', '__enter__と__exit__を実装したクラスで使える'] WHERE slug = 'with' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- zip()
UPDATE entries SET angel_title = '複数のイテラブルを同時にループ', angel_notes = ARRAY['for a, b in zip(lst1, lst2):で同時に取り出す', '長さが違う場合は短い方に合わせる', 'zip_longest()で長い方に合わせることも可能'] WHERE slug = 'zip' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- リスト内包表記
UPDATE entries SET angel_title = 'リストを簡潔に生成', angel_notes = ARRAY['[x**2 for x in range(10)]で二乗のリスト', 'if条件でフィルタリングも可能', 'ネストは2段階までが読みやすさの限界'] WHERE slug = 'list-comprehension' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- 型ヒント
UPDATE entries SET angel_title = 'コードの可読性とIDE補完を向上', angel_notes = ARRAY['def func(x: int) -> str:の形式で書く', '実行時には強制されない（ドキュメント的役割）', 'mypyでの静的チェックと組み合わせると効果的'] WHERE slug = 'type-hints' AND language_id = (SELECT id FROM languages WHERE slug = 'python');
