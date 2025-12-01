-- CodeDevil Phase 4: 既存言語拡充
-- Python (+20), JavaScript (+25), Bash (+15) = 合計60エントリ

-- ============================================
-- Part 1: Python新カテゴリ追加
-- ============================================
INSERT INTO categories (id, language_id, slug, name, sort_order) VALUES
  ('d0555555-5555-5555-5555-555555555555', '11111111-1111-1111-1111-111111111111', 'async', '非同期処理', 10),
  ('d0666666-6666-6666-6666-666666666666', '11111111-1111-1111-1111-111111111111', 'decorators', 'デコレータ', 11),
  ('d0777777-7777-7777-7777-777777777777', '11111111-1111-1111-1111-111111111111', 'advanced-stdlib', '標準ライブラリ応用', 12);

-- ============================================
-- Part 2: Python追加エントリ（20件）
-- ============================================
INSERT INTO entries (slug, name, language_id, category_id, entry_type, difficulty, short_desc, full_desc, code_example, sarcastic_title, sarcastic_notes, angel_title, angel_notes, is_published) VALUES

-- 非同期処理（7件）
('async-await', 'async/await', '11111111-1111-1111-1111-111111111111', 'd0555555-5555-5555-5555-555555555555', 'syntax', 'intermediate',
'非同期関数を定義・実行する',
'async defで非同期関数を定義し、await式で非同期処理を待機します。イベントループ上で実行され、I/O待ちの間に他の処理を実行できます。',
E'import asyncio

async def fetch_data(url):
    await asyncio.sleep(1)  # ネットワーク待機をシミュレート
    return f"Data from {url}"

async def main():
    result = await fetch_data("https://api.example.com")
    print(result)

asyncio.run(main())',
'同期の仮面を被った非同期',
ARRAY['awaitを忘れるとコルーチンオブジェクトが返ってきて詰む', 'asyncio.run()の中でasyncio.run()は呼べない罠', 'ブロッキング関数をawaitしても並行実行されないぞ', 'ThreadPoolExecutorで包まないと重い処理がイベントループを止める'],
'非同期処理の基本',
ARRAY['async defで非同期関数を定義', 'await式で処理完了を待機', 'asyncio.run()でイベントループ開始', 'I/O待ちの間に他の処理を実行可能'],
true),

('asyncio-gather', 'asyncio.gather()', '11111111-1111-1111-1111-111111111111', 'd0555555-5555-5555-5555-555555555555', 'function', 'intermediate',
'複数の非同期処理を並行実行',
'複数のコルーチンを並行実行し、すべての結果を待ちます。順序は保証され、エラーハンドリングもまとめて可能です。',
E'import asyncio

async def task1():
    await asyncio.sleep(1)
    return "Task 1 done"

async def task2():
    await asyncio.sleep(2)
    return "Task 2 done"

results = await asyncio.gather(task1(), task2())
print(results)  # ["Task 1 done", "Task 2 done"]',
'並行実行の管制塔',
ARRAY['return_exceptions=Trueを知らずに1つでもエラーが出ると全部止まる', 'asyncio.create_task()との使い分けを知らない人多すぎ', 'gatherの中でgatherして無駄にネストする病', '結果の順序は呼び出し順なのに完了順だと思ってる人いるよね'],
'複数タスクの並行実行',
ARRAY['複数のコルーチンを並行に実行', '全ての結果を待って一括取得', 'return_exceptions=Trueでエラーも結果として取得可能', 'asyncio.create_task()より簡潔に書ける'],
true),

('asyncio-create-task', 'asyncio.create_task()', '11111111-1111-1111-1111-111111111111', 'd0555555-5555-5555-5555-555555555555', 'function', 'intermediate',
'タスクをバックグラウンド実行',
'コルーチンをTaskオブジェクトに包み、イベントループにスケジュールします。awaitせずに並行実行させるための基本。',
E'import asyncio

async def background_task():
    await asyncio.sleep(3)
    print("Background task done")

async def main():
    task = asyncio.create_task(background_task())
    print("Doing other work...")
    await asyncio.sleep(1)
    print("Still working...")
    await task  # 完了を待つ

asyncio.run(main())',
'並行実行の起動装置',
ARRAY['taskを変数に入れずに捨てると警告が出る', 'awaitし忘れてプログラム終了時に未完了タスクが残る', 'task.cancel()の後にawaitしないとCancelledErrorがプロパゲートする', 'タスク参照を持ってないとキャンセルできない罠'],
'タスクのスケジューリング',
ARRAY['コルーチンを即座にスケジュール', 'awaitせずにバックグラウンド実行可能', '後からtask.cancel()でキャンセル可能', '参照を保持して完了を待てる'],
true),

('asyncio-sleep', 'asyncio.sleep()', '11111111-1111-1111-1111-111111111111', 'd0555555-5555-5555-5555-555555555555', 'function', 'beginner',
'非同期スリープ',
'指定秒数だけイベントループをブロックせずに待機します。time.sleep()と違い、他のタスクを実行できます。',
E'import asyncio

async def delayed_message():
    print("Starting...")
    await asyncio.sleep(2)
    print("2 seconds later!")

asyncio.run(delayed_message())',
'見えない待ち時間',
ARRAY['time.sleep()をasync関数で使うと全タスクが止まる悪夢', 'asyncio.sleep(0)がイベントループに制御を戻す魔法のテクニック', 'await sleep(1)とawait asyncio.sleep(1)を間違えてtime.sleepを呼ぶ初心者', 'ループでsleepして並行実行を台無しにする'],
'非ブロッキング待機',
ARRAY['指定秒数だけ待機', 'イベントループをブロックしない', '他のタスクは実行を継続', 'time.sleep()の非同期版'],
true),

('asyncio-wait-for', 'asyncio.wait_for()', '11111111-1111-1111-1111-111111111111', 'd0555555-5555-5555-5555-555555555555', 'function', 'intermediate',
'タイムアウト付き待機',
'コルーチンの完了を待ち、タイムアウトすればTimeoutErrorを発生させます。長時間かかる処理の保護に使います。',
E'import asyncio

async def slow_task():
    await asyncio.sleep(5)
    return "Done"

try:
    result = await asyncio.wait_for(slow_task(), timeout=2)
except asyncio.TimeoutError:
    print("Task timed out!")',
'時間制限の番人',
ARRAY['TimeoutErrorをキャッチし忘れて例外が伝播する', 'タイムアウト後もタスクは動き続けてるのに気づかない', 'キャンセルをハンドリングしないと中途半端な状態になる', 'timeout=Noneで無限待ちになることを知らない人多数'],
'タイムアウト制御',
ARRAY['タイムアウト時間を指定', '制限時間を超えるとTimeoutError', 'タイムアウト後にタスクは自動キャンセル', '外部API呼び出しの保護に便利'],
true),

('asyncio-queue', 'asyncio.Queue', '11111111-1111-1111-1111-111111111111', 'd0555555-5555-5555-5555-555555555555', 'class', 'advanced',
'非同期キュー',
'プロデューサー・コンシューマーパターンを実装するための非同期セーフなキューです。タスク間通信の基本。',
E'import asyncio

async def producer(queue):
    for i in range(5):
        await queue.put(i)
        await asyncio.sleep(0.5)

async def consumer(queue):
    while True:
        item = await queue.get()
        print(f"Got {item}")
        queue.task_done()

async def main():
    queue = asyncio.Queue()
    await asyncio.gather(
        producer(queue),
        consumer(queue)
    )

asyncio.run(main())',
'タスク間郵便局',
ARRAY['task_done()を呼び忘れてjoin()が永遠に待つ', 'maxsizeを設定しないとメモリリークの温床', 'get()をawaitせずにブロッキングget_nowait()を使って例外祭り', 'put()のawaitを忘れてキューに入らない'],
'タスク間通信',
ARRAY['非同期タスク間でデータ受け渡し', 'put()で追加、get()で取得', 'task_done()とjoin()で完了待機', 'プロデューサー・コンシューマーパターンに最適'],
true),

('asyncio-lock', 'asyncio.Lock', '11111111-1111-1111-1111-111111111111', 'd0555555-5555-5555-5555-555555555555', 'class', 'advanced',
'非同期ロック',
'複数の非同期タスクから共有リソースへのアクセスを排他制御します。threading.Lockの非同期版。',
E'import asyncio

lock = asyncio.Lock()
counter = 0

async def increment():
    global counter
    async with lock:
        temp = counter
        await asyncio.sleep(0.01)  # 処理をシミュレート
        counter = temp + 1

async def main():
    await asyncio.gather(*[increment() for _ in range(10)])
    print(f"Counter: {counter}")  # 10

asyncio.run(main())',
'排他制御の門番',
ARRAY['async withを使わずにacquire()とrelease()を手動でやって例外で解放し忘れる', 'threading.Lockと混同してデッドロックを生む', 'asyncio.Lock()は再入不可なのにネストして自爆', 'ロックの粒度が大きすぎて並行性を殺す'],
'共有リソース保護',
ARRAY['複数タスクからの同時アクセスを防ぐ', 'async withで自動取得・解放', 'threading.Lockの非同期版', '共有状態の競合を回避'],
true),

