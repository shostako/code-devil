-- 006: 大規模コンテンツ拡充
-- Python +20件, JavaScript +20件, Bash +10件

-- ===========================================
-- PYTHON 追加エントリ (language_id: 11111111-1111-1111-1111-111111111111)
-- category_id: aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa (組み込み関数)
-- ===========================================

INSERT INTO entries (id, slug, name, language_id, category_id, entry_type, difficulty, short_desc, full_desc, code_example, sarcastic_title, sarcastic_notes, is_published) VALUES

-- 関数系
('d1111111-1111-1111-1111-111111111111', 'map', 'map()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'intermediate',
'イテラブルの各要素に関数を適用',
'map(function, iterable)は各要素に関数を適用したイテレータを返します。リストが欲しければlist()で囲む必要があります。',
'list(map(lambda x: x * 2, [1, 2, 3]))',
'リスト内包表記の劣化版',
ARRAY['リスト内包表記で書いた方が速いし読みやすい', 'でもmapって書くとなんか関数型っぽくてカッコいいよね', 'ラムダと組み合わせると可読性が地獄になる', 'Python 2では直接リストを返してたのに...'], true),

('d2222222-2222-2222-2222-222222222222', 'filter', 'filter()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'intermediate',
'条件に合う要素だけを抽出',
'filter(function, iterable)は条件を満たす要素だけを含むイテレータを返します。',
'list(filter(lambda x: x > 0, [-1, 0, 1, 2]))',
'if文を関数型っぽく書きたい人向け',
ARRAY['リスト内包表記の[x for x in lst if cond]で十分', 'Noneを渡すとFalsyな値を除去できる、知ってた？', 'mapと組み合わせると読めなくなる速度が加速する'], true),

('d3333333-3333-3333-3333-333333333333', 'zip', 'zip()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'intermediate',
'複数のイテラブルを並行してイテレート',
'zip(*iterables)は複数のイテラブルから同時に要素を取り出すイテレータを返します。',
'list(zip([1, 2, 3], ["a", "b", "c"]))',
'ファスナーのように噛み合わせる',
ARRAY['長さが違うと短い方に合わせて切り捨てる容赦のなさ', 'zip_longestが欲しければitertoolsから', 'dict(zip(keys, values))は定番パターン', 'unzipしたければzip(*zipped)で逆変換'], true),

('d4444444-4444-4444-4444-444444444444', 'enumerate', 'enumerate()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'インデックス付きでイテレート',
'enumerate(iterable, start=0)はインデックスと要素のタプルを返すイテレータを生成します。',
'for i, item in enumerate(["a", "b", "c"]):\n    print(i, item)',
'range(len())撲滅運動の主役',
ARRAY['for i in range(len(lst))を書いたら負け', 'start=1で1から始められる、意外と知られてない', 'Pythonらしさの象徴、これを知らないとモグリ扱い'], true),

('d5555555-5555-5555-5555-555555555555', 'sorted', 'sorted()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'ソートされた新しいリストを返す',
'sorted(iterable, key=None, reverse=False)は元のリストを変更せず、ソートされた新しいリストを返します。',
'sorted([3, 1, 4, 1, 5], reverse=True)',
'list.sort()の非破壊版',
ARRAY['元のリストを壊したくないときはこっち', 'keyにlambda渡すと任意の条件でソートできる', 'reverse=Trueを忘れて二度手間になるやつ'], true),

('d6666666-6666-6666-6666-666666666666', 'lambda', 'lambda', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'syntax', 'intermediate',
'無名関数を定義',
'lambda arguments: expressionで一行の無名関数を定義できます。複数行は書けません。',
'square = lambda x: x ** 2',
'defを書くのが面倒な人の味方',
ARRAY['複雑なラムダは可読性の墓場', '変数に代入するくらいならdef使え（PEP8）', 'mapやfilterと組み合わせると関数型プログラマーごっこができる', '一行に収まらないならおとなしくdef使え'], true),

