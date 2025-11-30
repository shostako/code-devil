-- CodeDevil Phase 4: Bash追加 + 皮肉強化
-- Bash/Shell言語を追加し、既存エントリの悪魔のノートを毒舌化

-- ============================================
-- Part 1: Bash/Shell 言語追加
-- ============================================

-- Bash言語
INSERT INTO languages (id, slug, name, icon_url) VALUES
  ('33333333-3333-3333-3333-333333333333', 'bash', 'Bash/Shell', '/icons/bash.svg');

-- Bashカテゴリ
INSERT INTO categories (id, language_id, slug, name, sort_order) VALUES
  ('ca111111-1111-1111-1111-111111111111', '33333333-3333-3333-3333-333333333333', 'basics', '基本コマンド', 1),
  ('ca222222-2222-2222-2222-222222222222', '33333333-3333-3333-3333-333333333333', 'control', '制御構文', 2),
  ('ca333333-3333-3333-3333-333333333333', '33333333-3333-3333-3333-333333333333', 'pipes', 'パイプとリダイレクト', 3);

-- Bashエントリ（12件）
INSERT INTO entries (id, slug, name, language_id, category_id, entry_type, difficulty, short_desc, full_desc, code_example, sarcastic_title, sarcastic_notes, is_published) VALUES
  -- 基本コマンド
  ('c1111111-1111-1111-1111-111111111111', 'cd', 'cd', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'beginner',
   'ディレクトリを移動する',
   'Change Directoryの略。カレントディレクトリを変更する基本中の基本コマンド。',
   'cd /home/user/projects',
   '迷子製造機',
   ARRAY[
     '「cd ..」を連打して気づいたらルートディレクトリ。そこからどう戻るか覚えてない。',
     'シンボリックリンク先でcd ..したら、元の場所じゃなくてリンク先の親に行く罠。',
     '「cd -」で前のディレクトリに戻れることを知った時の衝撃。なぜもっと早く教えてくれなかった。',
     '相対パスで移動しまくって、「今どこにいるの？」が口癖になる。pwdが友達。'
   ], true),

  ('c2222222-2222-2222-2222-222222222222', 'ls', 'ls', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'beginner',
   'ディレクトリの内容を表示',
   'ファイルとディレクトリの一覧を表示する。オプションが多すぎて覚えきれない。',
   'ls -la',
   '見せたがりの覗き魔',
   ARRAY[
     '「ls -la」をエイリアスに登録してない人、存在するの？',
     'ファイルが多すぎてターミナルが埋まる。lessに繋げよ。',
     '隠しファイル見忘れて「ファイルがない！」と騒いだ回数を数えたくない。',
     'lsの出力を目視でパースしてる奴、findかglobを覚えろ。'
   ], true),

  ('c3333333-3333-3333-3333-333333333333', 'grep', 'grep', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'beginner',
   'テキストパターンを検索',
   'Global Regular Expression Print。正規表現でファイル内を検索する強力なツール。',
   'grep -r "TODO" .',
   '検索依存症の元凶',
   ARRAY[
     '正規表現が複雑になりすぎて、自分で書いたパターンが読めなくなる病。',
     '「grep -r」が遅すぎてripgrepに乗り換えた瞬間、もう戻れなくなる。',
     'grep | grep | grep でパイプを繋ぎまくって、最終的に何を探してたか忘れる。',
     'egrepとfgrepとgrepの違いを説明できる人、尊敬する。私は毎回ググる。'
   ], true),

  ('c4444444-4444-4444-4444-444444444444', 'find', 'find', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'intermediate',
   'ファイルを検索する',
   'ディレクトリツリーを再帰的に検索する。オプションの組み合わせが魔法の呪文。',
   'find . -name "*.txt" -exec rm {} \;',
   '迷宮探索の魔導書',
   ARRAY[
     '「-exec」の構文を毎回ググる。「{}」と「\\;」の意味？知らん、動けばいい。',
     'xargsと組み合わせるかexec使うかで宗教戦争が勃発する。',
     '「find / -name ...」を実行して、Permission deniedで画面が埋まる儀式。',
     'locateの方が速いと知りつつ、updatedbが面倒でfindを使い続ける怠惰。'
   ], true),

  ('c5555555-5555-5555-5555-555555555555', 'cat', 'cat', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'beginner',
   'ファイルの内容を表示',
   'concatenateの略。本来はファイル連結用だが、大半は中身表示に使われる。',
   'cat file.txt',
   '無駄遣いの象徴',
   ARRAY[
     '「Useless Use of Cat」という言葉を知ってるか？cat file | grepはgrep file で十分。',
     'catで巨大バイナリファイルを開いてターミナルが壊れる初心者の通過儀礼。',
     'cat << EOF でヒアドキュメント書く時、EOFのスペルを間違えて無限入力地獄。',
     'lessでいいのにcatする癖が抜けない。ページャーを使え、ページャーを。'
   ], true),

  ('c6666666-6666-6666-6666-666666666666', 'echo', 'echo', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'beginner',
   'テキストを出力する',
   '引数を標準出力に表示する。デバッグやスクリプト出力に頻繁に使用。',
   'echo "Hello, $USER"',
   '独り言マシン',
   ARRAY[
     '「$変数」と「\\$変数」と「''$変数''」の違いで3時間溶かした経験、あるだろ？',
     'echo -e と echo -n のオプション、bashとshで挙動が違う罠。',
     'printf使えばいいのにecho使い続ける。printfの方が移植性高いって知ってる？',
     'echo $PATH | tr : \\n ってやる度に「もっと良い方法あるだろ」と思いつつ続ける。'
   ], true),

  -- 制御構文
  ('c7777777-7777-7777-7777-777777777777', 'if', 'if文', '33333333-3333-3333-3333-333333333333', 'ca222222-2222-2222-2222-222222222222', 'syntax', 'beginner',
   '条件分岐を行う',
   'if-then-else-fi構文。条件式の書き方でハマる人が後を絶たない。',
   'if [ "$x" = "y" ]; then echo "match"; fi',
   '条件分岐の地雷原',
   ARRAY[
     '「[」と「[[」の違い？「[」はコマンドで「[[」はbash組み込み。混乱しかない。',
     'スペースを忘れて「[\"$x\"=\"y\"]」と書いてエラー。[の後ろにスペース必須って罠すぎる。',
     '「-eq」「-ne」「-lt」「-gt」を毎回調べる。なぜ「==」「!=」じゃダメなんだ。',
     'if文の中でコマンドの戻り値を直接評価できるの、便利だけど可読性ゼロ。'
   ], true),

  ('c8888888-8888-8888-8888-888888888888', 'for', 'forループ', '33333333-3333-3333-3333-333333333333', 'ca222222-2222-2222-2222-222222222222', 'syntax', 'beginner',
   '繰り返し処理を行う',
   'for-in-do-done構文。ファイル名にスペースがあると地獄を見る。',
   'for file in *.txt; do echo "$file"; done',
   'ファイル名スペース殺し',
   ARRAY[
     'ファイル名にスペースがあるとfor文が壊れる。IFSをいじるか、find -print0を使え。',
     '「for i in $(seq 1 10)」は遅い。bashなら「for ((i=1; i<=10; i++))」を使え。',
     'グロブ展開でファイルが多すぎると「Argument list too long」で死ぬ。',
     'while readで1行ずつ読む方が安全なケースが多いと知りつつ、for使い続ける。'
   ], true),

  -- パイプとリダイレクト
  ('c9999999-9999-9999-9999-999999999999', 'pipe', 'パイプ |', '33333333-3333-3333-3333-333333333333', 'ca333333-3333-3333-3333-333333333333', 'operator', 'beginner',
   'コマンドの出力を次のコマンドへ',
   'UNIX哲学の象徴。小さなプログラムを組み合わせて大きな処理を行う。',
   'cat file.txt | grep "error" | sort | uniq -c',
   '繋げすぎ病の入り口',
   ARRAY[
     '10段パイプを書いて満足した後、1ヶ月後の自分が解読できない。',
     'パイプの途中で何が流れてるか確認したくて、teeを挟みまくる羽目になる。',
     'シェル芸人のワンライナー見て「真似しよう」→3時間溶かす→for文で書き直す。',
     'set -o pipefail しないと、パイプの途中で失敗しても気づかない罠。'
   ], true),

  ('caaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'redirect', 'リダイレクト >', '33333333-3333-3333-3333-333333333333', 'ca333333-3333-3333-3333-333333333333', 'operator', 'beginner',
   '出力をファイルに書き込む',
   '>は上書き、>>は追記。間違えると取り返しがつかない。',
   'echo "log" >> output.log',
   'データ消失の元凶',
   ARRAY[
     '「>」と「>>」を間違えて大事なログファイルを空にした経験、一度はあるだろ。',
     '「2>&1」の意味を正確に説明できる人、10人中2人くらいだと思う。',
     '「> /dev/null 2>&1」を呪文のように書いてるけど、順番の意味わかってる？',
     'noclobberオプション知ってる？知ってても設定してないだろ。私もだ。'
   ], true),

  ('cbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'sudo', 'sudo', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'beginner',
   '管理者権限でコマンドを実行',
   'Super User DO。一時的にroot権限を取得してコマンドを実行する。',
   'sudo apt install package',
   '権限濫用の免罪符',
   ARRAY[
     '「Permission denied」→とりあえずsudo→「動いた！」→なぜ動いたか調べない。',
     '「sudo rm -rf /」をネタにする人、実際にやらかした人を知ってる身としては笑えない。',
     'sudoersの設定でNOPASSWD使ってる人、セキュリティ意識どこ行った。',
     '「sudo su -」でrootになりっぱなしの人、そのターミナル閉じ忘れるなよ。'
   ], true),

  ('cccccccc-1111-1111-1111-111111111111', 'chmod', 'chmod 777', '33333333-3333-3333-3333-333333333333', 'ca111111-1111-1111-1111-111111111111', 'function', 'beginner',
   'ファイルの権限を変更',
   'Change Modeの略。読み取り・書き込み・実行権限を設定する。',
   'chmod 755 script.sh',
   'セキュリティ放棄宣言',
   ARRAY[
     '「Permission denied」→「chmod 777」→「動いた！」→セキュリティ担当が泣いてる。',
     '777の意味：「誰でも読めて書けて実行できる」。本番でこれやったら終わり。',
     '数字の意味（4=読、2=書、1=実行）を毎回ググる。もう覚えろよ、自分。',
     'chownとchmodを混同してる人、結構いる。所有者変更と権限変更は別物だぞ。'
   ], true);