-- デコレータ（7件）
('property-decorator', '@property', '11111111-1111-1111-1111-111111111111', 'd0666666-6666-6666-6666-666666666666', 'syntax', 'intermediate',
'プロパティアクセスを定義',
'メソッドを属性のようにアクセス可能にします。getter, setter, deleterを定義してカプセル化を実現します。',
E'class Circle:
    def __init__(self, radius):
        self._radius = radius

    @property
    def radius(self):
        return self._radius

    @radius.setter
    def radius(self, value):
        if value < 0:
            raise ValueError("Radius must be positive")
        self._radius = value

    @property
    def area(self):
        return 3.14159 * self._radius ** 2

c = Circle(5)
print(c.radius)  # 5
print(c.area)    # 78.53975
c.radius = 10    # setterが呼ばれる',
'擬似属性製造機',
ARRAY['setterを定義し忘れてAttributeErrorで詰む', 'property内で重い計算をして毎回遅延が発生', 'propertyの中でさらにpropertyを呼んで循環参照', '_で始まる内部変数名を忘れて無限再帰'],
'属性アクセス制御',
ARRAY['メソッドを属性のようにアクセス', 'getter/setterでバリデーション可能', 'カプセル化の実現', '計算プロパティも定義できる'],
true),

('classmethod-decorator', '@classmethod', '11111111-1111-1111-1111-111111111111', 'd0666666-6666-6666-6666-666666666666', 'syntax', 'intermediate',
'クラスメソッド定義',
'クラス自体を第一引数に取るメソッドです。インスタンス化せずに呼び出せ、代替コンストラクタとしてよく使われます。',
E'class Date:
    def __init__(self, year, month, day):
        self.year = year
        self.month = month
        self.day = day

    @classmethod
    def from_string(cls, date_string):
        year, month, day = map(int, date_string.split("-"))
        return cls(year, month, day)

    @classmethod
    def today(cls):
        import datetime
        today = datetime.date.today()
        return cls(today.year, today.month, today.day)

d1 = Date.from_string("2024-01-15")
d2 = Date.today()',
'代替コンストラクタ工場',
ARRAY['clsとselfを混同して訳わからなくなる', 'インスタンスメソッドから呼び出してもクラス全体に影響することを忘れる', '@staticmethodとの使い分けを理解してない人多数', '継承したクラスでもclsが正しく子クラスを返すマジック'],
'クラスレベルメソッド',
ARRAY['第一引数にクラス自体を受け取る', 'インスタンス化せずに呼び出せる', '代替コンストラクタとして便利', '継承でも正しく動作'],
true),

('staticmethod-decorator', '@staticmethod', '11111111-1111-1111-1111-111111111111', 'd0666666-6666-6666-6666-666666666666', 'syntax', 'intermediate',
'静的メソッド定義',
'クラスにもインスタンスにも依存しないメソッドです。名前空間としてクラスを使いたい時に便利です。',
E'class MathUtils:
    @staticmethod
    def is_even(n):
        return n % 2 == 0

    @staticmethod
    def factorial(n):
        if n <= 1:
            return 1
        return n * MathUtils.factorial(n - 1)

print(MathUtils.is_even(4))  # True
print(MathUtils.factorial(5))  # 120

# インスタンスからも呼べる
utils = MathUtils()
print(utils.is_even(3))  # False',
'独立関数のコスプレ',
ARRAY['本当にクラスに入れる必要があるのか自問自答すべき', '@classmethodと間違えてclsを第一引数にする悲劇', 'ユーティリティ関数の乱用でクラスが肥大化', 'モジュールレベル関数でいいのでは？という疑問'],
'名前空間付き関数',
ARRAY['クラス・インスタンスに依存しない', '第一引数なし（普通の関数と同じ）', 'ユーティリティ関数として便利', 'クラスの名前空間を活用'],
true),

('functools-lru-cache', '@lru_cache', '11111111-1111-1111-1111-111111111111', 'd0666666-6666-6666-6666-666666666666', 'function', 'intermediate',
'メモ化デコレータ',
'関数の結果をキャッシュして、同じ引数での呼び出しを高速化します。再帰関数の最適化に威力を発揮します。',
E'from functools import lru_cache

@lru_cache(maxsize=128)
def fibonacci(n):
    if n < 2:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

print(fibonacci(100))  # 一瞬で計算

# キャッシュ情報確認
print(fibonacci.cache_info())

# キャッシュクリア
fibonacci.cache_clear()',
'記憶装置',
ARRAY['引数にリストや辞書を渡して「unhashable type」エラー', 'maxsizeを設定しないでメモリリークの温床に', 'キャッシュクリアを忘れてテストが汚染される', '副作用のある関数に使って予期せぬバグ'],
'自動メモ化',
ARRAY['関数の結果を自動キャッシュ', '同じ引数なら即座に結果を返す', 'フィボナッチ数列などの再帰に最適', 'maxsizeでキャッシュサイズ制限'],
true),

('functools-wraps', '@wraps', '11111111-1111-1111-1111-111111111111', 'd0666666-6666-6666-6666-666666666666', 'function', 'advanced',
'デコレータのメタデータ保持',
'デコレータ作成時に元の関数の__name__や__doc__を保持します。デコレータを書くなら必須の相棒です。',
E'from functools import wraps

def my_decorator(func):
    @wraps(func)  # これがないとfuncの情報が失われる
    def wrapper(*args, **kwargs):
        print("Before call")
        result = func(*args, **kwargs)
        print("After call")
        return result
    return wrapper

@my_decorator
def greet(name):
    """Greet someone."""
    print(f"Hello, {name}!")

print(greet.__name__)  # "greet" (@wrapsがないと"wrapper")
print(greet.__doc__)   # "Greet someone."',
'身分証明書保持係',
ARRAY['@wrapsを忘れてhelp()が役に立たなくなる', 'デコレータを学び始めた時は存在すら知らない', '__wrapped__で元の関数にアクセスできる隠し機能', 'デコレータのデコレータで@wrapsを忘れる二重の罠'],
'関数メタデータの継承',
ARRAY['元の関数の__name__, __doc__を保持', 'デコレータ作成時の必須ツール', 'help()やdebugが正しく動作', '__wrapped__で元の関数にアクセス可能'],
true),

('dataclass-decorator', '@dataclass', '11111111-1111-1111-1111-111111111111', 'd0666666-6666-6666-6666-666666666666', 'syntax', 'intermediate',
'データクラス自動生成',
'__init__, __repr__, __eq__などを自動生成します。データを保持するだけのクラスをシンプルに書けます。',
E'from dataclasses import dataclass, field

@dataclass
class User:
    name: str
    age: int
    email: str = ""
    tags: list = field(default_factory=list)

    def __post_init__(self):
        if self.age < 0:
            raise ValueError("Age must be positive")

user = User("Alice", 30)
print(user)  # User(name=''Alice'', age=30, email='''', tags=[])
print(user.name)  # Alice',
'ボイラープレート削減マシン',
ARRAY['default_factoryを知らずにlist=[]でデフォルト値を共有する悲劇', 'frozenで不変にできることを知らない', 'orderを使えばソート可能になる魔法', '__post_init__で追加バリデーション可能なのに知らない人多数'],
'データ保持クラス簡略化',
ARRAY['__init__, __repr__, __eq__を自動生成', '型アノテーションでフィールド定義', 'default_factoryでミュータブルなデフォルト値', 'frozen=Trueで不変クラスに'],
true),

('context-manager', '@contextmanager', '11111111-1111-1111-1111-111111111111', 'd0666666-6666-6666-6666-666666666666', 'function', 'advanced',
'コンテキストマネージャー生成',
'with文で使えるコンテキストマネージャーを簡単に作成します。__enter__と__exit__を書くより簡潔です。',
E'from contextlib import contextmanager

@contextmanager
def timer(name):
    import time
    start = time.time()
    print(f"{name} started")
    try:
        yield
    finally:
        end = time.time()
        print(f"{name} took {end - start:.2f}s")

with timer("Task"):
    import time
    time.sleep(1)
    print("Working...")

# 出力:
# Task started
# Working...
# Task took 1.00s',
'with文のお手軽製造機',
ARRAY['yieldの前後でセットアップとクリーンアップを書く', 'finallyを忘れると例外時にクリーンアップされない', '__enter__/__exit__を書くより100倍楽', 'yieldで値を返せることを知らない人多数'],
'簡易コンテキストマネージャー',
ARRAY['with文で使える管理オブジェクト', 'yieldの前がセットアップ、後がクリーンアップ', '__enter__/__exit__を書くより簡潔', 'リソース管理や計測に便利'],
true),

-- 標準ライブラリ応用（6件）
('itertools-chain', 'itertools.chain()', '11111111-1111-1111-1111-111111111111', 'd0777777-7777-7777-7777-777777777777', 'function', 'intermediate',
'複数のイテラブルを連結',
'複数のイテラブルを一つのイテレータとして順次処理します。リストの+演算子よりメモリ効率が良いです。',
E'from itertools import chain

list1 = [1, 2, 3]
list2 = [4, 5, 6]
list3 = [7, 8, 9]

# すべてを連結
for item in chain(list1, list2, list3):
    print(item)  # 1, 2, 3, 4, 5, 6, 7, 8, 9

# from_iterableでネストしたリストを平坦化
nested = [[1, 2], [3, 4], [5, 6]]
flat = list(chain.from_iterable(nested))
print(flat)  # [1, 2, 3, 4, 5, 6]',
'イテラブル連結器',
ARRAY['sum(lists, [])で平坦化して遅すぎて泣く', 'chain.from_iterable()の存在を知らずに手動でループ', 'ジェネレータなのでメモリ効率が良いのに使わない', 'リスト内包表記で書いて無駄にメモリ確保'],
'効率的な連結',
ARRAY['複数のイテラブルを順次処理', 'メモリ効率の良いイテレータ', 'chain.from_iterable()でネスト展開', 'リストの+演算より高速'],
true),