('d7777777-7777-7777-7777-777777777777', 'open', 'open()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'ファイルを開く',
'open(file, mode="r", encoding=None)でファイルオブジェクトを取得します。',
'with open("file.txt", "r", encoding="utf-8") as f:\n    content = f.read()',
'withと一緒に使わないと呪われる',
ARRAY['closeし忘れるとリソースリークする', 'with文と組み合わせるのが現代の作法', 'encoding指定しないとWindowsで地獄を見る', 'mode="w"で既存ファイルが消える恐怖'], true),

('d8888888-8888-8888-8888-888888888888', 'with', 'with', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'syntax', 'intermediate',
'コンテキストマネージャを使う',
'with文はリソースの確実な解放を保証します。__enter__と__exit__を持つオブジェクトに使えます。',
'with open("file.txt") as f:\n    data = f.read()',
'try-finallyの美しい代替',
ARRAY['ファイル操作でwithを使わないのは犯罪', 'ネストしすぎると横に長くなる', 'カンマで複数のコンテキストマネージャを並べられる'], true),

('d9999999-9999-9999-9999-999999999999', 'try-except', 'try/except', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'syntax', 'beginner',
'例外処理',
'try-except文で例外をキャッチして適切に処理できます。',
'try:\n    result = 10 / 0\nexcept ZeroDivisionError:\n    print("ゼロ除算だよ")',
'バグを握りつぶす魔法',
ARRAY['except:だけで書くと何でも握りつぶす最悪のパターン', 'except Exception as eで例外オブジェクトを取得', 'finallyは必ず実行される、returnがあっても', 'elseブロックの存在を忘れがち'], true),

('da111111-1111-1111-1111-111111111111', 'class', 'class', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'syntax', 'intermediate',
'クラスを定義',
'class文でクラスを定義し、オブジェクト指向プログラミングを実現します。',
'class Dog:\n    def __init__(self, name):\n        self.name = name\n    def bark(self):\n        print(f"{self.name}: ワン!")',
'オブジェクト指向の入り口',
ARRAY['selfを書き忘れるのは通過儀礼', '__init__はコンストラクタじゃなくてイニシャライザ（厳密には）', '継承より合成を好めと言われるが、継承も便利', 'dataclassesを使えばボイラープレートが激減'], true),

('da222222-2222-2222-2222-222222222222', 'init', '__init__()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'intermediate',
'インスタンス初期化メソッド',
'__init__メソッドはインスタンス生成時に自動的に呼ばれ、初期化処理を行います。',
'class Person:\n    def __init__(self, name, age):\n        self.name = name\n        self.age = age',
'コンストラクタと呼ぶと怒られる',
ARRAY['selfを第一引数に書くのを忘れる初心者あるある', '__new__との違いを聞かれると困る', 'デフォルト引数にミュータブルを使うとバグる', 'returnしても意味がない（Noneが返る）'], true),

('da333333-3333-3333-3333-333333333333', 'decorator', '@decorator', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'syntax', 'advanced',
'関数やクラスを装飾',
'デコレータは関数を受け取り、拡張された関数を返す高階関数です。@記法で適用します。',
'@lru_cache(maxsize=128)\ndef fib(n):\n    return n if n < 2 else fib(n-1) + fib(n-2)',
'関数を魔改造する黒魔術',
ARRAY['@propertyと@staticmethodは必須知識', '@functools.wrapsを付けないと__name__が壊れる', 'デコレータを自作できたら中級者', '複数デコレータは下から順に適用される'], true),

('da444444-4444-4444-4444-444444444444', 'import', 'import', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'syntax', 'beginner',
'モジュールをインポート',
'import文で他のモジュールの機能を利用できます。',
'import os\nfrom pathlib import Path\nfrom typing import List, Optional',
'他人のコードを拝借する呪文',
ARRAY['循環インポートで地獄を見るやつ', 'from xxx import *は可読性の敵', 'as でエイリアスを付けられる', '__init__.pyの存在意義を理解するまでが長い'], true),

('da555555-5555-5555-5555-555555555555', 'args-kwargs', '*args/**kwargs', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'syntax', 'intermediate',
'可変長引数',
'*argsは位置引数をタプルで、**kwargsはキーワード引数を辞書で受け取ります。',
'def func(*args, **kwargs):\n    print(args, kwargs)\nfunc(1, 2, a=3, b=4)',
'引数の数を気にしない怠惰の極み',
ARRAY['順番はargs, kwargs の順で固定', '*でアンパックもできる', 'デコレータ書くときに必須', '使いすぎると何を渡せばいいかわからなくなる'], true),