-- Bashタグ関連付け
INSERT INTO entry_tags (entry_id, tag_id) VALUES
  ('c1111111-1111-1111-1111-111111111111', 'cccccccc-cccc-cccc-cccc-cccccccccccc'),  -- cd: 初心者向け
  ('c2222222-2222-2222-2222-222222222222', 'cccccccc-cccc-cccc-cccc-cccccccccccc'),  -- ls: 初心者向け
  ('c2222222-2222-2222-2222-222222222222', 'dddddddd-dddd-dddd-dddd-dddddddddddd'),  -- ls: よく使う
  ('c3333333-3333-3333-3333-333333333333', 'dddddddd-dddd-dddd-dddd-dddddddddddd'),  -- grep: よく使う
  ('c5555555-5555-5555-5555-555555555555', 'cccccccc-cccc-cccc-cccc-cccccccccccc'),  -- cat: 初心者向け
  ('cbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'cccccccc-cccc-cccc-cccc-cccccccccccc');  -- sudo: 初心者向け


-- ============================================
-- Part 2: 既存エントリ皮肉強化
-- ============================================

-- Python エントリ強化
UPDATE entries SET
  sarcastic_notes = ARRAY[
    'デバッグの9割はprint()で始まりprint()で終わる。デバッガー？使い方覚える時間でprint()書ける。',
    '本番環境にprint()が残ってることに気づくのは、大抵リリース後。ログに「ここ通った」が流れる恐怖。',
    'f-stringを知ってからformat()を使う人を見下すようになった。人間は傲慢になる。',
    '「print(type(x))」でデバッグしてるなら、そろそろ型ヒントを学べ。'
  ]
WHERE slug = 'print' AND language_id = '11111111-1111-1111-1111-111111111111';

UPDATE entries SET
  sarcastic_notes = ARRAY[
    '日本語文字列でlen()したら1文字が3とか4になる世界。Unicode正規化の闇へようこそ。',
    'len(generator)できないと知った時の絶望感。list()で包む？メモリ爆発する？詰み。',
    'Noneにlen()してTypeError。「長さゼロ」と「存在しない」は違うんだよ、Python。',
    '「len()で要素数わかるでしょ」→SQLAlchemyのクエリ結果にlen()→全件フェッチ→DB死亡。'
  ]
WHERE slug = 'len' AND language_id = '11111111-1111-1111-1111-111111111111';

UPDATE entries SET
  sarcastic_notes = ARRAY[
    'range(1, 10)が10を含まないことを覚えるまでに、何回off-by-oneエラー出した？数えたくない。',
    '「for i in range(len(lst))」と書いてる人、enumerate()を覚えろ。Pythonを舐めるな。',
    'Python 2のxrange()を覚えてる人は歴戦の勇者。range()がメモリ食い尽くしてた時代があった。',
    'range(10, 0, -1)で逆順ループ。直感的？いや、毎回頭の中で実行してから書いてるだろ。'
  ]
WHERE slug = 'range' AND language_id = '11111111-1111-1111-1111-111111111111';

UPDATE entries SET
  sarcastic_notes = ARRAY[
    'ジェネレータを殺す最も簡単な方法：list()で包む。メモリ効率？知らんな。',
    'list.append()を1万回呼ぶか、リスト内包表記で一発か。後者の方が速いって知ってた？',
    'list()とarray()とnp.array()の使い分け、3年目でもたまに間違える。',
    '「リストをコピーしたつもり」→参照コピーしてた→元データ破壊。.copy()を使え。'
  ]
WHERE slug = 'list' AND language_id = '11111111-1111-1111-1111-111111111111';

UPDATE entries SET
  sarcastic_notes = ARRAY[
    'KeyErrorが怖くて.get()使う人と、堂々とd[key]する人。後者は自信家か、テストを信じてる。',
    '辞書内包表記を覚えた瞬間、全ての処理を辞書内包表記で書きたくなる病が発症する。',
    'Python 3.7以降は挿入順保持。それ以前？OrderedDict使え。え、知らなかった？',
    'JSONパースした結果がdict。Noneが来ると思ってなかった？エラーハンドリング甘すぎ。'
  ]
WHERE slug = 'dict' AND language_id = '11111111-1111-1111-1111-111111111111';

-- JavaScript エントリ強化
UPDATE entries SET
  sarcastic_notes = ARRAY[
    'console.log()を消し忘れて本番デプロイした回数、履歴書には書けない。',
    '「console.log("ここ通った")」を10個並べて、どれが出力されてるか分からなくなる現象。名前つけろ。',
    'console.table()とかconsole.group()の存在を知っても、結局log()しか使わない怠惰。',
    'デバッガーのブレークポイント？設定する時間でconsole.log()10個書ける。効率の問題だ（言い訳）。'
  ]
WHERE slug = 'console-log' AND language_id = '22222222-2222-2222-2222-222222222222';

UPDATE entries SET
  sarcastic_notes = ARRAY[
    'map()の戻り値を使わないでforEach()として使う人、コードレビューで指摘される未来が見える。',
    'map()の中でawait使おうとしてPromise.all()が必要だと気づくまでの時間、平均30分。',
    'map()とforEach()の違いを説明できない人、意外と多い。戻り値があるかないかだ。',
    'arr.map((x, i) => ...)のiを使わないのに書いてる人、ESLintが泣いてるぞ。'
  ]
WHERE slug = 'array-map' AND language_id = '22222222-2222-2222-2222-222222222222';

UPDATE entries SET
  sarcastic_notes = ARRAY[
    'filter().map().reduce()のチェーンが長すぎて、3ヶ月後の自分が読めない。コメント書け。',
    'filter(Boolean)というテクニックを覚えた時の万能感。falsy値が全部消えると知った時の絶望感。',
    'filter()で新しい配列作って、元の配列が変わってないことに驚く人、参照の勉強しろ。',
    'filter()の条件が複雑すぎて関数に切り出す→その関数のテストを書く→本末転倒。'
  ]
WHERE slug = 'array-filter' AND language_id = '22222222-2222-2222-2222-222222222222';

UPDATE entries SET
  sarcastic_notes = ARRAY[
    'Promiseチェーンで.catch()を最後に1個だけ置いて満足してる人、途中でエラー握りつぶしてない？',
    'new Promise()の中でresolve()を呼び忘れて永遠に待ち続けるPromise。誰にも気づかれない。',
    'Promise.all()で1個失敗したら全部失敗。Promise.allSettled()の存在を知るのは大抵事故後。',
    '「Promiseはコールバック地獄を解決する」→.then().then().then()地獄→何も解決してない。'
  ]
WHERE slug = 'promise' AND language_id = '22222222-2222-2222-2222-222222222222';

UPDATE entries SET
  sarcastic_notes = ARRAY[
    'awaitを忘れてPromiseオブジェクトをそのまま使ってundefinedになる初心者の通過儀礼。',
    'forループの中でawaitして直列実行。Promise.all()使えば並列なのに。パフォーマンス意識どこ行った。',
    '.then()地獄から抜け出したと思ったら、try-catch地獄にハマる。ネストが減っただけ。',
    'async関数が暗黙的にPromiseを返すことを忘れて、呼び出し側でawaitし忘れる。無限ループ。'
  ]
WHERE slug = 'async-await' AND language_id = '22222222-2222-2222-2222-222222222222';