('itertools-combinations', 'itertools.combinations()', '11111111-1111-1111-1111-111111111111', 'd0777777-7777-7777-7777-777777777777', 'function', 'intermediate',
'順列・組み合わせ生成',
'イテラブルからr個の要素を選ぶ全組み合わせを生成します。順序は考慮せず、重複もなしです。',
E'from itertools import combinations, permutations

# 組み合わせ（順序なし、重複なし）
items = ["A", "B", "C"]
for combo in combinations(items, 2):
    print(combo)
# (''A'', ''B''), (''A'', ''C''), (''B'', ''C'')

# 順列（順序あり）
for perm in permutations(items, 2):
    print(perm)
# (''A'', ''B''), (''A'', ''C''), (''B'', ''A''), (''B'', ''C''), (''C'', ''A''), (''C'', ''B'')',
'組み合わせ爆発製造機',
ARRAY['combinationsとpermutationsの違いを理解してない', '要素数が多いと指数的に増えてメモリ不足', 'combinations_with_replacement()の存在を知らない', '自前でネストループ書いて車輪の再発明'],
'数学的組み合わせ',
ARRAY['r個の要素を選ぶ全組み合わせ', 'combinations: 順序なし', 'permutations: 順序あり', 'イテレータなので巨大な組み合わせも扱える'],
true),

('itertools-groupby', 'itertools.groupby()', '11111111-1111-1111-1111-111111111111', 'd0777777-7777-7777-7777-777777777777', 'function', 'advanced',
'連続する要素をグループ化',
'ソート済みイテラブルを連続する同じキーごとにグループ化します。SQLのGROUP BYに似ています。',
E'from itertools import groupby

# 連続する同じ値をグループ化
data = [1, 1, 2, 2, 2, 3, 1, 1]
for key, group in groupby(data):
    print(key, list(group))
# 1 [1, 1]
# 2 [2, 2, 2]
# 3 [3]
# 1 [1, 1]

# キー関数でグループ化
words = ["apple", "apricot", "banana", "blueberry", "cherry"]
words.sort()  # ソート必須！
for letter, group in groupby(words, key=lambda x: x[0]):
    print(letter, list(group))
# a [''apple'', ''apricot'']
# b [''banana'', ''blueberry'']
# c [''cherry'']',
'連続要素集約器',
ARRAY['ソートせずに使って期待通りの結果にならない罠', 'groupイテレータを使わずに捨てる初心者ミス', 'groupを複数回イテレートしようとして空になる', '連続する要素だけをグループ化することを理解してない'],
'キー別グループ化',
ARRAY['連続する同じキーをグループ化', 'key関数でグループ化条件を指定', 'ソート済みデータが前提', 'groupはイテレータなのでlist()で消費'],
true),

('functools-partial', 'functools.partial()', '11111111-1111-1111-1111-111111111111', 'd0777777-7777-7777-7777-777777777777', 'function', 'intermediate',
'部分適用関数を作成',
'関数の一部の引数を固定して新しい関数を作ります。関数型プログラミングの基本テクニックです。',
E'from functools import partial

def power(base, exponent):
    return base ** exponent

# exponent=2を固定
square = partial(power, exponent=2)
cube = partial(power, exponent=3)

print(square(5))  # 25
print(cube(5))    # 125

# map()と組み合わせる
numbers = [1, 2, 3, 4, 5]
squares = list(map(square, numbers))
print(squares)  # [1, 4, 9, 16, 25]',
'引数固定器',
ARRAY['lambdaで書けるのにわざわざpartialを使う理由を説明できない', 'キーワード引数の順序を間違えて詰む', 'クロージャとの使い分けを知らない', 'partialmethod()の存在を知らずにメソッドで苦労'],
'部分適用',
ARRAY['関数の一部の引数を固定', '新しい関数オブジェクトを生成', 'lambdaより明示的で読みやすい', 'map()やfilter()と相性が良い'],
true),

('functools-reduce', 'functools.reduce()', '11111111-1111-1111-1111-111111111111', 'd0777777-7777-7777-7777-777777777777', 'function', 'intermediate',
'イテラブルを単一の値に集約',
'二項演算を累積的に適用して、イテラブルを単一の値に縮約します。合計や積の計算に使います。',
E'from functools import reduce

# 合計（sum()の方が良いけど）
numbers = [1, 2, 3, 4, 5]
total = reduce(lambda x, y: x + y, numbers)
print(total)  # 15

# 初期値を指定
total_with_init = reduce(lambda x, y: x + y, numbers, 10)
print(total_with_init)  # 25

# 最大値を求める
maximum = reduce(lambda x, y: x if x > y else y, numbers)
print(maximum)  # 5',
'累積演算器',
ARRAY['sum()やmax()で十分なのにreduce()を使いたがる病', '初期値を設定しないで空リストで例外', '可読性が低いのに無理にreduce()で書く', '左から右への累積だけで、右から左はreduceright()がないと泣く'],
'畳み込み演算',
ARRAY['二項演算を累積的に適用', 'イテラブルを単一の値に集約', '初期値を指定可能', '合計・積・最大値などの計算に'],
true),

('contextlib-suppress', 'contextlib.suppress()', '11111111-1111-1111-1111-111111111111', 'd0777777-7777-7777-7777-777777777777', 'function', 'intermediate',
'例外を抑制',
'指定した例外を静かに無視します。try-exceptのpass節を簡潔に書けます。',
E'from contextlib import suppress
import os

# ファイル削除（存在しなくてもエラーにしない）
with suppress(FileNotFoundError):
    os.remove("temp_file.txt")

# 複数の例外を抑制
with suppress(KeyError, AttributeError):
    value = data["key"].attribute

# try-exceptで書くとこうなる
try:
    os.remove("temp_file.txt")
except FileNotFoundError:
    pass',
'例外黙殺装置',
ARRAY['本当に無視していい例外なのか考えずに使う危険性', 'デバッグ時にエラーが見えなくて困る', 'passと同じなのにわざわざimportする必要あるか論争', '複数の例外型を指定できることを知らない'],
'簡潔な例外処理',
ARRAY['指定した例外を静かに無視', 'try-except-passより簡潔', '複数の例外型を同時に指定可能', 'クリーンアップ不要な場合に便利'],
true);

-- ============================================
-- Part 3: JavaScript新カテゴリ追加
-- ============================================
INSERT INTO categories (id, language_id, slug, name, sort_order) VALUES
  ('e0555555-5555-5555-5555-555555555555', '22222222-2222-2222-2222-222222222222', 'es2020-plus', 'ES2020以降', 10),
  ('e0666666-6666-6666-6666-666666666666', '22222222-2222-2222-2222-222222222222', 'web-api', 'Web API', 11),
  ('e0777777-7777-7777-7777-777777777777', '22222222-2222-2222-2222-222222222222', 'modules', 'モジュール', 12);

-- ============================================
-- Part 4: JavaScript追加エントリ（25件）
-- ============================================
INSERT INTO entries (slug, name, language_id, category_id, entry_type, difficulty, short_desc, full_desc, code_example, sarcastic_title, sarcastic_notes, angel_title, angel_notes, is_published) VALUES

-- ES2020以降（10件）
('promise-allsettled', 'Promise.allSettled()', '22222222-2222-2222-2222-222222222222', 'e0555555-5555-5555-5555-555555555555', 'function', 'intermediate',
'全てのPromiseの結果を待つ',
'すべてのPromiseが完了するまで待ち、成功・失敗問わず全結果を返します。Promise.all()と違い、一つでも失敗しても止まりません。',
E'const promises = [
  fetch("/api/user"),
  fetch("/api/posts"),
  fetch("/api/invalid")  // これが失敗しても他の結果が得られる
];

const results = await Promise.allSettled(promises);
results.forEach((result, i) => {
  if (result.status === "fulfilled") {
    console.log(`Promise ${i}: success`, result.value);
  } else {
    console.log(`Promise ${i}: failed`, result.reason);
  }
});',
'全員完走待機所',
ARRAY['Promise.all()で一つ失敗したら全部台無しになって泣いた経験', 'statusを確認せずにvalueにアクセスして undefined', 'Promise.any()やPromise.race()との使い分けができない', 'fulfilledとrejectedのタイポで詰む'],
'全Promise結果取得',
ARRAY['全てのPromiseが完了するまで待機', '成功・失敗問わず全結果を返す', 'status, value, reasonで結果を判定', '一部が失敗しても他の結果を取得可能'],
true),

('promise-any', 'Promise.any()', '22222222-2222-2222-2222-222222222222', 'e0555555-5555-5555-5555-555555555555', 'function', 'intermediate',
'最初に成功したPromiseを返す',
'最初に成功したPromiseの結果を返します。すべてが失敗した場合のみAggregateErrorをスローします。',
E'// 複数のCDNから最速のものを使う
const urls = [
  "https://cdn1.example.com/data.json",
  "https://cdn2.example.com/data.json",
  "https://cdn3.example.com/data.json"
];

try {
  const data = await Promise.any(urls.map(url => fetch(url)));
  console.log("Fastest CDN responded:", data);
} catch (error) {
  console.error("All CDNs failed:", error.errors);
}',
'最速ゲットマシン',
ARRAY['Promise.race()と混同して挙動の違いに困惑', 'AggregateErrorの存在を知らずにcatchできない', '全部失敗した時のエラーハンドリングを忘れる', 'errors配列にアクセスする方法を知らない'],
'最速Promise取得',
ARRAY['最初に成功したPromiseを返す', 'フォールバック戦略に最適', '全て失敗でAggregateError', 'CDNフォールバック等で有用'],
true),