('da666666-6666-6666-6666-666666666666', 'os-getcwd', 'os.getcwd()', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'function', 'beginner',
'現在の作業ディレクトリを取得',
'os.getcwd()は現在の作業ディレクトリの絶対パスを文字列で返します。',
'import os\nprint(os.getcwd())',
'自分がどこにいるか確認する関数',
ARRAY['Path.cwd()の方がモダン', 'スクリプトの場所と作業ディレクトリは別物', '__file__と混同しがち', 'os.chdir()で変更できるが、やりすぎると混乱する'], true),

('da777777-7777-7777-7777-777777777777', 'pathlib', 'pathlib.Path', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'class', 'intermediate',
'パス操作のモダンな方法',
'pathlibモジュールのPathクラスはファイルパスをオブジェクト指向で扱えます。',
'from pathlib import Path\np = Path("dir") / "file.txt"\nif p.exists():\n    content = p.read_text()',
'os.pathを過去にする新星',
ARRAY['/(スラッシュ)演算子でパス結合できるのがオシャレ', 'os.path.joinより直感的', '.read_text()と.write_text()が便利すぎる', 'Python 3.4以降の特権'], true),

('da888888-8888-8888-8888-888888888888', 'list-comprehension', 'リスト内包表記', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'syntax', 'intermediate',
'リストを簡潔に生成',
'[expression for item in iterable if condition]でリストを一行で生成できます。',
'squares = [x**2 for x in range(10) if x % 2 == 0]',
'forループを一行に圧縮する魔法',
ARRAY['読みやすさのためにあるのに、複雑にすると逆効果', 'ネストすると頭がバグる', 'dict/set/generator内包表記もある', 'map/filterより速い（ことが多い）'], true),

('da999999-9999-9999-9999-999999999999', 'f-string', 'f-string', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'syntax', 'beginner',
'フォーマット済み文字列リテラル',
'f"..."で変数や式を直接文字列に埋め込めます。Python 3.6以降。',
'name = "World"\nprint(f"Hello, {name}!")',
'.format()を過去にした革命児',
ARRAY['%記法や.format()より読みやすい', '{変数=}でデバッグ出力が楽になる（3.8+）', '波括弧自体を出したいときは{{}}', 'f-string内で関数呼び出しもできる'], true),

('db111111-1111-1111-1111-111111111111', 'type-hints', '型ヒント', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'syntax', 'intermediate',
'静的型付けっぽいことをする',
'型ヒントで関数の引数や戻り値の型を明示できます。実行時には強制されません。',
'def greet(name: str) -> str:\n    return f"Hello, {name}"',
'動的型付け言語の反逆',
ARRAY['実行時にはチェックされない（重要）', 'mypyやpyrightでチェックする', 'Optional[X]はX | Noneのこと', 'TypedDictで辞書にも型を付けられる'], true);

-- ===========================================
-- JAVASCRIPT 追加エントリ (language_id: 22222222-2222-2222-2222-222222222222)
-- category_id: bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb (配列・オブジェクト)
-- ===========================================

INSERT INTO entries (id, slug, name, language_id, category_id, entry_type, difficulty, short_desc, full_desc, code_example, sarcastic_title, sarcastic_notes, is_published) VALUES

('e1111111-1111-1111-1111-111111111111', 'foreach', 'Array.forEach()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'beginner',
'配列の各要素に対して関数を実行',
'forEach()は配列の各要素に対してコールバック関数を実行します。戻り値はundefinedです。',
'[1, 2, 3].forEach((num, index) => {\n  console.log(`${index}: ${num}`);\n});',
'for文を書くのが面倒な人向け',
ARRAY['breakできない、それが最大の罠', 'returnしても次の要素に進むだけ', 'map()と違って何も返さない', '非同期処理と相性最悪、awaitが効かない'], true),

('e2222222-2222-2222-2222-222222222222', 'reduce', 'Array.reduce()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'advanced',
'配列を単一の値に集約',
'reduce(callback, initialValue)は配列の要素を順に処理し、単一の値にまとめます。',
'const sum = [1, 2, 3, 4].reduce((acc, cur) => acc + cur, 0);',
'理解できたら中級者卒業',
ARRAY['初期値を忘れると空配列で死ぬ', 'アキュムレータという概念に慣れるまでが長い', '何でもできすぎて可読性が犠牲になりがち', 'オブジェクトの変換にも使える万能選手'], true),

('e3333333-3333-3333-3333-333333333333', 'find', 'Array.find()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'beginner',
'条件に合う最初の要素を返す',
'find()は条件を満たす最初の要素を返します。見つからなければundefined。',
'const users = [{id: 1, name: "A"}, {id: 2, name: "B"}];\nconst user = users.find(u => u.id === 2);',
'配列の中から一人を探し出す',
ARRAY['見つからないとundefinedが返る、nullじゃない', 'findIndex()はインデックスを返す兄弟', 'filter()[0]より意図が明確', 'includes()は値の存在確認だけ'], true),

('e4444444-4444-4444-4444-444444444444', 'some-every', 'Array.some()/every()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'intermediate',
'配列の要素が条件を満たすかチェック',
'some()は一つでも条件を満たせばtrue、every()は全て満たせばtrueを返します。',
'[1, 2, 3].some(n => n > 2);  // true\n[1, 2, 3].every(n => n > 0); // true',
'全員か、誰か一人か',
ARRAY['空配列のevery()はtrue、直感に反する', 'some()は見つかった時点で終了する（最適化）', 'includes()で足りない時に使う', 'バリデーションでよく使う'], true),

('e5555555-5555-5555-5555-555555555555', 'spread', 'スプレッド構文', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'operator', 'intermediate',
'配列やオブジェクトを展開',
'...を使って配列やオブジェクトの要素を展開できます。',
'const arr1 = [1, 2];\nconst arr2 = [...arr1, 3, 4];\nconst obj = {...baseObj, newProp: "value"};',
'三点リーダーの魔法',
ARRAY['シャローコピーなので注意、ネストは参照のまま', 'Object.assign()より直感的', '配列の結合がconcat()より見やすくなった', 'Math.max(...arr)は定番パターン'], true),

('e6666666-6666-6666-6666-666666666666', 'destructuring', '分割代入', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'syntax', 'intermediate',
'配列やオブジェクトから値を取り出す',
'配列やオブジェクトから必要な値だけを変数に取り出せます。',
'const {name, age} = user;\nconst [first, second] = array;',
'オブジェクトをバラバラにする呪文',
ARRAY['デフォルト値も設定できる: {name = "default"}', 'ネストも分割できるが読みにくくなる', '関数の引数でよく使う', 'リネームは {old: newName} の順'], true),

('e7777777-7777-7777-7777-777777777777', 'fetch', 'fetch()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'intermediate',
'HTTPリクエストを送信',
'fetch()はPromiseベースのHTTPクライアントです。モダンなAjax。',
'const res = await fetch("/api/data");\nconst json = await res.json();',
'XMLHttpRequestの後継者',
ARRAY['404でもrejectしない、res.okをチェックしろ', '.json()も非同期、awaitを忘れるな', 'CORSエラーは別問題', 'axiosの方が便利という説もある'], true),

('e8888888-8888-8888-8888-888888888888', 'settimeout', 'setTimeout()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'beginner',
'一定時間後に関数を実行',
'setTimeout(callback, delay)は指定ミリ秒後にコールバックを実行します。',
'setTimeout(() => {\n  console.log("1秒経過");\n}, 1000);',
'遅延実行の定番',
ARRAY['0msでも即時実行ではない、イベントループを理解しろ', 'clearTimeout()でキャンセルできる', 'setInterval()は繰り返し版', 'async/awaitでsleep代わりに使える'], true),

('e9999999-9999-9999-9999-999999999999', 'class-js', 'class', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'syntax', 'intermediate',
'クラスを定義（ES6）',
'ES6で導入されたクラス構文。プロトタイプベースの糖衣構文です。',
'class Animal {\n  constructor(name) {\n    this.name = name;\n  }\n  speak() {\n    console.log(`${this.name} makes a sound`);\n  }\n}',
'プロトタイプを隠蔽する仮面',
ARRAY['結局プロトタイプベースは変わらない', 'thisの束縛問題は健在', '#で私有フィールドが使える（ES2022）', 'extendsで継承、superで親呼び出し'], true),