('nullish-coalescing-assignment', '??=演算子', '22222222-2222-2222-2222-222222222222', 'e0555555-5555-5555-5555-555555555555', 'operator', 'beginner',
'nullish代入演算子',
'変数がnullまたはundefinedの場合のみ値を代入します。0や空文字列はそのまま保持されます。',
E'let config = {
  timeout: 0,
  message: ''''
};

// 0や空文字はnull/undefinedではないので代入されない
config.timeout ??= 3000;
config.message ??= "Default";

console.log(config.timeout);  // 0（代入されない）
console.log(config.message);  // ''''（代入されない）

// null/undefinedなら代入される
let value = null;
value ??= "fallback";
console.log(value);  // "fallback"',
'null専門代入係',
ARRAY['||=との違いを理解してなくて0が上書きされて泣く', '??演算子は知ってるのに??=を知らない', 'falsyとnullishの違いを説明できない', '短絡評価を理解せずに毎回代入してると思ってる'],
'安全なデフォルト値代入',
ARRAY['null/undefinedの時だけ代入', '0や空文字はそのまま', '短絡評価で効率的', 'デフォルト値設定に便利'],
true),

('logical-and-assignment', '&&=演算子', '22222222-2222-2222-2222-222222222222', 'e0555555-5555-5555-5555-555555555555', 'operator', 'beginner',
'論理AND代入演算子',
'変数がtruthyの場合のみ値を代入します。条件付き更新を簡潔に書けます。',
E'let user = {
  name: "Alice",
  role: "admin"
};

// roleが存在する場合のみ更新
user.role &&= "superadmin";
console.log(user.role);  // "superadmin"

// 存在しない場合は何もしない
user.permissions &&= ["read", "write"];
console.log(user.permissions);  // undefined（代入されない）

// 従来の書き方
if (user.role) {
  user.role = "superadmin";
}',
'条件付き更新装置',
ARRAY['||=や??=と混同して逆の挙動で困る', '短絡評価を理解してないと使い所が分からない', 'truthyとfalsyの境界を理解してない', 'この演算子の存在を知らずにif文で書く'],
'truthy時のみ代入',
ARRAY['truthyの場合のみ代入', '条件付き更新を簡潔に', '短絡評価で効率的', 'if文より読みやすい場合も'],
true),

('logical-or-assignment', '||=演算子', '22222222-2222-2222-2222-222222222222', 'e0555555-5555-5555-5555-555555555555', 'operator', 'beginner',
'論理OR代入演算子',
'変数がfalsyの場合のみ値を代入します。デフォルト値の設定に使います。',
E'let config = {};

// falsyなら代入
config.timeout ||= 3000;
config.retries ||= 3;

console.log(config.timeout);  // 3000
console.log(config.retries);  // 3

// 既に値がある場合は何もしない
config.timeout ||= 5000;
console.log(config.timeout);  // 3000（変わらない）

// 0はfalsyなので注意
let count = 0;
count ||= 10;
console.log(count);  // 10（0が上書きされた！）',
'falsy撲滅係',
ARRAY['0を有効な値として扱いたい時にバグる悪名高い罠', '??=との使い分けができない人多すぎ', 'config = config || {}と同じと気づかない', '空文字列もfalsyなので注意が必要'],
'falsy時のデフォルト値',
ARRAY['falsyの場合のみ代入', 'デフォルト値の設定に便利', '短絡評価で効率的', '0や空文字もfalsyなので注意'],
true),

('array-at', 'Array.at()', '22222222-2222-2222-2222-222222222222', 'e0555555-5555-5555-5555-555555555555', 'function', 'beginner',
'インデックスアクセス（負数対応）',
'配列の要素に負のインデックスでアクセスできます。末尾から数えるときに便利です。',
E'const arr = [10, 20, 30, 40, 50];

// 正のインデックス
console.log(arr.at(0));   // 10
console.log(arr.at(2));   // 30

// 負のインデックス（末尾から）
console.log(arr.at(-1));  // 50
console.log(arr.at(-2));  // 40

// 従来の書き方
console.log(arr[arr.length - 1]);  // 50（冗長）',
'末尾アクセスの救世主',
ARRAY['arr[arr.length - 1]を何回書いたことか', 'at()がないブラウザでポリフィル忘れて詰む', 'String.prototype.at()も同じように使えることを知らない', '負のインデックスが使えることを知らずに長い式を書く'],
'柔軟なインデックスアクセス',
ARRAY['負のインデックスで末尾からアクセス', 'at(-1)で最後の要素', 'arr[arr.length-1]より簡潔', '文字列でも使える'],
true),

('object-hasown', 'Object.hasOwn()', '22222222-2222-2222-2222-222222222222', 'e0555555-5555-5555-5555-555555555555', 'function', 'beginner',
'プロパティの所有確認',
'オブジェクトが指定したプロパティを直接所有しているか確認します。hasOwnProperty()より安全です。',
E'const obj = {
  name: "Alice",
  age: 30
};

console.log(Object.hasOwn(obj, "name"));  // true
console.log(Object.hasOwn(obj, "toString"));  // false（継承）

// hasOwnProperty()の問題
const obj2 = Object.create(null);
// obj2.hasOwnProperty("name");  // TypeError: hasOwnProperty is not a function
Object.hasOwn(obj2, "name");  // OK: false

// プロトタイプ汚染対策
const obj3 = { hasOwnProperty: "hacked!" };
// obj3.hasOwnProperty("name");  // エラー
Object.hasOwn(obj3, "name");  // OK: false',
'安全な所有権確認',
ARRAY['hasOwnProperty()のthis問題を理解してない', 'Object.create(null)で詰む経験ないと価値がわからない', 'inとの違いを説明できない', 'プロトタイプ汚染を知らないと必要性が分からない'],
'プロパティ所有確認',
ARRAY['オブジェクトが直接プロパティを所有しているか確認', 'hasOwnProperty()より安全', 'Object.create(null)でも動作', 'プロトタイプ汚染対策'],
true),

('structured-clone', 'structuredClone()', '22222222-2222-2222-2222-222222222222', 'e0555555-5555-5555-5555-555555555555', 'function', 'intermediate',
'ディープコピー',
'オブジェクトを完全にコピーします。ネストしたオブジェクトも再帰的にコピーされます。',
E'const original = {
  name: "Alice",
  nested: {
    age: 30,
    tags: ["dev", "js"]
  },
  date: new Date()
};

const copy = structuredClone(original);

// 完全な独立したコピー
copy.nested.age = 40;
console.log(original.nested.age);  // 30（影響なし）

// Dateもコピーされる
copy.date.setFullYear(2025);
console.log(original.date.getFullYear());  // 2024（影響なし）

// 循環参照もOK
const obj = {};
obj.self = obj;
const cloned = structuredClone(obj);  // エラーにならない',
'完全複製装置',
ARRAY['JSON.parse(JSON.stringify())で失われる型を知らずに困る', 'Date, Map, Setもコピーできることを知らない', '関数はコピーできないので注意', 'シンボルもコピーされないことを忘れる'],
'完全なコピー',
ARRAY['ネストしたオブジェクトも完全コピー', 'Date, Map, Setも正しくコピー', '循環参照に対応', '関数とシンボルはコピー不可'],
true),

('abort-controller', 'AbortController', '22222222-2222-2222-2222-222222222222', 'e0555555-5555-5555-5555-555555555555', 'class', 'intermediate',
'非同期処理のキャンセル',
'fetch()などの非同期処理をキャンセルするための標準的な方法です。タイムアウトやユーザー操作でのキャンセルに使います。',
E'const controller = new AbortController();
const signal = controller.signal;

// 5秒後にキャンセル
setTimeout(() => controller.abort(), 5000);

try {
  const response = await fetch("/api/data", { signal });
  const data = await response.json();
  console.log(data);
} catch (error) {
  if (error.name === "AbortError") {
    console.log("Fetch was cancelled");
  } else {
    throw error;
  }
}

// イベントリスナーで使う
signal.addEventListener("abort", () => {
  console.log("Aborted!");
});',
'中止指令発行機',
ARRAY['signalを渡し忘れて cancel できない', 'AbortErrorをキャッチし忘れて例外が伝播', '同じcontrollerを複数回使い回して混乱', 'addEventListener("abort")の存在を知らない'],
'処理のキャンセル制御',
ARRAY['非同期処理をキャンセル可能に', 'signal をfetch等に渡す', 'abort()でキャンセル', 'タイムアウトやユーザー操作に対応'],
true),