('ea111111-1111-1111-1111-111111111111', 'this', 'this', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'syntax', 'advanced',
'実行コンテキストを参照',
'thisは関数の呼び出し方によって参照先が変わります。JavaScriptの難所。',
'const obj = {\n  name: "obj",\n  greet() { console.log(this.name); }\n};\nobj.greet(); // "obj"',
'JavaScript最大の罠',
ARRAY['アロー関数はthisを束縛しない、レキシカルスコープ', 'bind/call/applyで明示的に指定できる', 'use strictで未定義がundefinedになる', 'クラスのメソッドをコールバックで渡すと死ぬ'], true),

('ea222222-2222-2222-2222-222222222222', 'arrow-function', 'アロー関数', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'syntax', 'beginner',
'簡潔な関数式',
'(args) => expressionで関数を簡潔に書けます。thisを束縛しない特徴があります。',
'const add = (a, b) => a + b;\nconst greet = name => `Hello, ${name}`;',
'functionを書くのが面倒な人の救世主',
ARRAY['thisを束縛しないのは機能であり仕様', '引数1つなら括弧省略可', 'オブジェクトを返すなら({})で囲む', 'コンストラクタには使えない'], true),

('ea333333-3333-3333-3333-333333333333', 'import-export', 'import/export', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'syntax', 'intermediate',
'ESモジュールのインポート/エクスポート',
'ES6モジュールで関数やクラスを他のファイルと共有できます。',
'// export\nexport const foo = 1;\nexport default function bar() {}\n// import\nimport bar, {foo} from "./module.js";',
'require()を過去にした新時代',
ARRAY['default exportは1つだけ', 'named exportは複数OK', 'ブラウザでは type="module" が必要', 'CommonJS (require) と混在すると地獄'], true),

('ea444444-4444-4444-4444-444444444444', 'optional-chaining', 'オプショナルチェーン', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'operator', 'intermediate',
'安全にプロパティにアクセス',
'?.演算子でnull/undefinedでもエラーにならずにアクセスできます。',
'const name = user?.profile?.name;\nconst result = obj?.method?.();',
'Cannot read property of undefinedを撲滅',
ARRAY['ES2020で追加された救世主', '関数呼び出しにも使える: obj?.method?.()', 'Nullish coalescing (??) と組み合わせると最強', 'TypeScriptでは昔からあった'], true),

('ea555555-5555-5555-5555-555555555555', 'nullish-coalescing', 'Null合体演算子', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'operator', 'intermediate',
'null/undefinedの時だけ代替値',
'??演算子は左辺がnull/undefinedの時だけ右辺を返します。',
'const name = user.name ?? "匿名";\nconst count = data.count ?? 0;',
'||の改良版',
ARRAY['||は0や空文字もfalsyで置換してしまう', '??はnull/undefinedだけ', 'デフォルト値設定の新定番', '&&や||と混在するとエラー、()で囲め'], true),

('ea666666-6666-6666-6666-666666666666', 'template-literal', 'テンプレートリテラル', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'syntax', 'beginner',
'バッククォートで文字列を書く',
'`（バッククォート）で囲むと変数埋め込みや改行が簡単に書けます。',
'const msg = `Hello, ${name}!\nWelcome to ${place}.`;',
'文字列結合地獄からの解放',
ARRAY['${}の中では式が書ける', '改行がそのまま反映される', 'タグ付きテンプレートという闇がある', 'バッククォート自体は\\`でエスケープ'], true),

('ea777777-7777-7777-7777-777777777777', 'process-cwd', 'process.cwd()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'beginner',
'現在の作業ディレクトリを取得（Node.js）',
'process.cwd()はNode.jsで現在の作業ディレクトリを返します。',
'const cwd = process.cwd();\nconsole.log(`Working directory: ${cwd}`);',
'Node.jsで自分の居場所を知る',
ARRAY['__dirnameはファイルの場所、cwdは実行時の場所', 'process.chdir()で変更できる', 'ブラウザでは使えない、当然だが', 'ESMでは__dirnameが使えないのでこちらを使う場面が増えた'], true),