('regex-match-indices', '正規表現マッチ位置', '22222222-2222-2222-2222-222222222222', 'e0555555-5555-5555-5555-555555555555', 'syntax', 'advanced',
'マッチ位置の取得',
'd フラグを使うと、正規表現のマッチ位置（インデックス）を取得できます。構文解析やハイライトに便利です。',
E'const text = "The year is 2024";
const regex = /\\d+/d;  // d フラグで位置情報を取得

const match = regex.exec(text);
console.log(match[0]);  // "2024"
console.log(match.indices[0]);  // [12, 16]（開始位置と終了位置）

// グループのマッチ位置
const regex2 = /(\\d{4})-(\\d{2})-(\\d{2})/d;
const date = "Date: 2024-01-15";
const match2 = regex2.exec(date);
console.log(match2.indices[1]);  // [6, 10]（年の位置）
console.log(match2.indices[2]);  // [11, 13]（月の位置）',
'マッチ位置記録係',
ARRAY['d フラグの存在を知らずにindexOfで頑張る', 'indicesプロパティにアクセスしようとして undefined', 'グループのインデックスがずれて混乱', '文字列のハイライトに使えることを知らない'],
'マッチ位置情報',
ARRAY['d フラグで位置情報を取得', 'match.indicesで開始・終了位置', 'グループごとの位置も取得可能', '構文ハイライトに便利'],
true),

-- Web API（8件）
('intl-dateformat', 'Intl.DateTimeFormat', '22222222-2222-2222-2222-222222222222', 'e0666666-6666-6666-6666-666666666666', 'class', 'intermediate',
'国際化対応の日付フォーマット',
'ロケールに応じた日付・時刻のフォーマットを提供します。タイムゾーン対応も簡単です。',
E'const date = new Date("2024-01-15T10:30:00");

// 日本語
const jaFormat = new Intl.DateTimeFormat("ja-JP", {
  year: "numeric",
  month: "long",
  day: "numeric"
});
console.log(jaFormat.format(date));  // "2024年1月15日"

// 英語（米国）
const enFormat = new Intl.DateTimeFormat("en-US", {
  weekday: "long",
  year: "numeric",
  month: "long",
  day: "numeric"
});
console.log(enFormat.format(date));  // "Monday, January 15, 2024"

// タイムゾーン指定
const tzFormat = new Intl.DateTimeFormat("ja-JP", {
  timeZone: "America/New_York",
  hour: "2-digit",
  minute: "2-digit"
});',
'世界対応日付変換器',
ARRAY['moment.jsやdate-fnsに頼らずブラウザ標準でできることを知らない', 'タイムゾーンの扱いが難しくて泣く', 'ロケール文字列のフォーマットを覚えられない', 'formatToPartsで細かく制御できることを知らない'],
'ロケール対応日付',
ARRAY['ロケールに応じた日付フォーマット', 'タイムゾーン変換対応', '外部ライブラリ不要', 'formatToPartsで詳細制御'],
true),

('intl-numberformat', 'Intl.NumberFormat', '22222222-2222-2222-2222-222222222222', 'e0666666-6666-6666-6666-666666666666', 'class', 'intermediate',
'国際化対応の数値フォーマット',
'ロケールに応じた数値・通貨・パーセントのフォーマットを提供します。',
E'const number = 1234567.89;

// 日本語（カンマ区切り）
const jaFormat = new Intl.NumberFormat("ja-JP");
console.log(jaFormat.format(number));  // "1,234,567.89"

// 通貨
const currency = new Intl.NumberFormat("ja-JP", {
  style: "currency",
  currency: "JPY"
});
console.log(currency.format(number));  // "¥1,234,568"

// パーセント
const percent = new Intl.NumberFormat("en-US", {
  style: "percent",
  minimumFractionDigits: 2
});
console.log(percent.format(0.1234));  // "12.34%"',
'世界対応数値変換器',
ARRAY['toLocaleString()で十分なのに無理にNumberFormatを使う', '通貨記号の位置がロケールで変わることを知らない', 'minimumFractionDigitsとmaximumFractionDigitsの違いが分からない', 'notation: "compact"で短縮表記できることを知らない'],
'ロケール対応数値',
ARRAY['ロケールに応じた数値フォーマット', '通貨・パーセント表示対応', 'カンマ区切りや小数点処理', 'notation: "compact"で1.2Kなど短縮表記'],
true),

('resize-observer', 'ResizeObserver', '22222222-2222-2222-2222-222222222222', 'e0666666-6666-6666-6666-666666666666', 'class', 'intermediate',
'要素のサイズ変化を監視',
'DOM要素のサイズ変化を検出します。レスポンシブなコンポーネント作成に便利です。',
E'const observer = new ResizeObserver(entries => {
  for (let entry of entries) {
    const { width, height } = entry.contentRect;
    console.log(`Size changed: ${width}x${height}`);

    // サイズに応じて処理を変える
    if (width < 600) {
      entry.target.classList.add("mobile");
    } else {
      entry.target.classList.remove("mobile");
    }
  }
});

const element = document.querySelector(".container");
observer.observe(element);

// 監視停止
// observer.unobserve(element);
// observer.disconnect();',
'サイズ変化監視係',
ARRAY['IntersectionObserverと混同する', 'disconnectし忘れてメモリリーク', 'windowのresizeイベントで無理やり実装してパフォーマンス最悪', '無限ループを引き起こす罠にハマる'],
'要素サイズ監視',
ARRAY['要素のサイズ変化を検出', 'レスポンシブUIの実装に便利', 'コンテナクエリの補完として', 'unobserve()で監視停止'],
true),

('intersection-observer', 'IntersectionObserver', '22222222-2222-2222-2222-222222222222', 'e0666666-6666-6666-6666-666666666666', 'class', 'intermediate',
'要素の表示領域を監視',
'要素がビューポートに入ったか検出します。遅延ローディングや無限スクロールに使います。',
E'const observer = new IntersectionObserver(entries => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      // 要素が画面に入った
      const img = entry.target;
      img.src = img.dataset.src;  // 遅延ロード
      observer.unobserve(img);
    }
  });
}, {
  root: null,  // ビューポート
  rootMargin: "50px",  // 50px手前で検出
  threshold: 0.5  // 50%見えたら検出
});

document.querySelectorAll("img[data-src]").forEach(img => {
  observer.observe(img);
});',
'視界侵入検知器',
ARRAY['scrollイベントで無理やり実装してパフォーマンス地獄', 'thresholdの意味を理解してない', 'rootMarginの指定方法を間違える', '無限スクロールで次ページを取得し忘れる'],
'表示領域検出',
ARRAY['要素がビューポートに入ったか検出', '遅延ローディングの実装に最適', '無限スクロールの基礎', 'threshold, rootMarginで調整'],
true),

('mutation-observer', 'MutationObserver', '22222222-2222-2222-2222-222222222222', 'e0666666-6666-6666-6666-666666666666', 'class', 'advanced',
'DOM変更を監視',
'DOM要素の変更（追加・削除・属性変更）を検出します。動的なページの変化を追跡できます。',
E'const observer = new MutationObserver(mutations => {
  mutations.forEach(mutation => {
    if (mutation.type === "childList") {
      console.log("Children changed:", mutation.addedNodes, mutation.removedNodes);
    } else if (mutation.type === "attributes") {
      console.log("Attribute changed:", mutation.attributeName);
    }
  });
});

observer.observe(document.body, {
  childList: true,  // 子要素の追加・削除
  attributes: true,  // 属性の変更
  subtree: true  // 子孫要素も監視
});

// 監視停止
// observer.disconnect();',
'DOM変化監視装置',
ARRAY['subtree: trueを設定しないで子孫の変化を見逃す', 'disconnectし忘れてメモリリーク', '自分が引き起こした変更を検出して無限ループ', 'characterDataを監視し忘れてテキスト変更を見逃す'],
'DOM変更検出',
ARRAY['DOM要素の追加・削除・変更を検出', 'childList, attributes, characterDataを監視', 'subtreeで子孫も監視可能', 'disconnect()で停止必須'],
true),

('broadcast-channel', 'BroadcastChannel', '22222222-2222-2222-2222-222222222222', 'e0666666-6666-6666-6666-666666666666', 'class', 'intermediate',
'タブ間通信',
'同じオリジンの異なるタブ・ウィンドウ・iframeと通信します。マルチタブアプリの状態同期に使います。',
E'// 送信側
const channel = new BroadcastChannel("app_channel");
channel.postMessage({ type: "logout", userId: 123 });

// 受信側（別のタブ）
const channel2 = new BroadcastChannel("app_channel");
channel2.onmessage = (event) => {
  if (event.data.type === "logout") {
    console.log("User logged out in another tab");
    // ログアウト処理
  }
};

// 閉じる
channel.close();',
'タブ間通信局',
ARRAY['localStorageイベントで無理やり実装してた過去', 'チャンネル名の typo でメッセージが届かない', 'close()し忘れてリソースリーク', '同一オリジンでしか使えないことを忘れる'],
'タブ間メッセージング',
ARRAY['同じオリジンのタブ間で通信', 'postMessage()で送信', 'onmessageで受信', 'マルチタブアプリの状態同期に便利'],
true),

('performance-observer', 'PerformanceObserver', '22222222-2222-2222-2222-222222222222', 'e0666666-6666-6666-6666-666666666666', 'class', 'advanced',
'パフォーマンス計測',
'パフォーマンスメトリクスを監視します。ページロード時間やリソース読み込みを計測できます。',
E'const observer = new PerformanceObserver(list => {
  list.getEntries().forEach(entry => {
    console.log(entry.name, entry.duration);
  });
});

// ナビゲーションタイミング
observer.observe({ entryTypes: ["navigation"] });

// リソース読み込み
observer.observe({ entryTypes: ["resource"] });

// カスタム計測
performance.mark("start");
// 何か重い処理
performance.mark("end");
performance.measure("myTask", "start", "end");