('ea888888-8888-8888-8888-888888888888', 'json-parse', 'JSON.parse()/stringify()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'beginner',
'JSONの変換',
'JSON.parse()は文字列をオブジェクトに、JSON.stringify()はオブジェクトを文字列に変換します。',
'const obj = JSON.parse(''{"name":"test"}'');\nconst str = JSON.stringify(obj);',
'APIとの会話の基本',
ARRAY['parseは不正なJSONでエラーを投げる', 'undefinedやFunctionは変換で消える', 'stringifyの第3引数で整形できる', 'BigIntは変換できない、注意'], true),

('ea999999-9999-9999-9999-999999999999', 'object-keys', 'Object.keys()/values()/entries()', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'function', 'intermediate',
'オブジェクトのキー/値を配列で取得',
'Object.keys()はキー、values()は値、entries()はキーと値のペアを配列で返します。',
'const obj = {a: 1, b: 2};\nObject.keys(obj);    // ["a", "b"]\nObject.entries(obj); // [["a", 1], ["b", 2]]',
'オブジェクトをイテラブルにする魔法',
ARRAY['for-inより安全（prototypeを含まない）', 'entries()とforEachの組み合わせが便利', 'Object.fromEntries()で逆変換', 'Mapの方が適してる場合もある'], true),

('eb111111-1111-1111-1111-111111111111', 'try-catch-js', 'try/catch/finally', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'syntax', 'beginner',
'例外処理',
'try-catch文でエラーをキャッチし、適切に処理できます。',
'try {\n  JSON.parse("invalid");\n} catch (e) {\n  console.error("Parse failed:", e.message);\n} finally {\n  console.log("Always runs");\n}',
'エラーを握りつぶす呪文',
ARRAY['catchしないとプロセスが死ぬ（Node.js）', 'async関数内ではtry-catchが使える', 'finallyはreturnがあっても実行される', 'エラーを再throwする場合も多い'], true);

-- ===========================================
-- BASH 追加エントリ (language_id: 33333333-3333-3333-3333-333333333333)
-- category_id: ca111111-1111-1111-1111-111111111111 (基本コマンド)
-- ===========================================

INSERT INTO entries (id, slug, name, language_id, category_id, entry_type, difficulty, short_desc, full_desc, code_example, sarcastic_title, sarcastic_notes, is_published) VALUES

('f1111111-1111-1111-1111-111111111111', 'pwd', 'pwd', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'beginner',
'現在の作業ディレクトリを表示',
'pwd (print working directory) は現在いるディレクトリのパスを表示します。',
'pwd\n# /home/user/projects',
'自分がどこにいるか確認するコマンド',
ARRAY['迷子になったらまずこれ', 'cdでディレクトリ移動後に確認する癖をつけろ', 'シンボリックリンク経由だと-Pで実パスがわかる', 'スクリプト内では$(pwd)で変数に入れる'], true),

('f2222222-2222-2222-2222-222222222222', 'awk', 'awk', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'advanced',
'パターン処理言語',
'awkはテキスト処理のためのプログラミング言語です。列の抽出やデータ加工に威力を発揮します。',
'# 第2列を表示\nawk ''{print $2}'' file.txt\n# カンマ区切りで第1列\nawk -F'','' ''{print $1}'' data.csv',
'sedの兄貴分、テキスト処理の王様',
ARRAY['$1, $2...で列アクセス、$0は全体', '-Fでデリミタを指定', 'BEGINとENDで前後処理', 'ワンライナーで済ませようとすると読めなくなる'], true),

('f3333333-3333-3333-3333-333333333333', 'sed', 'sed', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'advanced',
'ストリームエディタ',
'sedはテキストをストリームとして処理し、置換や削除を行います。',
'# 置換\nsed ''s/old/new/g'' file.txt\n# 行削除\nsed ''/pattern/d'' file.txt',
'vimを開かずに編集する魔法',
ARRAY['-iで直接ファイルを書き換える（危険）', 'macOSのsedはBSD版、Linuxと微妙に違う', '正規表現の方言に注意', 's/old/new/gのgを忘れると最初の1つだけ置換'], true),