observer.observe({ entryTypes: ["measure"] });',
'パフォーマンス監視官',
ARRAY['console.time()で十分だと思ってる', 'entryTypesのスペルミスで何も取れない', 'disconnectし忘れてメモリリーク', 'Web Vitalsの計測に使えることを知らない'],
'パフォーマンス監視',
ARRAY['パフォーマンスメトリクスを監視', 'navigation, resource, measureなど', 'Web Vitalsの計測に使える', 'performance.mark()でカスタム計測'],
true),

('web-workers', 'Web Workers', '22222222-2222-2222-2222-222222222222', 'e0666666-6666-6666-6666-666666666666', 'class', 'advanced',
'バックグラウンド処理',
'メインスレッドをブロックせずに重い処理を実行します。マルチスレッドプログラミングの基礎です。',
E'// worker.js
self.onmessage = (e) => {
  const result = heavyCalculation(e.data);
  self.postMessage(result);
};

// main.js
const worker = new Worker("worker.js");

worker.postMessage({ data: [1, 2, 3] });

worker.onmessage = (e) => {
  console.log("Result:", e.data);
};

worker.onerror = (error) => {
  console.error("Worker error:", error);
};

// 終了
worker.terminate();',
'別スレッド作業員',
ARRAY['DOMにアクセスしようとしてエラー', 'SharedArrayBufferの罠', 'terminate()し忘れてリソースリーク', 'Transferableオブジェクトで高速化できることを知らない'],
'マルチスレッド処理',
ARRAY['メインスレッドをブロックしない', '重い計算をバックグラウンドで', 'postMessage()で通信', 'DOMアクセス不可'],
true),

-- モジュール（7件）
('dynamic-import', 'import()', '22222222-2222-2222-2222-222222222222', 'e0777777-7777-7777-7777-777777777777', 'syntax', 'intermediate',
'動的インポート',
'実行時に必要なモジュールを非同期で読み込みます。コード分割やレイジーローディングの基本です。',
E'// 条件付きインポート
if (condition) {
  const module = await import("./heavy-module.js");
  module.doSomething();
}

// イベントハンドラで遅延ロード
button.addEventListener("click", async () => {
  const { showModal } = await import("./modal.js");
  showModal();
});

// Reactでのコンポーネント遅延ロード
const LazyComponent = lazy(() => import("./Component"));',
'遅延読み込み職人',
ARRAY['awaitを忘れてPromiseを直接使おうとする', 'トップレベルawaitが使えない環境で詰む', 'Webpackのchunk名を指定する方法を知らない', 'エラーハンドリングを忘れてモジュールが読めない'],
'非同期モジュール読み込み',
ARRAY['実行時にモジュールを読み込み', 'Promiseを返す', 'コード分割に必須', '条件付きインポートが可能'],
true),

('import-meta', 'import.meta', '22222222-2222-2222-2222-222222222222', 'e0777777-7777-7777-7777-777777777777', 'syntax', 'intermediate',
'モジュールメタデータ',
'現在のモジュールに関するメタ情報を提供します。URLや環境変数にアクセスできます。',
E'// 現在のモジュールのURL
console.log(import.meta.url);
// "file:///path/to/module.js"

// 相対パスで画像を読み込む
const imageUrl = new URL("./image.png", import.meta.url);
fetch(imageUrl);

// Viteでの環境変数（Vite固有）
console.log(import.meta.env.VITE_API_URL);
console.log(import.meta.env.MODE);  // "development" or "production"

// モジュールの場所からの相対パスを解決
const dataPath = new URL("../data/file.json", import.meta.url);',
'モジュール情報係',
ARRAY['import.meta.urlがファイルパスじゃなくてURLなことに気づかない', '__filename, __dirnameの代わりに使えることを知らない', 'バンドラーによって挙動が違うことを理解してない', 'import.meta.envの存在を知らずにprocess.envを使おうとする'],
'モジュール情報アクセス',
ARRAY['現在のモジュールのURLを取得', '相対パスの解決に便利', 'Viteなどで環境変数にアクセス', 'バンドラーによって拡張あり'],
true),

('top-level-await', 'トップレベルawait', '22222222-2222-2222-2222-222222222222', 'e0777777-7777-7777-7777-777777777777', 'syntax', 'intermediate',
'モジュールトップレベルでawait',
'async関数の外でawaitを使えます。モジュール初期化時に非同期処理が可能になります。',
E'// 設定を読み込んでからエクスポート
const response = await fetch("/api/config");
const config = await response.json();
export { config };

// 条件付きインポート
const locale = await detectLocale();
const messages = await import(`./locales/${locale}.js`);
export { messages };

// 他のモジュールは待機
import { config } from "./config.js";  // configの読み込みを待つ
console.log(config);',
'最上位待機係',
ARRAY['古いブラウザで使えなくて詰む', 'モジュール全体の読み込みが遅くなることを理解してない', 'CJS（CommonJS）では使えないことを忘れる', 'awaitの順序で初期化順序が変わることに気づかない'],
'モジュール初期化時の非同期',
ARRAY['async関数なしでawaitを使える', 'モジュール初期化時に非同期処理', '他のモジュールは自動的に待機', 'ESモジュール限定'],
true),

('export-default-as', 'export { default }', '22222222-2222-2222-2222-222222222222', 'e0777777-7777-7777-7777-777777777777', 'syntax', 'beginner',
'デフォルトエクスポートの再エクスポート',
'他のモジュールのdefault exportを再エクスポートします。バレルファイルの作成に便利です。',
E'// utils/index.js（バレルファイル）
export { default as formatDate } from "./formatDate.js";
export { default as parseJSON } from "./parseJSON.js";
export * from "./helpers.js";

// 使う側
import { formatDate, parseJSON } from "./utils";

// formatDate.jsの中身
export default function formatDate(date) {
  return date.toISOString();
}',
'再エクスポート管理者',
ARRAY['export { default } from "./module"の構文を知らない', 'バレルファイルがツリーシェイキングを阻害することを理解してない', 'export * as name from "./module"の存在を知らない', '再エクスポートのパフォーマンス影響を考えない'],
'デフォルトの再エクスポート',
ARRAY['default exportを再エクスポート', 'バレルファイルの作成に便利', 'export * from "./module"と併用', 'インポートをまとめて管理'],
true),

('import-assertions', 'Import Assertions', '22222222-2222-2222-2222-222222222222', 'e0777777-7777-7777-7777-777777777777', 'syntax', 'advanced',
'インポートアサーション',
'インポート時にモジュールの種類を明示します。JSONやCSSのインポートで使います。',
E'// JSONをインポート
import data from "./data.json" assert { type: "json" };
console.log(data.users);

// CSSモジュール（実験的）
import styles from "./styles.css" assert { type: "css" };
document.adoptedStyleSheets = [styles];

// 動的インポート
const config = await import("./config.json", {
  assert: { type: "json" }
});',
'型明示輸入係',
ARRAY['JSON.parse(fs.readFileSync())から解放される日は来るのか', 'ブラウザサポートが不安定で本番で使えない', 'assertからwithへの移行を知らない', 'バンドラーが勝手に解決してくれることに慣れすぎ'],
'モジュール種類の指定',
ARRAY['インポート時に種類を明示', 'JSONやCSSをインポート可能', '実験的機能（サポート状況注意）', 'セキュリティのための型チェック'],
true),

('module-namespace', 'import * as', '22222222-2222-2222-2222-222222222222', 'e0777777-7777-7777-7777-777777777777', 'syntax', 'beginner',
'名前空間インポート',
'モジュールの全エクスポートを一つのオブジェクトにまとめます。名前衝突を避けるのに便利です。',
E'// すべてをまとめてインポート
import * as utils from "./utils.js";

console.log(utils.formatDate(new Date()));
console.log(utils.parseJSON(jsonString));

// 名前空間で整理
import * as api from "./api.js";
import * as db from "./db.js";

await api.fetchUsers();
await db.saveUser(user);

// 再エクスポート
export * as helpers from "./helpers.js";',
'全部まとめて輸入係',
ARRAY['使わない関数まで全部インポートしてバンドルサイズ増大', 'ツリーシェイキングが効きにくくなる', '名前空間が深くなりすぎて逆に読みにくい', 'default exportは含まれないことを忘れる'],
'名前空間でまとめる',
ARRAY['全エクスポートを一つのオブジェクトに', '名前衝突を回避', 'モジュールを整理して使いやすく', 'default exportは別途インポート必要'],
true),

('side-effect-import', '副作用インポート', '22222222-2222-2222-2222-222222222222', 'e0777777-7777-7777-7777-777777777777', 'syntax', 'beginner',
'副作用のみのインポート',
'値をインポートせず、モジュールの副作用（初期化処理）だけを実行します。',
E'// グローバルなポリフィルやセットアップ
import "./polyfills.js";
import "./setup.js";

// スタイルシート
import "./styles.css";

// 副作用だけを実行
import "./register-service-worker.js";

// polyfills.jsの中身
if (!Array.prototype.at) {
  Array.prototype.at = function(index) {
    // ポリフィル実装
  };
}',
'初期化専門輸入係',
ARRAY['package.jsonのsideEffectsフィールドを知らずにツリーシェイキングで消される', '副作用の実行順序がインポート順序に依存することを忘れる', 'CSSインポートがバンドラーによって挙動が違う', '本当に必要な副作用なのか疑わない'],
'副作用のみ実行',
ARRAY['値をインポートせず副作用だけ実行', 'ポリフィルやセットアップに便利', 'CSSやグローバル初期化', 'package.jsonでsideEffects指定必要'],
true);

-- ============================================
-- Part 5: Bash新カテゴリ追加
-- ============================================
INSERT INTO categories (id, language_id, slug, name, sort_order) VALUES
  ('ba555555-5555-5555-5555-555555555555', '33333333-3333-3333-3333-333333333333', 'scripting', 'スクリプト実践', 10),
  ('ba666666-6666-6666-6666-666666666666', '33333333-3333-3333-3333-333333333333', 'env-process', '環境変数とプロセス', 11);

-- ============================================
-- Part 6: Bash追加エントリ（15件）
-- ============================================
INSERT INTO entries (slug, name, language_id, category_id, entry_type, difficulty, short_desc, full_desc, code_example, sarcastic_title, sarcastic_notes, angel_title, angel_notes, is_published) VALUES

-- スクリプト実践（10件）
('set-e', 'set -e', '33333333-3333-3333-3333-333333333333', 'ba555555-5555-5555-5555-555555555555', 'syntax', 'beginner',
'エラーで即座に終了',
'コマンドが失敗したらスクリプトを即座に終了します。本番スクリプトには必須の安全装置です。',
E'#!/bin/bash
set -e  # エラーで即座に終了

# どれか1つでも失敗したら以降は実行されない
npm install
npm run build
npm test
echo "All succeeded!"  # 全て成功した場合のみ実行',
'即断即決マン',
ARRAY['set -eを知らずにエラーを無視して進むスクリプトで本番事故', 'パイプの途中のエラーは無視されることを知らない（set -o pipefailが必要）', '|| trueで特定のコマンドだけエラーを無視する技を知らない', 'set +eで一時的に無効化できることを知らない'],
'エラー時即終了',
ARRAY['コマンド失敗で即座にスクリプト終了', '本番スクリプトの安全装置', 'エラーの連鎖を防ぐ', '|| trueでエラーを無視可能'],
true),

('set-u', 'set -u', '33333333-3333-3333-3333-333333333333', 'ba555555-5555-5555-5555-555555555555', 'syntax', 'beginner',
'未定義変数でエラー',
'未定義の変数を参照したらエラーにします。タイポによるバグを防ぎます。',
E'#!/bin/bash
set -u  # 未定義変数でエラー

NAME="Alice"
echo "Hello, $NAME"  # OK

# echo "Hello, $NAEM"  # エラー: NAEM: unbound variable

# デフォルト値で回避
echo "Hello, ${UNDEFINED_VAR:-Guest}"  # OK: "Hello, Guest"',
'タイポ警察',
ARRAY['set -uなしで$PATHのタイポで環境を破壊した悪夢', '${VAR:-default}構文を知らずに詰む', '$*や$@が空の時にエラーになる罠', 'set +uで一時的に無効化する必要がある場面'],
'未定義変数検出',
ARRAY['未定義変数参照でエラー', 'タイポによるバグを防ぐ', '${VAR:-default}でデフォルト値', 'set +uで一時無効化'],
true),

('set-o-pipefail', 'set -o pipefail', '33333333-3333-3333-3333-333333333333', 'ba555555-5555-5555-5555-555555555555', 'syntax', 'intermediate',
'パイプ全体の失敗を検出',
'パイプラインの途中でエラーが起きた場合、全体を失敗とみなします。',
E'#!/bin/bash
set -e
set -o pipefail  # パイプ中のエラーも検出

# grepが何もマッチしなくてもset -eだけでは検出されない
# pipefailがあれば全体が失敗扱い
cat file.txt | grep "pattern" | wc -l

# エラー例
# false | true  # pipefailなし: 成功（最後のtrueの結果）
# false | true  # pipefailあり: 失敗（falseの結果を検出）',
'パイプ監視官',
ARRAY['set -eだけではパイプの途中のエラーを検出できないことを知らない', 'grepが何もマッチしない時の終了コード1を忘れる', 'set -euo pipefailを3点セットで覚えるべき', 'ERR trapと組み合わせないと詳細が分からない'],
'パイプエラー検出',
ARRAY['パイプライン途中のエラーも検出', 'set -eと組み合わせて使う', 'set -euo pipefailが推奨', 'パイプの信頼性向上'],
true),

('trap-signals', 'trap（シグナル）', '33333333-3333-3333-3333-333333333333', 'ba555555-5555-5555-5555-555555555555', 'function', 'intermediate',
'シグナルやイベントをハンドリング',
'スクリプト終了時やシグナル受信時にクリーンアップ処理を実行します。',
E'#!/bin/bash

# 一時ファイル作成
TMPFILE=$(mktemp)

# 終了時に必ずクリーンアップ
trap "rm -f $TMPFILE" EXIT

# Ctrl+C (SIGINT) をハンドリング
trap "echo ''Interrupted!''; exit 1" INT

# エラー発生時
trap ''echo "Error on line $LINENO"'' ERR

# 通常処理
echo "Working with $TMPFILE"
# ...処理...

# EXIT trapが自動で実行される',
'終了処理番人',
ARRAY['trapなしで一時ファイルを放置してディスク圧迫', 'EXIT, INT, TERMの違いを理解してない', 'ERR trapはset -Eがないと関数内で発火しない罠', 'trap "cmd" SIGNALの順序を間違える'],
'クリーンアップ処理',
ARRAY['終了時・シグナル受信時に処理実行', '一時ファイルのクリーンアップに必須', 'EXIT, INT, TERM, ERRなど', '$LINENOでエラー行番号取得'],
true),

('getopts', 'getopts', '33333333-3333-3333-3333-333333333333', 'ba555555-5555-5555-5555-555555555555', 'function', 'intermediate',
'コマンドラインオプション解析',
'スクリプトのコマンドラインオプションを簡単に解析します。',
E'#!/bin/bash

while getopts "f:v" opt; do
  case $opt in
    f)
      FILE=$OPTARG
      echo "File: $FILE"
      ;;
    v)
      VERBOSE=true
      echo "Verbose mode enabled"
      ;;
    \\?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument" >&2
      exit 1
      ;;
  esac
done

# 残りの引数
shift $((OPTIND - 1))
echo "Remaining args: $@"

# 使い方: ./script.sh -f file.txt -v arg1 arg2',
'オプション解析係',
ARRAY['getoptsとgetopt（長いオプション対応）の違いを知らない', 'OPTARGとOPTINDの意味が分からない', ':を先頭につけてエラーメッセージを自分で制御する技を知らない', 'shift $((OPTIND - 1))を忘れて残りの引数が取れない'],
'オプション解析',
ARRAY['コマンドラインオプションを解析', '-f file形式のオプション対応', 'OPTARGで引数取得', 'shift $((OPTIND-1))で残り引数'],
true),