('f4444444-4444-4444-4444-444444444444', 'cut', 'cut', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'intermediate',
'テキストから列を切り出す',
'cutはテキストから指定した列やフィールドを切り出します。',
'# カンマ区切りで第1,3列\ncut -d'','' -f1,3 data.csv\n# 文字位置1-10\ncut -c1-10 file.txt',
'awkより軽い列抽出',
ARRAY['-dでデリミタ、-fでフィールド指定', '複数フィールドは-f1,2,3や-f1-3', 'awkより速いが機能は限定的', 'デリミタが連続すると空フィールドになる'], true),

('f5555555-5555-5555-5555-555555555555', 'sort', 'sort', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'beginner',
'行をソート',
'sortはテキストの行をアルファベット順や数値順にソートします。',
'# アルファベット順\nsort file.txt\n# 数値順\nsort -n numbers.txt\n# 逆順\nsort -r file.txt',
'並べ替えの基本',
ARRAY['-nで数値ソート、ないと10が2より前になる', '-rで逆順', '-uで重複削除（uniq不要）', '-kで特定の列でソート'], true),

('f6666666-6666-6666-6666-666666666666', 'uniq', 'uniq', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'beginner',
'連続する重複行を削除',
'uniqは連続する重複行を削除します。事前にsortが必要なことが多いです。',
'# 重複削除（要sort）\nsort file.txt | uniq\n# 出現回数カウント\nsort file.txt | uniq -c',
'sortとセットで使うやつ',
ARRAY['ソートしないと連続しない重複は残る', '-cで出現回数をカウント', '-dで重複行だけ表示', 'sort -uで済む場合も多い'], true),

('f7777777-7777-7777-7777-777777777777', 'xargs', 'xargs', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'intermediate',
'標準入力をコマンドの引数に変換',
'xargsは標準入力から読み取った内容をコマンドの引数として渡します。',
'# ファイルを削除\nfind . -name "*.tmp" | xargs rm\n# 確認しながら\nfind . -name "*.log" | xargs -p rm',
'パイプの先で引数に変換する黒魔術',
ARRAY['-Iで置換文字列を指定できる', '-nで引数の数を制限', '-Pで並列実行', 'ファイル名にスペースがあると死ぬ、-0で対策'], true),

('f8888888-8888-8888-8888-888888888888', 'tee', 'tee', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'intermediate',
'標準出力をファイルにも書き出す',
'teeは標準入力を標準出力に流しつつ、ファイルにも書き出します。',
'# 画面に表示しつつログにも保存\nsome_command | tee output.log\n# 追記モード\nsome_command | tee -a output.log',
'分岐パイプの実装',
ARRAY['デバッグ時にログを取りながら確認できる', '-aで追記、なしで上書き', 'sudoと組み合わせる小技がある', '複数ファイルに同時出力もできる'], true),

('f9999999-9999-9999-9999-999999999999', 'trap', 'trap', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'advanced',
'シグナルをキャッチして処理',
'trapはシグナルを受け取った時に実行するコマンドを設定します。',
'# Ctrl+Cでクリーンアップ\ntrap ''rm -f /tmp/lockfile; exit'' INT TERM\n# 終了時に必ず実行\ntrap ''cleanup'' EXIT',
'スクリプトの後始末を保証する',
ARRAY['EXITは正常終了でも異常終了でも実行される', 'INT(Ctrl+C), TERM(kill)を捕捉', '一時ファイルの削除によく使う', 'trap - SIGNALでリセット'], true),

('fa111111-1111-1111-1111-111111111111', 'source', 'source (.)', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'intermediate',
'スクリプトを現在のシェルで実行',
'sourceまたは.は、スクリプトを現在のシェル環境で実行します。サブシェルを起動しません。',
'# 設定ファイルを読み込み\nsource ~/.bashrc\n# 同じ意味\n. ~/.bashrc',
'環境変数を反映させる呪文',
ARRAY['./script.shは別シェル、sourceは現シェル', '環境変数の変更を反映させたい時に必須', '.bashrcを変更したら source ~/.bashrc', 'exportした変数は子プロセスにも継承'], true);