('shift', 'shift', '33333333-3333-3333-3333-333333333333', 'ba555555-5555-5555-5555-555555555555', 'function', 'beginner',
'位置パラメータをシフト',
'$1, $2, $3...を左にずらします。引数を順次処理するのに便利です。',
E'#!/bin/bash

echo "Args: $@"
echo "First: $1"

shift  # $1を削除、$2が新しい$1に

echo "After shift:"
echo "Args: $@"
echo "First: $1"

# 複数シフト
shift 2  # 2つシフト

# 使用例: ループで全引数を処理
while [ $# -gt 0 ]; do
  echo "Processing: $1"
  shift
done',
'引数シフト職人',
ARRAY['shiftせずに$2, $3...を直接参照して可読性最悪', 'shift後に$1が空になることを確認しない', 'shift Nで複数一気にシフトできることを知らない', '$#（引数の数）が減ることを理解してない'],
'引数の左シフト',
ARRAY['位置パラメータを左にシフト', '$1が消えて$2が新しい$1に', 'ループで全引数を処理', 'shift Nで複数シフト可能'],
true),

('here-document', 'Here Document', '33333333-3333-3333-3333-333333333333', 'ba555555-5555-5555-5555-555555555555', 'syntax', 'intermediate',
'複数行の文字列を渡す',
'複数行のテキストをコマンドに渡します。SQLやHTMLの生成に便利です。',
E'#!/bin/bash

# 基本形
cat <<EOF
This is a multi-line
text block.
Variables like $HOME are expanded.
EOF

# 変数展開を無効化（引用符で囲む）
cat <<''EOF''
$HOME is not expanded.
EOF

# インデントを無視（-をつける）
cat <<-EOF
	This line has a tab.
	The tab will be removed.
	EOF

# ファイルに書き込み
cat <<EOF > output.txt
Line 1
Line 2
EOF

# SQLの実行
mysql -u root <<EOF
USE mydb;
SELECT * FROM users;
EOF',
'複数行文書職人',
ARRAY['<<-でタブは削除されるがスペースは削除されないことを知らない', '引用符をつけないと変数展開されることを忘れる', 'EOFの終端がインデントされてるとエラーになる罠', '<<< (here string)の存在を知らない'],
'複数行入力',
ARRAY['複数行テキストをコマンドに渡す', '変数展開が可能', '<<-でインデント無視', 'SQL実行やファイル生成に便利'],
true),

('here-string', 'Here String', '33333333-3333-3333-3333-333333333333', 'ba555555-5555-5555-5555-555555555555', 'syntax', 'beginner',
'文字列を標準入力に渡す',
'echoとパイプを使わずに文字列を標準入力に渡します。',
E'#!/bin/bash

# Here String (<<<)
grep "pattern" <<< "This is a test string"

# 従来の方法（これより簡潔）
echo "This is a test string" | grep "pattern"

# 変数を渡す
TEXT="Hello World"
wc -w <<< "$TEXT"  # 2

# 複数のコマンド
while read line; do
  echo "Line: $line"
done <<< "Single line input"',
'一行入力係',
ARRAY['存在を知らずにecho | を毎回書いて冗長', 'Here Documentとの違いを説明できない', 'Bashism（bash固有）なのでshでは使えないことを忘れる', '改行が自動で追加されることを知らない'],
'文字列を標準入力へ',
ARRAY['文字列を標準入力に直接渡す', 'echo | より簡潔', '<<<演算子を使用', 'Bash固有（sh では使えない）'],
true),

('process-substitution', 'プロセス置換', '33333333-3333-3333-3333-333333333333', 'ba555555-5555-5555-5555-555555555555', 'syntax', 'advanced',
'コマンド出力をファイルのように扱う',
'コマンドの出力を一時的なファイルとして扱います。複数のコマンド出力を比較するのに便利です。',
E'#!/bin/bash

# 2つのコマンドの出力を比較
diff <(ls dir1) <(ls dir2)

# 複数ファイルをソートしてマージ
sort -m <(sort file1.txt) <(sort file2.txt) <(sort file3.txt)

# プロセスの出力をファイルに見せかける
while read line; do
  echo "Got: $line"
done < <(find . -name "*.txt")

# 出力をファイルに見せかける（>()）
echo "data" | tee >(gzip > output.gz) >(md5sum > output.md5)',
'仮想ファイル製造機',
ARRAY['存在を知らずに一時ファイルを手動作成してクリーンアップ忘れ', '<()と>()の違いを理解してない', '/dev/fd/Nのような名前が返ることを知らない', 'Bashism（bash固有）なので移植性がない'],
'コマンド出力を疑似ファイル化',
ARRAY['コマンド出力をファイルのように扱う', '<(cmd)で入力、>(cmd)で出力', '一時ファイル不要', 'diff, sortなどと組み合わせ'],
true),

('bash-arrays', '配列', '33333333-3333-3333-3333-333333333333', 'ba555555-5555-5555-5555-555555555555', 'syntax', 'intermediate',
'Bash配列の使い方',
'複数の値を配列として扱います。ループ処理や引数の管理に便利です。',
E'#!/bin/bash

# 配列の定義
fruits=("apple" "banana" "cherry")

# 要素へのアクセス
echo ${fruits[0]}  # apple
echo ${fruits[2]}  # cherry

# 全要素
echo ${fruits[@]}  # apple banana cherry
echo ${fruits[*]}  # apple banana cherry

# 要素数
echo ${#fruits[@]}  # 3

# ループ
for fruit in "${fruits[@]}"; do
  echo "Fruit: $fruit"
done

# 要素の追加
fruits+=("date")

# 連想配列（Bash 4+）
declare -A config
config[host]="localhost"
config[port]=3000
echo ${config[host]}',
'配列管理係',
ARRAY['$fruitsと${fruits[@]}の違いを理解してない', '"${array[@]}"と"${array[*]}"の微妙な違い', '連想配列がBash 4以降でしか使えないことを忘れる', '配列をループで回す時にクォートを忘れてスペース区切りで分割'],
'配列操作',
ARRAY['複数の値を配列に格納', '${array[@]}で全要素', '${#array[@]}で要素数', 'declare -Aで連想配列（Bash 4+）'],
true),

-- 環境変数とプロセス（5件）
('env-path', '$PATH', '33333333-3333-3333-3333-333333333333', 'ba666666-6666-6666-6666-666666666666', 'syntax', 'beginner',
'コマンド検索パス',
'実行ファイルを検索するディレクトリのリストです。コマンドがどこにあるか指定します。',
E'# 現在のPATH確認
echo $PATH
# /usr/local/bin:/usr/bin:/bin

# PATHに追加（一時的）
export PATH="$HOME/bin:$PATH"

# 永続的に追加（~/.bashrcに記述）
# export PATH="$HOME/.local/bin:$PATH"

# コマンドの場所を確認
which python3  # /usr/bin/python3
type python3   # python3 is /usr/bin/python3',
'コマンド探索隊',
ARRAY['PATHの先頭に追加すべきか末尾に追加すべきか理解してない', '相対パス（./script.sh）がPATHに依存しないことを知らない', 'export忘れで子プロセスに引き継がれない', 'PATHのタイポで全コマンドが使えなくなる地獄'],
'実行ファイル検索パス',
ARRAY['コマンド検索ディレクトリのリスト', ':で区切られている', '先頭から順に検索', 'export PATH="$PATH:$HOME/bin"で追加'],
true),

('env-home', '$HOME', '33333333-3333-3333-3333-333333333333', 'ba666666-6666-6666-6666-666666666666', 'syntax', 'beginner',
'ホームディレクトリ',
'現在のユーザーのホームディレクトリのパスです。~と等価です。',
E'# ホームディレクトリを表示
echo $HOME  # /home/username

# ファイルパス
CONFIG_FILE="$HOME/.config/app/config.json"

# ~も同じ
cd ~/Documents
cd $HOME/Documents  # 同じ

# 他のユーザーのホーム
cd ~alice  # /home/alice',
'帰巣本能',
ARRAY['$HOMEと~の違いを説明できない人多数', 'クォート内で~が展開されないことを知らない', '他のユーザーのホームに~usernameでアクセスできることを知らない', 'sudoで$HOMEが変わることを理解してない'],
'ユーザーのホーム',
ARRAY['ホームディレクトリのパス', '~と等価', 'クォートで囲む場合は$HOME推奨', '~usernameで他ユーザーのホーム'],
true),

('env-pwd', '$PWD', '33333333-3333-3333-3333-333333333333', 'ba666666-6666-6666-6666-666666666666', 'syntax', 'beginner',
'カレントディレクトリ',
'現在の作業ディレクトリのパスです。pwdコマンドと同じ値です。',
E'# 現在のディレクトリ
echo $PWD  # /home/user/projects

# スクリプトのあるディレクトリ（$PWDではない！）
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# 相対パスから絶対パスを作る
FILE="$PWD/output.txt"

# 前のディレクトリ
echo $OLDPWD  # 直前にいたディレクトリ
cd -  # $OLDPWDに戻る',
'現在地案内係',
ARRAY['$PWDとpwdコマンドの微妙な違い（シンボリックリンク）', 'スクリプトのあるディレクトリを$PWDで取ろうとして失敗', '$OLDPWDの存在を知らずにcd -の仕組みを理解してない', 'シンボリックリンクを辿った物理パスはpwd -Pで取得'],
'現在の作業ディレクトリ',
ARRAY['カレントディレクトリのパス', 'pwdコマンドと同じ値', '$OLDPWDで直前のディレクトリ', 'cd -で前のディレクトリに戻る'],
true),

('env-user', '$USER と $LOGNAME', '33333333-3333-3333-3333-333333333333', 'ba666666-6666-6666-6666-666666666666', 'syntax', 'beginner',
'現在のユーザー名',
'ログインしているユーザーの名前です。$USERと$LOGNAMEはほぼ同じです。',
E'# 現在のユーザー名
echo $USER     # alice
echo $LOGNAME  # alice
whoami         # alice

# ユーザー固有のパス
LOG_FILE="/var/log/app-$USER.log"

# root権限が必要なチェック
if [ "$USER" != "root" ]; then
  echo "This script must be run as root"
  exit 1
fi

# sudo実行時の元のユーザー
echo $SUDO_USER  # sudoで実行した場合の元のユーザー名',
'ユーザー名札',
ARRAY['$USERと$LOGNAMEの違いを説明できない（ほぼ同じ）', 'sudo実行時は$USERがrootになることを忘れる', '$SUDO_USERで元のユーザーを取得できることを知らない', 'id -unやwhoamiとの使い分けを考えない'],
'現在のユーザー',
ARRAY['ログインユーザーの名前', '$USERと$LOGNAMEはほぼ同じ', 'sudo時は$SUDO_USERで元のユーザー', 'whoamiコマンドでも取得可能'],
true),

('background-jobs', 'バックグラウンド実行', '33333333-3333-3333-3333-333333333333', 'ba666666-6666-6666-6666-666666666666', 'syntax', 'intermediate',
'コマンドをバックグラウンドで実行',
'&をつけてコマンドをバックグラウンドで実行します。複数のタスクを並行実行できます。',
E'#!/bin/bash

# バックグラウンドで実行
./long-task.sh &

# 複数のタスクを並行実行
./task1.sh &
./task2.sh &
./task3.sh &

# 全てのバックグラウンドジョブを待つ
wait

echo "All tasks completed"

# ジョブの一覧
jobs

# 特定のジョブを待つ
./task.sh &
PID=$!
wait $PID

# フォアグラウンドに戻す
# fg %1',
'裏方作業員',
ARRAY['&をつけ忘れて直列実行になる', 'waitを忘れてスクリプトが先に終了する', '$!で最後のバックグラウンドプロセスのPIDを取得できることを知らない', 'nohupと組み合わせてログアウト後も実行'],
'並行実行',
ARRAY['&でバックグラウンド実行', 'waitで全ジョブの完了を待つ', '$!で最後のプロセスのPID', 'jobs, fg, bgでジョブ制御'],
true);