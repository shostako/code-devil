-- 018_fix_all_notes.sql
-- 正しいslugに基づいた全エントリのノート更新

-- ===========================================
-- まず全てクリア
-- ===========================================
UPDATE entries
SET angel_title = NULL,
    angel_notes = NULL,
    sarcastic_title = NULL,
    sarcastic_notes = NULL;

-- ===========================================
-- BASH (39件)
-- ===========================================

-- argcount ($#)
UPDATE entries SET
  angel_title = '引数の数を取得', angel_notes = ARRAY['スクリプトに渡された引数の数を返す', '条件分岐で「引数が足りない」チェックに使う', '$0（スクリプト名）は含まれない'],
  sarcastic_title = '引数カウンター', sarcastic_notes = ARRAY['if [ $# -eq 0 ] で「引数ないぞ」チェック、定番', '引数の数だけチェックして中身は見ない、あるある', '$# と $@ と $* の違い、毎回調べる']
WHERE slug = 'argcount' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- args ($@/$*)
UPDATE entries SET
  angel_title = '全引数の取得', angel_notes = ARRAY['$@は各引数を個別に、$*は全部を1つの文字列に', 'ダブルクォートで囲むと挙動が変わる', 'for arg in "$@" が安全な反復処理'],
  sarcastic_title = '引数の双子', sarcastic_notes = ARRAY['"$@" と "$*" の違い、説明できる人少ない', 'スペース含む引数で $@ と $* の違いが牙を剥く', 'for i in $@ と for i in "$@" で全然違う結果になる罠']
WHERE slug = 'args' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- awk
UPDATE entries SET
  angel_title = '万能テキスト処理機', angel_notes = ARRAY['$1, $2... でフィールドアクセス', '-F で区切り文字を指定', 'BEGIN/END で前処理・後処理'],
  sarcastic_title = 'テキスト処理の神', sarcastic_notes = ARRAY['awk で何でもできるけど、その awk スクリプト誰が保守する？', 'print $1 だけ知ってる人、awk の1%も使いこなせてない', 'gawk と mawk で挙動違って本番で爆発']
WHERE slug = 'awk' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- basename
UPDATE entries SET
  angel_title = 'パスからファイル名抽出', angel_notes = ARRAY['ディレクトリ部分を除去してファイル名だけ取得', '第2引数で拡張子も除去可能', 'dirname と対になるコマンド'],
  sarcastic_title = 'パス切り取り職人', sarcastic_notes = ARRAY['${var##*/} でも同じことできるの知ってる？', 'basename と dirname のペア、意外と使う', 'パス操作、シェルの変数展開でやるか basename でやるか']
WHERE slug = 'basename' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- case文
UPDATE entries SET
  angel_title = 'パターンマッチ分岐', angel_notes = ARRAY['複数の条件を見やすく書ける', 'ワイルドカード(*)が使える', ';;で各ケースを終了'],
  sarcastic_title = 'if-else の見栄え版', sarcastic_notes = ARRAY['esac って case の逆さま、fi と同じノリ', ';; 忘れてフォールスルー、いや bash は違うか', '|) でOR条件、知らない人多い']
WHERE slug = 'case' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- cat
UPDATE entries SET
  angel_title = 'ファイル内容表示', angel_notes = ARRAY['-n で行番号を表示', '複数ファイルを連結して表示', 'ヒアドキュメントと組み合わせてファイル作成'],
  sarcastic_title = '連結と表示', sarcastic_notes = ARRAY['cat file | grep pattern ←UUOC(Useless Use of Cat)の代表', 'cat << EOF でヒアドキュメント、インデント崩れて泣く', '大きいファイルを cat して端末固まった経験']
WHERE slug = 'cat' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- cd
UPDATE entries SET
  angel_title = 'ディレクトリ移動', angel_notes = ARRAY['cd - で直前のディレクトリに戻る', 'cd ~ でホームに移動', 'CDPATH変数でよく使うパスを設定可能'],
  sarcastic_title = '移動の基本', sarcastic_notes = ARRAY['cd 失敗してもスクリプト続行、set -e 付けてなかった悲劇', 'cd - で戻れるの知らない人、まだいる', 'CDPATH 設定したら混乱して結局戻した']
WHERE slug = 'cd' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- chmod
UPDATE entries SET
  angel_title = 'パーミッション変更', angel_notes = ARRAY['755 = rwxr-xr-x（実行可能スクリプト向け）', '644 = rw-r--r--（一般的なファイル向け）', '+x で実行権限を付与'],
  sarcastic_title = '権限管理の番人', sarcastic_notes = ARRAY['777 設定する人、セキュリティって知ってる？', 'u+x, g+x, o+x の違い、ちゃんと理解してる？', '+x だけだとumaskの影響受けるの知ってた？']
WHERE slug = 'chmod' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- chown
UPDATE entries SET
  angel_title = '所有者変更', angel_notes = ARRAY['user:group で所有者とグループを同時に変更', '-R で再帰的に変更', 'root権限が必要な場合が多い'],
  sarcastic_title = '所有者変更の権力', sarcastic_notes = ARRAY['sudo chown -R 間違えてシステムファイルの所有者変えた', 'user:group の : 忘れて user だけ変更される', '再帰的に変更して戻せなくなった経験']
WHERE slug = 'chown' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- cut
UPDATE entries SET
  angel_title = 'フィールド切り出し', angel_notes = ARRAY['-d で区切り文字、-f でフィールド番号', 'CSV処理の簡易版として使える', '-c で文字位置での切り出しも可能'],
  sarcastic_title = '切り取り職人', sarcastic_notes = ARRAY['cut -d: -f1 /etc/passwd ←定番の例', 'awk の方が柔軟だけど cut の方がシンプル', 'タブ区切りがデフォルト、忘れて -d 指定し忘れ']
WHERE slug = 'cut' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- diff
UPDATE entries SET
  angel_title = 'ファイル比較', angel_notes = ARRAY['-u でunified形式（見やすい）', '-r でディレクトリを再帰比較', '終了コードで差分有無を判定可能'],
  sarcastic_title = '差分検出器', sarcastic_notes = ARRAY['diff の出力、慣れないと読めない', 'git diff に慣れると素の diff が古く感じる', '-y でサイドバイサイド表示、端末幅足りない']
WHERE slug = 'diff' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- dirname
UPDATE entries SET
  angel_title = 'パスからディレクトリ抽出', angel_notes = ARRAY['ファイル名部分を除去してディレクトリだけ取得', 'basename と対になるコマンド', 'スクリプトの場所を取得するのに使う'],
  sarcastic_title = 'パス分解職人', sarcastic_notes = ARRAY['${var%/*} でも同じことできる、シェル芸', 'dirname "$0" でスクリプトのディレクトリ取得、定番', 'realpath と組み合わせて絶対パス取得']
WHERE slug = 'dirname' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- echo
UPDATE entries SET
  angel_title = '出力の基本', angel_notes = ARRAY['-n で改行なしで出力', '-e でエスケープシーケンスを解釈', 'printf の方が移植性が高い'],
  sarcastic_title = '出力の原始', sarcastic_notes = ARRAY['echo "$var" と echo $var の違いで1日溶かした経験', '-n と -e のオプション、どっちがどっちか毎回忘れる', 'printf 使えばいいのに echo で頑張る人']
WHERE slug = 'echo' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- exit-status ($?)
UPDATE entries SET
  angel_title = '終了ステータス取得', angel_notes = ARRAY['直前のコマンドの終了コードを取得', '0は成功、それ以外は失敗', 'if文の条件判定に使える'],
  sarcastic_title = '成否判定の番人', sarcastic_notes = ARRAY['$? を変数に保存する前に別のコマンド実行して上書き', '0が成功って、他の言語と逆で混乱する', 'set -e してると $? 見る前にスクリプト終了']
WHERE slug = 'exit-status' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- export
UPDATE entries SET
  angel_title = '環境変数の設定', angel_notes = ARRAY['子プロセスに変数を継承させる', '~/.bashrc に書けば永続化', 'export VAR=value の形式'],
  sarcastic_title = '環境変数の魔法', sarcastic_notes = ARRAY['export なしで変数定義して「なぜ子プロセスで見えない？」', '.bashrc と .bash_profile どっちに書く論争', 'export PATH=$PATH:xxx を何回も書いて PATH が長大に']
WHERE slug = 'export' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- find
UPDATE entries SET
  angel_title = 'ファイル検索', angel_notes = ARRAY['-name でファイル名検索', '-type f でファイルのみ、-type d でディレクトリのみ', '-exec で見つけたファイルにコマンド実行'],
  sarcastic_title = '探索の魔術師', sarcastic_notes = ARRAY['-exec {} \\; と -exec {} + の違い、説明できる？', 'find . -name "*.txt" のクォート忘れてシェル展開される罠', '-delete オプション、-name より先に書いて全削除した伝説']
WHERE slug = 'find' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- forループ
UPDATE entries SET
  angel_title = '繰り返し処理', angel_notes = ARRAY['for i in list; do ... done の形式', 'C言語風の for ((i=0; i<10; i++)) も可能', 'seq コマンドや {1..10} で連番生成'],
  sarcastic_title = 'ループの基本', sarcastic_notes = ARRAY['for i in $(ls) ←これやるな、ファイル名にスペースあると死ぬ', 'for file in *.txt と for file in "*.txt" の違い', 'C言語風for文、bash でしか動かない']
WHERE slug = 'for' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- function
UPDATE entries SET
  angel_title = '関数定義', angel_notes = ARRAY['function name() {} または name() {} の形式', '引数は $1, $2... で受け取る', 'return で終了コードを返す（値は返せない）'],
  sarcastic_title = '関数の罠', sarcastic_notes = ARRAY['return で値を返そうとして「あれ？」', 'local 付けないと変数がグローバルになる罠', 'function キーワード、POSIX的には不要']
WHERE slug = 'function' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- grep
UPDATE entries SET
  angel_title = 'テキスト検索', angel_notes = ARRAY['-i で大文字小文字を無視', '-r でディレクトリを再帰検索', '-v でマッチしない行を表示'],
  sarcastic_title = '検索の覇王', sarcastic_notes = ARRAY['grep -r . で再帰検索してバイナリファイルにヒットする地獄', 'egrep, fgrep が非推奨になったの知ってる？', '正規表現で検索したいのか固定文字列か、-F オプション忘れがち']
WHERE slug = 'grep' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- head
UPDATE entries SET
  angel_title = '先頭部分の表示', angel_notes = ARRAY['-n 数字 で行数指定', 'デフォルトは10行', '-c でバイト数指定も可能'],
  sarcastic_title = '先頭取得係', sarcastic_notes = ARRAY['head -n -5 で末尾5行以外を取得、知らない人多い', 'デフォルト10行、-n 忘れて全部見えると思ってた', 'tail と組み合わせて中間部分取得、面倒くさい']
WHERE slug = 'head' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- if文
UPDATE entries SET
  angel_title = '条件分岐', angel_notes = ARRAY['[[ ]] の方が機能が豊富（Bash拡張）', 'then は改行またはセミコロンの後', 'fiで閉じるのを忘れずに'],
  sarcastic_title = '条件分岐の門', sarcastic_notes = ARRAY['then 忘れてシンタックスエラー、毎回やる', 'fi の綴り、if の逆さま、Algol の伝統らしい', '[[ $var == *pattern* ]] のグロブ、ダブルクォートで囲むと動かない']
WHERE slug = 'if' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- ln
UPDATE entries SET
  angel_title = 'リンク作成', angel_notes = ARRAY['-s でシンボリックリンク（よく使う）', 'ハードリンクはファイルシステムを跨げない', 'リンク先が存在しなくても作成可能（シンボリック）'],
  sarcastic_title = 'リンクの魔術', sarcastic_notes = ARRAY['ln -s の引数の順番、毎回間違える', 'シンボリックリンクとハードリンクの違い、説明できる？', '相対パスでリンク作って「リンク切れた」と騒ぐ']
WHERE slug = 'ln' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- ls
UPDATE entries SET
  angel_title = 'ファイル一覧表示', angel_notes = ARRAY['-la で隠しファイル含む詳細表示', '-h でサイズを人間が読みやすい形式に', '-t で更新日時順にソート'],
  sarcastic_title = '一覧表示の王道', sarcastic_notes = ARRAY['ls の結果をパースするな、find 使え←これ何回言った？', '-la 以外のオプション知らない人が多すぎる', '--color=auto が効かない環境でパニック']
WHERE slug = 'ls' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- パイプ
UPDATE entries SET
  angel_title = 'コマンド連結', angel_notes = ARRAY['前のコマンドの出力を次の入力に', '複数のコマンドを組み合わせて強力な処理', 'パイプ内の各コマンドは並列実行される'],
  sarcastic_title = 'コマンド連結の芸術', sarcastic_notes = ARRAY['パイプ使いすぎてワンライナーが読めなくなる', 'パイプの中で変数代入しても元のシェルに反映されない罠', 'set -o pipefail 知らないと途中のエラー見逃す']
WHERE slug = 'pipe' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- pwd
UPDATE entries SET
  angel_title = 'カレントディレクトリ表示', angel_notes = ARRAY['現在の作業ディレクトリを表示', '-P で物理パス（シンボリックリンク解決）', '$PWD 変数でも取得可能'],
  sarcastic_title = '現在地確認', sarcastic_notes = ARRAY['pwd と $PWD と $(pwd)、どれ使う？', '-L と -P の違い、シンボリックリンク絡みで効いてくる', 'スクリプト中で cd してから pwd、想定と違う場所にいる']
WHERE slug = 'pwd' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- read
UPDATE entries SET
  angel_title = 'ユーザー入力の取得', angel_notes = ARRAY['-p でプロンプトを表示', '-s でパスワード入力（非表示）', '-t でタイムアウトを設定'],
  sarcastic_title = '入力待ちの番人', sarcastic_notes = ARRAY['パイプから read するとサブシェルで変数消える罠', 'IFS いじり忘れてスペース区切りで分割されて泣く', '-r オプション忘れてバックスラッシュが消える']
WHERE slug = 'read' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- リダイレクト
UPDATE entries SET
  angel_title = '入出力の切り替え', angel_notes = ARRAY['> で上書き、>> で追記', '2>&1 で標準エラーを標準出力にマージ', '/dev/null に捨てて出力を無視'],
  sarcastic_title = '入出力の魔法', sarcastic_notes = ARRAY['> と >> 間違えてログファイル消した', '2>&1 の順番間違えて stderr が消える', '&> と >& の違い、bash のバージョンで変わる']
WHERE slug = 'redirect' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- sed
UPDATE entries SET
  angel_title = 'ストリームエディタ', angel_notes = ARRAY['-i で直接ファイルを編集（要注意）', 's/old/new/g で全置換', 'macOSでは -i '''' が必要'],
  sarcastic_title = 'ストリームの魔法使い', sarcastic_notes = ARRAY['macOS と Linux で -i の挙動違う問題、何人犠牲になった？', 's/foo/bar/g の g 忘れて「1個しか置換されない」', '複数行置換したいけど sed じゃ無理、perl か awk 使え']
WHERE slug = 'sed' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- sort
UPDATE entries SET
  angel_title = 'ソート処理', angel_notes = ARRAY['-n で数値としてソート', '-r で降順', '-u で重複を除去（uniq不要）'],
  sarcastic_title = 'ソートの職人', sarcastic_notes = ARRAY['-n 忘れて 2 が 10 より後に来て「なんで？」', 'ロケール依存でソート順変わって CI で落ちる', '-u オプションで重複除去できるの、uniq 使わなくていい']
WHERE slug = 'sort' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- source
UPDATE entries SET
  angel_title = 'スクリプト読み込み', angel_notes = ARRAY['現在のシェルでスクリプトを実行', '. script.sh でも同じ', '環境変数や関数を現在のシェルに取り込む'],
  sarcastic_title = '読み込みの魔法', sarcastic_notes = ARRAY['source と . と bash script.sh の違い、説明できる？', 'source したスクリプトの exit で親シェルも終了する罠', '.bashrc を source し忘れて「設定が反映されない」']
WHERE slug = 'source' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- sudo
UPDATE entries SET
  angel_title = '特権実行', angel_notes = ARRAY['一時的にroot権限でコマンド実行', '-u で指定ユーザーとして実行', 'sudoers ファイルで権限管理'],
  sarcastic_title = '魔法の呪文', sarcastic_notes = ARRAY['とりあえず sudo 付ける人、権限って概念知ってる？', 'sudo vim で編集したファイルの所有者がroot', 'sudo su - と sudo -i の違い、聞かれると困る']
WHERE slug = 'sudo' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- tail
UPDATE entries SET
  angel_title = '末尾部分の表示', angel_notes = ARRAY['-f でリアルタイム監視（ログに便利）', '-n 数字 で行数指定', '-F でファイルのローテーションに追従'],
  sarcastic_title = 'ログ監視の友', sarcastic_notes = ARRAY['tail -f で監視してるけど、ファイルローテーションで死ぬ', '-F オプションの存在を知らずに -f --retry で頑張ってた', 'tail -n +2 でヘッダースキップ、毎回構文調べる']
WHERE slug = 'tail' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- tar
UPDATE entries SET
  angel_title = 'アーカイブ操作', angel_notes = ARRAY['-czvf で圧縮、-xzvf で展開', '-t で中身を確認（展開せず）', '-C で展開先ディレクトリを指定'],
  sarcastic_title = 'アーカイブの古参', sarcastic_notes = ARRAY['tar のオプション順番、毎回調べる -czvf なのか -zcvf なのか', 'tar bomb 作って展開先汚染した経験', 'tar.gz と tgz、同じなのに両方使う人']
WHERE slug = 'tar' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- tee
UPDATE entries SET
  angel_title = '出力の分岐', angel_notes = ARRAY['画面表示とファイル保存を同時に', '-a で追記モード', 'sudo と組み合わせる時に便利'],
  sarcastic_title = '分岐出力の魔法', sarcastic_notes = ARRAY['sudo でファイル書き込みたい時の sudo tee 技', 'tee /dev/null で出力捨てながらコピー、謎テクニック', '> file と tee file の違い、パイプの途中で使う']
WHERE slug = 'tee' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- trap
UPDATE entries SET
  angel_title = 'シグナル捕捉', angel_notes = ARRAY['スクリプト終了時のクリーンアップに使う', 'trap "command" EXIT で終了時に実行', 'Ctrl+C (SIGINT) のハンドリングにも'],
  sarcastic_title = 'シグナルの罠', sarcastic_notes = ARRAY['trap 知らずに一時ファイル残しまくるスクリプト', 'EXIT と ERR と INT の使い分け、複雑', 'trap の中で exit すると無限ループする罠']
WHERE slug = 'trap' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- uniq
UPDATE entries SET
  angel_title = '重複行の処理', angel_notes = ARRAY['事前にsortが必要（連続した重複のみ検出）', '-c で出現回数をカウント', '-d で重複行のみ表示'],
  sarcastic_title = '重複削除の条件付き', sarcastic_notes = ARRAY['sort してから uniq しないと連続した重複しか消えない', '「なんで重複消えない？」←sort 忘れてるだろ', '-c オプションでカウントできるの、意外と便利']
WHERE slug = 'uniq' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- wc
UPDATE entries SET
  angel_title = '行数・単語数カウント', angel_notes = ARRAY['-l で行数のみ', '-w で単語数のみ', '-c でバイト数、-m で文字数'],
  sarcastic_title = 'カウントの魔術', sarcastic_notes = ARRAY['wc -l file のスペースと数字の位置、パースで泣く', 'ファイル名も一緒に出力されるの邪魔、< file で回避', '行末に改行ないと1行少なくカウントされる罠']
WHERE slug = 'wc' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- while文
UPDATE entries SET
  angel_title = '条件ループ', angel_notes = ARRAY['条件が真の間ループ継続', 'read と組み合わせてファイル読み込み', 'while :; do ... done で無限ループ'],
  sarcastic_title = 'ループの罠', sarcastic_notes = ARRAY['while read line; do ... done < file ←パイプじゃダメな理由', 'while true より while :; の方がPOSIX的', '無限ループ作って Ctrl+C 連打した経験']
WHERE slug = 'while' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- xargs
UPDATE entries SET
  angel_title = '標準入力からコマンド実行', angel_notes = ARRAY['-I {} で引数の位置を指定', '-P で並列実行数を指定', 'find と組み合わせてよく使う'],
  sarcastic_title = '引数変換の魔術', sarcastic_notes = ARRAY['find -exec より xargs の方が速い、けど空白で死ぬ', '-0 オプションと find -print0 のセット、忘れると地獄', '-P でパラレル実行できるの、知らない人多い']
WHERE slug = 'xargs' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- ===========================================
-- JAVASCRIPT (49件)
-- ===========================================

-- Array.filter()
UPDATE entries SET
  angel_title = '条件抽出の定番', angel_notes = ARRAY['truthyな値を返す要素だけが残る', 'Boolean関数を渡すとfalsyな値を除去', 'findとの違い：filterは配列、findは単一値'],
  sarcastic_title = '条件抽出の刃', sarcastic_notes = ARRAY['filter(Boolean) で falsy 除去できるの、知らない人多すぎ', 'filter() と find() 間違えて配列と単一値で型エラー', '「filter の方が読みやすい」と言いながら reduce で書く人']
WHERE slug = 'array-filter' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.flat()
UPDATE entries SET
  angel_title = 'ネスト配列の平坦化', angel_notes = ARRAY['デフォルトは1階層のみ', 'Infinity指定で完全にフラット化', 'flatMapで変換と平坦化を同時に'],
  sarcastic_title = 'ネスト崩壊装置', sarcastic_notes = ARRAY['flat(Infinity) で完全フラット化、怖いけど便利', 'flatMap() の存在を知らずに map().flat() してた時代', 'flat() がないブラウザ対応で polyfill 地獄']
WHERE slug = 'array-flat' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.from()
UPDATE entries SET
  angel_title = '配列への変換', angel_notes = ARRAY['文字列、NodeList、Setなどを配列に', '第2引数でmap処理を同時に実行可能', '配列のコピーにも使える'],
  sarcastic_title = '配列変換の魔法', sarcastic_notes = ARRAY['NodeList を配列にするやつ、[...nodeList] でもできるけど', 'Array.from({length: 5}, (_, i) => i) ←これ初見で理解できる？', 'arguments を配列にする時代、rest parameter 使えば不要']
WHERE slug = 'array-from' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.includes()
UPDATE entries SET
  angel_title = '含有チェックの定番', angel_notes = ARRAY['NaNも正しく検出できる', '第2引数で検索開始位置を指定可能', 'オブジェクトの比較は参照で行われる'],
  sarcastic_title = '含有チェッカー', sarcastic_notes = ARRAY['indexOf() !== -1 って書いてる人、includes() の存在知ってる？', 'NaN を includes() で見つけられるの、indexOf() との違い', 'オブジェクトの includes()、参照比較だから同じ値でも false']
WHERE slug = 'array-includes' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.indexOf()
UPDATE entries SET
  angel_title = '要素位置の検索', angel_notes = ARRAY['見つからない場合は-1を返す', '第2引数で検索開始位置を指定可能', 'includesの方がシンプルな場合も'],
  sarcastic_title = '位置検索の古参', sarcastic_notes = ARRAY['indexOf() !== -1 はもう古い、includes() 使え', 'NaN が見つからない indexOf() の罠', '配列の indexOf とは別に String.prototype.indexOf もある']
WHERE slug = 'array-indexof' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.isArray()
UPDATE entries SET
  angel_title = '配列判定の正解', angel_notes = ARRAY['typeofでは配列かどうか判定できない', 'instanceof より確実（iframe対応）', 'nullやundefinedにも安全に使える'],
  sarcastic_title = '配列判定官', sarcastic_notes = ARRAY['typeof [] が "object" 返す JS の闇を救う関数', 'instanceof Array が iframe 跨ぐと壊れる問題を解決', '配列かどうか判定するのにこんな関数が必要な言語']
WHERE slug = 'array-isarray' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.join()
UPDATE entries SET
  angel_title = '配列を文字列に', angel_notes = ARRAY['デフォルトの区切り文字はカンマ', '空文字で連結すると区切りなし', 'nullやundefinedは空文字になる'],
  sarcastic_title = '文字列化の儀式', sarcastic_notes = ARRAY['join() のデフォルトがカンマなの、空文字指定忘れがち', 'null や undefined が "null", "undefined" になる罠', 'split() と join() のペア、文字列操作の定番技']
WHERE slug = 'array-join' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.map()
UPDATE entries SET
  angel_title = '配列変換の基本', angel_notes = ARRAY['元の配列は変更されない（イミュータブル）', 'コールバックの第2引数でインデックスを取得', '空の要素はスキップされる'],
  sarcastic_title = '配列変換の魔術', sarcastic_notes = ARRAY['map() の中で副作用起こす人、forEach() 使えよ', '.map().filter().reduce() チェーン芸、パフォーマンス死ぬぞ', 'return 書き忘れて undefined だらけの配列作った回数']
WHERE slug = 'array-map' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.reverse()
UPDATE entries SET
  angel_title = '配列の反転', angel_notes = ARRAY['元の配列を変更する（破壊的）', 'toReversed() なら非破壊（ES2023）', '文字列の反転にも使える（split+join）'],
  sarcastic_title = '反転の罠', sarcastic_notes = ARRAY['reverse() が破壊的なの忘れて元配列ぶっ壊す', '[...arr].reverse() でコピーしてから反転、定番技', '文字列反転に str.split("").reverse().join("") は定番すぎる']
WHERE slug = 'array-reverse' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.slice()
UPDATE entries SET
  angel_title = '部分配列の抽出', angel_notes = ARRAY['元の配列は変更されない', '負のインデックスで末尾から指定可能', '引数なしで浅いコピーを作成'],
  sarcastic_title = '部分切り出し師', sarcastic_notes = ARRAY['slice() と splice() 間違えて元配列ぶっ壊した経験', '配列コピーに [...arr] か slice() か、宗教戦争', 'slice(-1)[0] で最後の要素取れるの、at(-1) 使えばいいのに']
WHERE slug = 'array-slice' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.sort()
UPDATE entries SET
  angel_title = '配列ソートの注意点', angel_notes = ARRAY['元の配列を変更する（破壊的メソッド）', 'デフォルトは文字列としてソート', '数値ソートは比較関数が必須'],
  sarcastic_title = '破壊的ソートの罠', sarcastic_notes = ARRAY['[10, 2, 1].sort() が [1, 10, 2] になる JS の闇', 'sort() が元配列を変更するの忘れてバグ量産', 'toSorted() 使えばいいのに、まだ sort() でコピーしてから？']
WHERE slug = 'array-sort' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.splice()
UPDATE entries SET
  angel_title = '配列の直接操作', angel_notes = ARRAY['元の配列を変更する（破壊的）', '削除・挿入・置換が1メソッドで可能', '削除された要素が配列として返る'],
  sarcastic_title = '配列手術の危険', sarcastic_notes = ARRAY['splice() の引数の順番、毎回ドキュメント見る', '削除した要素が返るの、元配列が変わるの、両方で混乱', 'slice と splice、名前似すぎ問題']
WHERE slug = 'array-splice' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- アロー関数
UPDATE entries SET
  angel_title = '簡潔な関数記法', angel_notes = ARRAY['this を束縛しない（レキシカルスコープ）', '1つの式なら return 省略可能', 'コールバック関数に最適'],
  sarcastic_title = '矢印の誘惑', sarcastic_notes = ARRAY['アロー関数で this が変わる問題、何回ハマった？', 'オブジェクトリテラル返すのに () 忘れて undefined', '引数1つの時の () 省略、チームで揉める']
WHERE slug = 'arrow-function' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- async/await
UPDATE entries SET
  angel_title = '非同期の同期的記述', angel_notes = ARRAY['Promiseを返す関数の前でawait', 'try-catchでエラーハンドリング', 'トップレベルawaitはES2022から'],
  sarcastic_title = '非同期の救世主', sarcastic_notes = ARRAY['await 付け忘れて Promise オブジェクト直接使って「なんで？」', 'forEach 内で await しても待たない、for...of 使え', 'try-catch ネストしすぎてコールバック地獄の再来']
WHERE slug = 'async-await' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- class (JS)
UPDATE entries SET
  angel_title = 'クラス構文', angel_notes = ARRAY['constructor でインスタンス初期化', 'extends で継承', 'static でクラスメソッド定義'],
  sarcastic_title = 'シンタックスシュガー', sarcastic_notes = ARRAY['class は prototype のシンタックスシュガー、本質は同じ', 'private field の # 記法、見た目が気持ち悪い', 'super() 呼び忘れて this 使えなくてエラー']
WHERE slug = 'class-js' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- console.log()
UPDATE entries SET
  angel_title = 'デバッグの第一歩', angel_notes = ARRAY['複数の値をカンマ区切りで渡せる', 'オブジェクトの中身を確認するのに便利', '本番環境では削除するか適切なロギングに置き換える'],
  sarcastic_title = 'デバッグの王様', sarcastic_notes = ARRAY['本番に console.log 残してリリースした回数、正直に言え', '「console.log デバッグで十分」←debugger 使ったことある？', 'console.log(obj) でオブジェクトの中身が後から変わる罠']
WHERE slug = 'console-log' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- 分割代入
UPDATE entries SET
  angel_title = '分割代入の基本', angel_notes = ARRAY['デフォルト値を設定可能', 'ネストした構造にも対応', '関数の引数で直接分割可能'],
  sarcastic_title = '分割代入の誘惑', sarcastic_notes = ARRAY['const { a: { b: { c } } } = obj ←読めるか？これ', 'デフォルト値の罠、null と undefined で挙動違う', '「分割代入使いこなせる＝JS中級者」って本当？']
WHERE slug = 'destructuring' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- fetch()
UPDATE entries SET
  angel_title = 'HTTP通信の標準', angel_notes = ARRAY['404でもrejectしない（ok プロパティで判定）', 'JSONはresponse.json()で取得', 'AbortControllerでキャンセル可能'],
  sarcastic_title = 'HTTP 通信の新星', sarcastic_notes = ARRAY['404 でも reject しないの、response.ok チェック必須', 'axios 入れる前に fetch で十分か考えろ', 'AbortController でキャンセルできるの、知らない人多い']
WHERE slug = 'fetch' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.find() (JSのfind)
UPDATE entries SET
  angel_title = '要素検索の便利メソッド', angel_notes = ARRAY['見つからない場合はundefinedを返す', '最初にマッチした要素のみ返す', 'インデックスが欲しい場合はfindIndexを使う'],
  sarcastic_title = '要素探索の旅', sarcastic_notes = ARRAY['find() で見つからなくて undefined、== null で判定して事故', 'filter()[0] って書いてる人、find() 使えよ', '「find は最初の1つだけ」を知らずに全部取れると思ってた新人']
WHERE slug = 'find' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- for...of/for...in
UPDATE entries SET
  angel_title = 'モダンなループ', angel_notes = ARRAY['for...of は値を反復、for...in はキーを反復', 'for...of は配列やイテラブルに', 'for...in はオブジェクトのプロパティに'],
  sarcastic_title = 'ループの双子', sarcastic_notes = ARRAY['for...in と for...of 間違えて「値が取れない」', 'for...in で配列反復するな、インデックスが文字列になる', 'for...of で async/await 使えるの、forEach じゃダメ']
WHERE slug = 'for-of-in' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.forEach()
UPDATE entries SET
  angel_title = 'シンプルな反復処理', angel_notes = ARRAY['戻り値は常にundefined', 'breakやcontinueは使えない', '途中で止めたい場合はsome/everyを検討'],
  sarcastic_title = 'ループの誘惑', sarcastic_notes = ARRAY['forEach() で async/await 使って「なぜ待たない？」と絶望', 'return しても何も返らない、それ forEach の仕様だから', 'break したくなったら forEach 使うな、for...of 使え']
WHERE slug = 'foreach' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- import/export
UPDATE entries SET
  angel_title = 'モジュール構文', angel_notes = ARRAY['export default で1つのデフォルトエクスポート', 'export { name } で名前付きエクスポート', 'import { name } from で名前付きインポート'],
  sarcastic_title = 'モジュールの門', sarcastic_notes = ARRAY['default export と named export の使い分け、チームで揉める', 'require と import の混在、CommonJS と ESM の闘い', 'import() で動的インポート、使いどころ難しい']
WHERE slug = 'import-export' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- instanceof
UPDATE entries SET
  angel_title = '型チェック演算子', angel_notes = ARRAY['プロトタイプチェーンを辿って判定', 'プリミティブには使えない', 'iframe 跨ぐと壊れる（Array.isArray 推奨）'],
  sarcastic_title = '型判定の罠', sarcastic_notes = ARRAY['instanceof Array が iframe 跨ぐと false になる闇', 'typeof と instanceof の使い分け、毎回迷う', 'プリミティブに使って false、ラッパーオブジェクトは true']
WHERE slug = 'instanceof' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- JSON.parse()/stringify()
UPDATE entries SET
  angel_title = 'JSONの変換', angel_notes = ARRAY['parseは不正なJSONでSyntaxError', 'stringifyで循環参照はエラー', 'インデントは第3引数で指定'],
  sarcastic_title = 'JSON変換の闘い', sarcastic_notes = ARRAY['循環参照で TypeError、「なんで stringify できない？」', 'undefined と function が消える仕様、知らなかった人多い', 'JSON.parse(JSON.stringify(obj)) でディープコピー、遅いけど']
WHERE slug = 'json-parse' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- let/const/var
UPDATE entries SET
  angel_title = '変数宣言の使い分け', angel_notes = ARRAY['const は再代入不可（オブジェクトの中身は変更可）', 'let はブロックスコープ', 'var は関数スコープ（非推奨）'],
  sarcastic_title = '変数宣言の歴史', sarcastic_notes = ARRAY['var のホイスティング、未だに完全に理解してない', 'const で宣言したオブジェクトの中身変えられるの、紛らわしい', '「全部 const で書け」派 vs 「let 使え」派の戦争']
WHERE slug = 'let-const-var' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- localStorage
UPDATE entries SET
  angel_title = 'ブラウザストレージ', angel_notes = ARRAY['key-value形式で永続保存', '文字列のみ保存可（JSONで対応）', 'sessionStorageはタブを閉じると消える'],
  sarcastic_title = 'ローカル保存の罠', sarcastic_notes = ARRAY['JSON.stringify 忘れてオブジェクトが [object Object] に', '5MB制限、大きいデータ入れようとしてエラー', 'プライベートモードで使えなくてエラー、try-catch 必須']
WHERE slug = 'localstorage' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Null合体演算子
UPDATE entries SET
  angel_title = 'null/undefined のデフォルト値', angel_notes = ARRAY['??はnullとundefinedのみチェック', '||はfalsyな値全てをチェック', '0や空文字を有効値として扱いたい時に'],
  sarcastic_title = '合体の新星', sarcastic_notes = ARRAY['|| と ?? の違い、0 と 空文字 で挙動が変わる', '&&と??の優先順位でパース エラー、() 必須', 'ES2020 で追加、古いブラウザで動かない']
WHERE slug = 'nullish-coalescing' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Object.assign()
UPDATE entries SET
  angel_title = 'オブジェクトのマージ', angel_notes = ARRAY['第1引数のオブジェクトを変更する', '浅いコピーなのでネストに注意', 'スプレッド構文 {...obj} の方が一般的'],
  sarcastic_title = 'オブジェクトマージャー', sarcastic_notes = ARRAY['スプレッド構文 {...obj} 時代に assign 使う理由、ある？', '第1引数が変更されるの忘れて元オブジェクト壊す', '浅いコピーだから、ネストしたオブジェクトは参照のまま']
WHERE slug = 'object-assign' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Object.freeze()
UPDATE entries SET
  angel_title = 'オブジェクトの凍結', angel_notes = ARRAY['プロパティの追加・削除・変更を禁止', '浅い凍結なのでネストは凍結されない', 'strict modeでないとエラーにならない'],
  sarcastic_title = '凍結の魔法', sarcastic_notes = ARRAY['浅い凍結だから、ネストは普通に変更できちゃう', 'strict mode じゃないとエラーにもならず黙って失敗', 'Immutable.js 使えばいいのに freeze で頑張る人']
WHERE slug = 'object-freeze' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Object.keys()/values()/entries()
UPDATE entries SET
  angel_title = 'オブジェクトの列挙', angel_notes = ARRAY['keys()はキー、values()は値、entries()はペア', '列挙可能なプロパティのみ', 'Symbolキーは含まれない'],
  sarcastic_title = 'オブジェクト分解セット', sarcastic_notes = ARRAY['for...in で十分なのに Object.keys().forEach() する人', 'ES2017 で values/entries 追加、IE 対応で使えなかった時代', 'Object.fromEntries() で逆変換、知ってる人少ない']
WHERE slug = 'object-keys' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- オプショナルチェーン
UPDATE entries SET
  angel_title = '安全なプロパティアクセス', angel_notes = ARRAY['?.でnull/undefinedをスキップ', 'メソッド呼び出しにも使える ?.()','配列アクセスにも ?.[]'],
  sarcastic_title = 'チェーンの救世主', sarcastic_notes = ARRAY['a && a.b && a.b.c 時代の終わり、ありがとう ?.', '?.() でメソッド呼び出し、知らない人多い', 'ES2020 で追加、古いブラウザ対応で使えなかった悲しみ']
WHERE slug = 'optional-chaining' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- process.cwd()
UPDATE entries SET
  angel_title = 'カレントディレクトリ取得', angel_notes = ARRAY['Node.jsでプロセスの作業ディレクトリを取得', '__dirname との違いに注意', 'process.chdir()で変更可能'],
  sarcastic_title = 'Node.js の現在地', sarcastic_notes = ARRAY['__dirname と process.cwd() の違い、説明できる？', 'ESM で __dirname 使えなくて import.meta.url', 'どこから実行するかで結果が変わる、テストで地獄']
WHERE slug = 'process-cwd' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Promise
UPDATE entries SET
  angel_title = '非同期処理の基本', angel_notes = ARRAY['3つの状態：pending, fulfilled, rejected', 'async/awaitの方が読みやすい場合も', 'catchは必ず付ける習慣を'],
  sarcastic_title = '非同期の約束', sarcastic_notes = ARRAY['Promise 地獄から async/await で救われた人、手を挙げて', '.then().then().then() チェーン、結局コールバック地獄と変わらん', 'reject されたのに catch 忘れて UnhandledPromiseRejection']
WHERE slug = 'promise' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Promise.all()
UPDATE entries SET
  angel_title = '並列実行と待機', angel_notes = ARRAY['1つでも失敗すると全体が失敗', '成功時は結果の配列を返す', '独立した複数のAPI呼び出しに最適'],
  sarcastic_title = '全員待機の刑', sarcastic_notes = ARRAY['1つ失敗すると全部失敗、Promise.allSettled 使えよ', '並列実行してると思ったら、実は作成時点で開始してる', '空配列渡すと即座に resolve、これ仕様通りだけど']
WHERE slug = 'promise-all' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Promise.race()
UPDATE entries SET
  angel_title = '最速の結果を取得', angel_notes = ARRAY['最初に完了したPromiseの結果を返す', 'タイムアウト実装に使える', '他のPromiseはキャンセルされない'],
  sarcastic_title = '早い者勝ちレース', sarcastic_notes = ARRAY['タイムアウト実装に使うけど、他の Promise はキャンセルされない', '空配列渡すと永遠に pending、これ罠だろ', 'Promise.any() との違い、reject の扱いが違う']
WHERE slug = 'promise-race' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.reduce()
UPDATE entries SET
  angel_title = '汎用的な集約処理', angel_notes = ARRAY['初期値を省略すると最初の要素が使われる', 'オブジェクトへの変換にも使える', '複雑な処理はforループの方が読みやすい場合も'],
  sarcastic_title = '万能ナイフ症候群', sarcastic_notes = ARRAY['reduce で何でもできるからって何でも reduce で書くな', '初期値なしで空配列渡してエラー、何回やった？', '「reduce 使えばワンライナー」←読めないワンライナーに価値はない']
WHERE slug = 'reduce' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- setInterval()
UPDATE entries SET
  angel_title = '定期実行', angel_notes = ARRAY['clearInterval()で停止', '処理時間が間隔を超えると溜まる', '長時間実行には注意が必要'],
  sarcastic_title = '定期実行の危険', sarcastic_notes = ARRAY['clearInterval 忘れて無限にAPIコールしてサーバー殺した', '処理時間が interval 超えると地獄、setTimeout で再帰した方が安全', 'React で useEffect のクリーンアップ忘れて二重実行']
WHERE slug = 'setinterval' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- setTimeout()
UPDATE entries SET
  angel_title = '遅延実行', angel_notes = ARRAY['clearTimeout()でキャンセル可能', '0msでも即時実行ではない', 'setIntervalより再帰的なsetTimeoutの方が安全'],
  sarcastic_title = '遅延実行の罠', sarcastic_notes = ARRAY['setTimeout(fn, 0) で「すぐ実行」と思ったら違った', 'this の束縛忘れてアロー関数で回避、あるある', 'clearTimeout 忘れてメモリリーク、React でやりがち']
WHERE slug = 'settimeout' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- Array.some()/every()
UPDATE entries SET
  angel_title = '配列の条件チェック', angel_notes = ARRAY['some()は1つでも真ならtrue', 'every()は全て真ならtrue', '短絡評価で効率的'],
  sarcastic_title = '存在と全員チェック', sarcastic_notes = ARRAY['some と every、名前だけじゃ挙動分からんのよ', 'filter().length > 0 って書いてる人、some() 使えば一発', '空配列で every() が true 返すの、直感に反するよね']
WHERE slug = 'some-every' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- スプレッド構文
UPDATE entries SET
  angel_title = '展開構文の活用', angel_notes = ARRAY['配列のコピー：[...arr]', 'オブジェクトのマージ：{...a, ...b}', '関数呼び出し時の引数展開にも'],
  sarcastic_title = '展開の魔法', sarcastic_notes = ARRAY['浅いコピーしかできないの忘れてバグ、あるある', '[...arr1, ...arr2, ...arr3] のパフォーマンス、気にしてる？', 'オブジェクトのスプレッド、後勝ちルール覚えてる？']
WHERE slug = 'spread' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.includes()
UPDATE entries SET
  angel_title = '部分文字列チェック', angel_notes = ARRAY['含まれていればtrue、なければfalse', 'indexOf() !== -1 より直感的', '第2引数で検索開始位置を指定'],
  sarcastic_title = '含有チェックの進化', sarcastic_notes = ARRAY['indexOf() !== -1 から includes() への進化', 'Array.includes() と同じ感覚で使える', 'ES6 で追加、古い環境では polyfill']
WHERE slug = 'string-includes' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.replace()
UPDATE entries SET
  angel_title = '文字列の置換', angel_notes = ARRAY['デフォルトは最初の1つだけ置換', 'gフラグ付き正規表現で全置換', 'replaceAllも使える（ES2021）'],
  sarcastic_title = '置換の罠', sarcastic_notes = ARRAY['最初の1つしか置換されないの忘れて「なんで全部変わらない？」', 'g フラグ付き正規表現か replaceAll か、どっち使う？', '$1, $2 でキャプチャグループ使えるの、知らない人多い']
WHERE slug = 'string-replace' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.split()
UPDATE entries SET
  angel_title = '文字列を配列に', angel_notes = ARRAY['第2引数で分割数の上限を指定', '空文字で分割すると1文字ずつの配列', '正規表現も使用可能'],
  sarcastic_title = '文字列分割師', sarcastic_notes = ARRAY['split("") で1文字ずつ、サロゲートペアで壊れるの知ってる？', '正規表現でスプリット、キャプチャグループあると結果に含まれる罠', 'limit 引数の存在、意外と知られてない']
WHERE slug = 'string-split' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.substring()
UPDATE entries SET
  angel_title = '部分文字列の抽出', angel_notes = ARRAY['負の値は0として扱われる', 'start > end の場合は自動で入れ替え', 'sliceの方が直感的な場合も多い'],
  sarcastic_title = '部分文字列の兄弟', sarcastic_notes = ARRAY['substring, substr, slice の違い、毎回調べる', 'substr は非推奨なの知ってた？', 'substring(5, 2) が substring(2, 5) と同じ動作、は？']
WHERE slug = 'string-substring' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- String.trim()
UPDATE entries SET
  angel_title = '前後の空白除去', angel_notes = ARRAY['改行やタブも除去される', 'trimStart/trimEndで片側だけも可能', '元の文字列は変更されない'],
  sarcastic_title = '空白の処刑人', sarcastic_notes = ARRAY['IE8 で trim() なくて polyfill 地獄だった時代', 'trimStart/trimEnd (trimLeft/trimRight)、どっちが新しい名前？', '全角スペースも消えるの、日本語処理で助かる']
WHERE slug = 'string-trim' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- テンプレートリテラル
UPDATE entries SET
  angel_title = '文字列埋め込み', angel_notes = ARRAY['${} で式を埋め込み', '複数行文字列が書ける', 'タグ付きテンプレートで高度な処理'],
  sarcastic_title = 'バッククォートの革命', sarcastic_notes = ARRAY['"" + var + "" 時代の終わり、ありがとうテンプレートリテラル', 'タグ付きテンプレート、styled-components で見るけど自分で書いたことない', '複数行文字列、インデント崩れに注意']
WHERE slug = 'template-literal' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- this
UPDATE entries SET
  angel_title = 'コンテキスト参照', angel_notes = ARRAY['呼び出し方で変わる（通常関数）', 'アロー関数は定義時のthisを維持', 'bind/call/applyで明示的に指定'],
  sarcastic_title = 'this の迷宮', sarcastic_notes = ARRAY['this の挙動、JS で一番説明しづらい', 'アロー関数で this 束縛問題解決、でも new できなくなる', 'bind(this) 忘れてイベントハンドラで undefined']
WHERE slug = 'this' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- try/catch/finally
UPDATE entries SET
  angel_title = '例外処理', angel_notes = ARRAY['catchでエラーをキャッチ', 'finallyは必ず実行される', 'async関数ではawaitのエラーもキャッチ'],
  sarcastic_title = '例外の盾', sarcastic_notes = ARRAY['catch(e) で e 使わないけど書かないとエラー、ES2019 で解決', 'finally で return すると try の return が上書きされる罠', 'try-catch の範囲、広すぎると何のエラーか分からない']
WHERE slug = 'try-catch-js' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- typeof
UPDATE entries SET
  angel_title = '型の判定', angel_notes = ARRAY['typeof null が "object" は有名なバグ', '配列は "object" になる（Array.isArray推奨）', '未定義変数でもエラーにならない'],
  sarcastic_title = '型判定の罠', sarcastic_notes = ARRAY['typeof null === "object" ←JS の歴史的バグ', 'typeof [] === "object"、配列判定には使えない', 'typeof NaN === "number"、NaN は数値らしい']
WHERE slug = 'typeof' AND language_id = (SELECT id FROM languages WHERE slug = 'javascript');

-- ===========================================
-- PYTHON (53件)
-- ===========================================

-- abs()
UPDATE entries SET
  angel_title = '絶対値の取得', angel_notes = ARRAY['負の数を正に変換', '複素数にも使える（ノルムを返す）', 'float や int に対応'],
  sarcastic_title = '絶対値の番人', sarcastic_notes = ARRAY['複素数の abs() がノルム返すの知ってる人、手を挙げて', '「絶対値って何？」って聞いてきた後輩に数学から教えた日', 'abs(-0.0) が 0.0 なの、当たり前だけど考えると深い']
WHERE slug = 'abs' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- all()
UPDATE entries SET
  angel_title = '全要素チェック', angel_notes = ARRAY['全要素がTrueならTrue', '空のイテラブルはTrue', 'any()と対になる関数'],
  sarcastic_title = '全員合格判定', sarcastic_notes = ARRAY['all([]) が True になる理由、論理学やってないと納得できない', 'any() と all() 逆に覚えてバグ出した回数', '「全部 True なら True」って、空リストは「全部 True」なの？']
WHERE slug = 'all' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- any()
UPDATE entries SET
  angel_title = '存在チェック', angel_notes = ARRAY['1つでもTrueならTrue', '空のイテラブルはFalse', 'all()と対になる関数'],
  sarcastic_title = '存在確認の一撃', sarcastic_notes = ARRAY['any([]) が False なの、all([]) が True なのと対照的', 'if any(x in s for x in items) ←よく使うパターン', 'any と all、どっちがどっちか一瞬迷う']
WHERE slug = 'any' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- *args/**kwargs
UPDATE entries SET
  angel_title = '可変長引数', angel_notes = ARRAY['*argsはタプルとして受け取る', '**kwargsは辞書として受け取る', '引数の順序：位置引数→*args→キーワード引数→**kwargs'],
  sarcastic_title = '引数の魔法', sarcastic_notes = ARRAY['*args と **kwargs の順番間違えてエラー', 'デコレータで使うけど、中身理解してない人多い', '「何でも受け取れる」=「何が来るか分からない」問題']
WHERE slug = 'args-kwargs' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- assert
UPDATE entries SET
  angel_title = 'デバッグ用アサーション', angel_notes = ARRAY['条件がFalseならAssertionError', '本番では-Oオプションで無効化可能', 'ユニットテストでよく使う'],
  sarcastic_title = 'デバッグの味方', sarcastic_notes = ARRAY['assert をバリデーションに使って -O で消える罠', 'assert x, "message" のカンマ忘れてタプルになる', '本番コードに assert 残すべきか議論']
WHERE slug = 'assert' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- class
UPDATE entries SET
  angel_title = 'クラス定義', angel_notes = ARRAY['__init__でインスタンス初期化', 'selfは慣習的な名前', '継承はclass Child(Parent)'],
  sarcastic_title = 'オブジェクト指向の扉', sarcastic_notes = ARRAY['self 忘れて「引数の数が合わない」エラーで30分溶かした', '__init__ と __new__ の違い、聞かれると困る', 'クラス変数とインスタンス変数の違いでバグらせた人、手を挙げて']
WHERE slug = 'class' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- @decorator
UPDATE entries SET
  angel_title = '関数の装飾', angel_notes = ARRAY['関数を受け取って関数を返す関数', '@functools.wrapsで元の関数情報を保持', 'ログ、認証、キャッシュなどに便利'],
  sarcastic_title = 'デコレータの魔法', sarcastic_notes = ARRAY['デコレータ書けるけど、どう動くか説明できない人多い', '@wraps 忘れて関数名が wrapper になる', '複数デコレータの実行順、下から上って知ってた？']
WHERE slug = 'decorator' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- dict()
UPDATE entries SET
  angel_title = '辞書の作成', angel_notes = ARRAY['key=value形式で作成可能', 'リストやタプルから変換可能', 'Python 3.7以降は挿入順を保持'],
  sarcastic_title = '辞書の錬金術', sarcastic_notes = ARRAY['dict(a=1, b=2) と {"a": 1, "b": 2}、どっち派か論争', 'dict.fromkeys() の罠にハマった人、ミュータブルなデフォルト値で', '空の辞書を dict() で作る人、{} でいいのに']
WHERE slug = 'dict' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- dict.get()
UPDATE entries SET
  angel_title = '安全な値取得', angel_notes = ARRAY['キーがなくてもKeyErrorにならない', 'デフォルト値を指定可能', 'dict[key]より安全'],
  sarcastic_title = '安全な辞書アクセス', sarcastic_notes = ARRAY['dict[key] で KeyError 出して「get() 使えよ」と言われた回数', 'デフォルト値に [] 渡して「あれ、同じリストが...」←それ毎回新しいから大丈夫', 'setdefault() との違い、毎回ドキュメント見る']
WHERE slug = 'dict-get' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- dict.items()
UPDATE entries SET
  angel_title = 'キーと値のペア取得', angel_notes = ARRAY['for k, v in dict.items() が定番', 'ビューオブジェクトを返す', 'リスト化するならlist()で囲む'],
  sarcastic_title = '辞書の分解', sarcastic_notes = ARRAY['for k, v in dict.items() は定番、for k in dict でキーだけ取れるのに', '.items() 呼んでから list() で囲む、Python 2 時代の名残？', 'dict_items オブジェクト、直接使えるけどインデックスアクセスできない']
WHERE slug = 'dict-items' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- dict.keys()
UPDATE entries SET
  angel_title = 'キー一覧の取得', angel_notes = ARRAY['ビューオブジェクトを返す', 'for k in dict と同じ結果', '集合演算が可能'],
  sarcastic_title = 'キーの取得', sarcastic_notes = ARRAY['for k in dict でキー取れるのに .keys() 書く人', 'Python 3 でリストじゃなくなった、list() で囲む一手間', '.keys() は省略可能、でも明示的に書く派と書かない派の戦争']
WHERE slug = 'dict-keys' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- dict.update()
UPDATE entries SET
  angel_title = '辞書のマージ', angel_notes = ARRAY['元の辞書を変更する', 'Python 3.9から | 演算子も使える', '同じキーは後から来た値で上書き'],
  sarcastic_title = '辞書マージ職人', sarcastic_notes = ARRAY['Python 3.9 から | 演算子でマージできるの、知ってる？', 'update() は破壊的、元の辞書変わるの忘れがち', '{**dict1, **dict2} でマージしてたのが懐かしい']
WHERE slug = 'dict-update' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- dict.values()
UPDATE entries SET
  angel_title = '値一覧の取得', angel_notes = ARRAY['ビューオブジェクトを返す', '重複した値も全て含まれる', '集合演算には使えない（hashableでないため）'],
  sarcastic_title = '値の取得', sarcastic_notes = ARRAY['Object.keys().map(k => obj[k]) って書いてた JS から来ると楽', 'values() の結果は順序保証される（Python 3.7+）', '重複した値があっても全部返す、set() で消すなら']
WHERE slug = 'dict-values' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- enumerate()
UPDATE entries SET
  angel_title = 'インデックス付き反復', angel_notes = ARRAY['for i, v in enumerate(list) でインデックスと値', 'start引数でインデックス開始値を変更', 'range(len(list))より Pythonic'],
  sarcastic_title = 'インデックス配達員', sarcastic_notes = ARRAY['for i in range(len(list)) 書いてる人、これ使えって何回言った', 'start=1 オプションの存在を知って「もっと早く教えてよ」', '「enumurateだっけ？enumerateだっけ？」←毎回スペル間違える']
WHERE slug = 'enumerate' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- f-string
UPDATE entries SET
  angel_title = 'フォーマット済み文字列', angel_notes = ARRAY['f"..."で変数を直接埋め込み', '式も書ける：f"{x + y}"', '書式指定：f"{value:.2f}"'],
  sarcastic_title = 'フォーマットの革命', sarcastic_notes = ARRAY['.format() 時代にまだ戻りたい人いる？', 'f-string の中で辞書アクセス、クォート混乱する', '= 付けると変数名と値両方出る、f"{x=}" ←デバッグ最高']
WHERE slug = 'f-string' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- filter()
UPDATE entries SET
  angel_title = '条件フィルタリング', angel_notes = ARRAY['条件を満たす要素のイテレータを返す', 'filter(None, list)でfalsyを除去', 'リスト内包表記の方がPythonic'],
  sarcastic_title = '条件フィルター', sarcastic_notes = ARRAY['filter(None, list) でFalsyな値を除去できるの、知ってる？', 'リスト内包表記の方が読みやすいって言われて存在意義を問う', 'filter() も map() もイテレータ返すの、Python 3 の罠']
WHERE slug = 'filter' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- getattr()
UPDATE entries SET
  angel_title = '属性の動的取得', angel_notes = ARRAY['文字列で属性名を指定して取得', 'デフォルト値を指定可能', 'hasattr()と組み合わせて使う'],
  sarcastic_title = '属性の動的アクセス', sarcastic_notes = ARRAY['getattr(obj, attr) と obj.attr の使い分け', 'デフォルト値なしで AttributeError、try-except か hasattr 必須', 'メタプログラミングの入口、使いすぎると可読性死ぬ']
WHERE slug = 'getattr' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- global
UPDATE entries SET
  angel_title = 'グローバル変数宣言', angel_notes = ARRAY['関数内でグローバル変数を変更する時に必要', '参照だけならglobal不要', 'できるだけ使わない方が良い'],
  sarcastic_title = 'グローバルの闇', sarcastic_notes = ARRAY['global 使いまくるコード、保守できない', '関数内で変数代入したら local になるの忘れて UnboundLocalError', 'global より引数と戻り値で渡せ、って何回言われた']
WHERE slug = 'global' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- hasattr()
UPDATE entries SET
  angel_title = '属性存在チェック', angel_notes = ARRAY['属性があればTrue', 'getattr()のエラー回避に', 'プロパティでも動作する'],
  sarcastic_title = '属性チェッカー', sarcastic_notes = ARRAY['hasattr() の中で getattr() が呼ばれて副作用起きる罠', 'EAFP vs LBYL 論争、hasattr 使うか try-except 使うか', 'hasattr(obj, "__call__") で callable チェック、callable() 使えよ']
WHERE slug = 'hasattr' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- import
UPDATE entries SET
  angel_title = 'モジュール読み込み', angel_notes = ARRAY['from module import name で特定の名前をインポート', 'as で別名を付けられる', '相対インポートは from . import で'],
  sarcastic_title = 'モジュール召喚術', sarcastic_notes = ARRAY['循環インポートで ImportError、設計見直せってこと', 'from module import * って書いて怒られた経験', '__all__ の存在を知った時「なるほど」と思った']
WHERE slug = 'import' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- __init__()
UPDATE entries SET
  angel_title = 'コンストラクタ', angel_notes = ARRAY['インスタンス生成時に自動で呼ばれる', 'selfは生成されたインスタンス', '戻り値はNone（暗黙）'],
  sarcastic_title = '初期化の儀式', sarcastic_notes = ARRAY['__init__ と __new__ の違い、説明求められると困る', 'self 書き忘れて属性がクラス変数になる罠', '__init__ で return しようとして怒られる']
WHERE slug = 'init' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- input()
UPDATE entries SET
  angel_title = '標準入力の取得', angel_notes = ARRAY['常に文字列を返す', 'プロンプトを引数で指定可能', '数値が欲しい時はint()やfloat()で変換'],
  sarcastic_title = '標準入力の門番', sarcastic_notes = ARRAY['int(input()) でエラーになって「なんで？」って顔してた過去', '「数字を入力してください」→ユーザー「abc」→プログラム「💀」', 'input() の戻り値が常に str なの、何年経っても忘れるよね']
WHERE slug = 'input' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- isinstance()
UPDATE entries SET
  angel_title = '型チェック', angel_notes = ARRAY['type()より柔軟（継承も考慮）', 'タプルで複数型を指定可能', 'ABCでの型チェックにも使える'],
  sarcastic_title = '型判定の正解', sarcastic_notes = ARRAY['if type(x) == int より isinstance 使えって何回言われた？', 'isinstance(True, int) が True な Python の闘', 'ダックタイピングの国で型チェックするの、野暮？']
WHERE slug = 'isinstance' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- lambda
UPDATE entries SET
  angel_title = '無名関数', angel_notes = ARRAY['1行の簡単な関数を定義', 'sorted()のkey引数に便利', '複雑な処理はdefで定義した方が良い'],
  sarcastic_title = '無名関数の誘惑', sarcastic_notes = ARRAY['lambda 使いすぎてコードが読めなくなった経験', 'sorted(data, key=lambda x: (x[1], x[0])) ←何度書いたか', '「lambda って何？」を説明するの、意外と難しい']
WHERE slug = 'lambda' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- len()
UPDATE entries SET
  angel_title = '長さの取得', angel_notes = ARRAY['リスト、文字列、辞書など多くの型に対応', '__len__メソッドを呼ぶ', 'O(1)で取得できる'],
  sarcastic_title = '長さ測定士', sarcastic_notes = ARRAY['if len(list) > 0 って書く人、if list で済むの知ってる？', 'len(list) == 0 と not list、どっちが Pythonic か論争、終わりなき戦い', '「リストの長さを取得」←それ、コメントに書く必要ある？']
WHERE slug = 'len' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- list()
UPDATE entries SET
  angel_title = 'リストの作成・変換', angel_notes = ARRAY['イテラブルをリストに変換', 'list(range(10))で連番リスト', '空リストは[]の方が一般的'],
  sarcastic_title = 'リスト錬成術', sarcastic_notes = ARRAY['list(range(10)) って書く人、[*range(10)] の方がモダンだよ', 'list("abc") が ["a", "b", "c"] になるの、便利だけど初見殺し', '空リストを list() で作る人、[] でいいのに']
WHERE slug = 'list' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- list.append()
UPDATE entries SET
  angel_title = '要素の追加', angel_notes = ARRAY['リストの末尾に要素を追加', '戻り値はNone', 'extend()は複数要素を追加'],
  sarcastic_title = 'リスト追加の基本', sarcastic_notes = ARRAY['list.append(x) が None 返すの、a = list.append(x) で「あれ？」', 'extend() と append() の違い、append([1,2]) でネストして泣く', '毎回 append() するより内包表記の方が速いって知ってた？']
WHERE slug = 'list-append' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- リスト内包表記
UPDATE entries SET
  angel_title = 'Pythonicなリスト生成', angel_notes = ARRAY['[x for x in iterable] の形式', '条件付き: [x for x in iterable if condition]', 'ネストも可能だが読みにくくなりがち'],
  sarcastic_title = '内包表記の誘惑', sarcastic_notes = ARRAY['3重ネストの内包表記、書いた本人も読めない', 'map/filter より Pythonic だと言われるけど、結局好み', '[x for x in range(10) if x % 2 == 0] ←条件後置、最初は違和感']
WHERE slug = 'list-comprehension' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- list.extend()
UPDATE entries SET
  angel_title = '複数要素の追加', angel_notes = ARRAY['イテラブルの全要素を追加', '戻り値はNone', 'list += other_list と同じ'],
  sarcastic_title = 'リスト拡張術', sarcastic_notes = ARRAY['list += other_list と extend() 同じなの、どっち使う派？', 'extend() に文字列渡すと1文字ずつ追加される罠', 'append() と extend() 間違えて無限ネストしたリスト']
WHERE slug = 'list-extend' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- list.insert()
UPDATE entries SET
  angel_title = '位置指定で挿入', angel_notes = ARRAY['指定インデックスに要素を挿入', '戻り値はNone', 'O(n)なので頻繁な使用は避ける'],
  sarcastic_title = 'リスト挿入職人', sarcastic_notes = ARRAY['insert(0, x) は O(n)、頻繁にやるなら deque 使え', 'insert() も None 返すの、append() と同じ罠', 'スライスで挿入 list[i:i] = [x] できるの知ってる人少ない']
WHERE slug = 'list-insert' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- list.pop()
UPDATE entries SET
  angel_title = '要素の取り出し', angel_notes = ARRAY['末尾の要素を削除して返す', 'インデックス指定で任意の位置から', 'pop(0)はO(n)、dequeの方が効率的'],
  sarcastic_title = '要素取り出し師', sarcastic_notes = ARRAY['pop(0) は O(n) だから deque 使えって言われた時の衝撃', '空リストで pop() して IndexError、チェックしろよ俺', 'pop() の戻り値を無視して捨てるだけなら del 使えば？']
WHERE slug = 'list-pop' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- list.remove()
UPDATE entries SET
  angel_title = '値で要素削除', angel_notes = ARRAY['最初に見つかった要素を削除', '値が存在しないとValueError', '戻り値はNone'],
  sarcastic_title = '値による削除', sarcastic_notes = ARRAY['remove() は最初の1つだけ消す、全部消したいならループ', '存在しない値で ValueError、in で確認してから呼ぶ面倒さ', 'del list[index] と remove(value)、どっち使うか毎回迷う']
WHERE slug = 'list-remove' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- map()
UPDATE entries SET
  angel_title = '要素の変換', angel_notes = ARRAY['各要素に関数を適用', 'イテレータを返す（list()で変換）', 'リスト内包表記の方がPythonic'],
  sarcastic_title = '変換工場', sarcastic_notes = ARRAY['list(map(int, input().split())) 競プロ勢の常套句', 'map() 使うよりリスト内包表記の方がPythonicって言われた時の顔', 'map() がイテレータ返すの忘れて何回もハマる']
WHERE slug = 'map' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- max()/min()
UPDATE entries SET
  angel_title = '最大・最小値の取得', angel_notes = ARRAY['イテラブルから最大/最小を取得', 'key引数でカスタム比較', 'default引数で空イテラブル対策'],
  sarcastic_title = '最大最小決定戦', sarcastic_notes = ARRAY['空のシーケンスで ValueError、default引数知らなかった頃の俺', 'key=len で最長の文字列取れるの、地味に便利', 'max(a, b, c) と max([a, b, c])、どっちでもいいのに悩む']
WHERE slug = 'max-min' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- nonlocal
UPDATE entries SET
  angel_title = '外側のスコープの変数参照', angel_notes = ARRAY['クロージャ内で外側の変数を変更', 'グローバルではなく外側の関数スコープ', 'Python 3で追加'],
  sarcastic_title = 'スコープの魔法', sarcastic_notes = ARRAY['nonlocal と global の違い、説明求められると困る', 'クロージャで外の変数変えたい時だけ使う', 'nonlocal 使わないと UnboundLocalError、でも滅多に使わない']
WHERE slug = 'nonlocal' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- open()
UPDATE entries SET
  angel_title = 'ファイルを開く', angel_notes = ARRAY['with文と組み合わせるのが基本', 'mode: r(読込), w(書込), a(追記)', 'encoding="utf-8"を明示的に指定推奨'],
  sarcastic_title = 'ファイルの門番', sarcastic_notes = ARRAY['with を使わずに f.close() 忘れてリソースリーク', 'encoding="utf-8" つけ忘れて Windows で文字化け祭り', '「r」「w」「a」の違い、何回ドキュメント見た？']
WHERE slug = 'open' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- os.getcwd()
UPDATE entries SET
  angel_title = 'カレントディレクトリ取得', angel_notes = ARRAY['現在の作業ディレクトリを返す', 'os.chdir()で変更可能', 'pathlibならPath.cwd()'],
  sarcastic_title = '現在地確認', sarcastic_notes = ARRAY['os.getcwd() と __file__ の違い、スクリプトの場所 vs 実行場所', 'pathlib.Path.cwd() の方がモダン', 'os モジュール、使う前に import 忘れる']
WHERE slug = 'os-getcwd' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- pathlib.Path
UPDATE entries SET
  angel_title = 'モダンなパス操作', angel_notes = ARRAY['/ 演算子でパスを結合', '.read_text()/.write_text() で簡単に読み書き', 'os.path より直感的'],
  sarcastic_title = 'パス操作の革命', sarcastic_notes = ARRAY['os.path.join() 時代の終わり、Path / "dir" / "file" 最高', '.exists() .is_file() .is_dir() 直感的すぎる', 'str(path) で文字列に戻せるの、古いAPIとの互換性']
WHERE slug = 'pathlib' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- print()
UPDATE entries SET
  angel_title = '出力の基本', angel_notes = ARRAY['sep引数で区切り文字を変更できる', 'end引数で末尾の改行を制御できる', 'file引数でファイルに出力可能'],
  sarcastic_title = 'デバッグの王様', sarcastic_notes = ARRAY['「printデバッグで十分」と言い張る人、一生debugger覚えない', '本番にprint文残してリリースした回数、正直に言ってみ？', '「ここまで来た」「ここも来た」「なんで来ない」←お前のコード']
WHERE slug = 'print' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- raise
UPDATE entries SET
  angel_title = '例外を発生させる', angel_notes = ARRAY['raise Exception("message") で例外送出', 'raise from で例外チェーン', 'raise だけで現在の例外を再送出'],
  sarcastic_title = '例外の発火', sarcastic_notes = ARRAY['raise Exception() と raise Exception の違い、括弧いる？', 'raise from None で例外チェーン切れるの知ってた？', 'カスタム例外作るか標準例外使うか、毎回迷う']
WHERE slug = 'raise' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- range()
UPDATE entries SET
  angel_title = '連番生成', angel_notes = ARRAY['range(stop) で0からstop-1まで', 'range(start, stop, step) でカスタマイズ', 'list(range())でリスト化'],
  sarcastic_title = '数列生成機', sarcastic_notes = ARRAY['for i in range(len(list)) ←お前 enumerate 知らないの？', 'range(0, 10, 1) って全部デフォルト値だけど、わざわざ書く派？', 'range(10, 0, -1) の結果、毎回試してから使うよね、正直に']
WHERE slug = 'range' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- round()
UPDATE entries SET
  angel_title = '四捨五入', angel_notes = ARRAY['round(x, n) でn桁に丸める', '銀行家の丸め（偶数丸め）を使用', '浮動小数点の誤差に注意'],
  sarcastic_title = '四捨五入の罠', sarcastic_notes = ARRAY['round(2.5) が 2 になる銀行家の丸め、最初バグだと思った', 'round(2.675, 2) が 2.67 になる浮動小数点の闇', '「四捨五入したいだけなのに...」なぜこんなに難しいのか']
WHERE slug = 'round' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- setattr()
UPDATE entries SET
  angel_title = '属性の動的設定', angel_notes = ARRAY['文字列で属性名を指定して設定', 'getattr()と対になる', '動的にオブジェクトを構築する時に'],
  sarcastic_title = '属性の動的設定', sarcastic_notes = ARRAY['setattr(obj, attr, val) と obj.attr = val の使い分け', 'メタプログラミングで使うけど、普段は使わない', 'delattr() もあるの知ってた？']
WHERE slug = 'setattr' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- sorted()
UPDATE entries SET
  angel_title = 'ソート済みリスト取得', angel_notes = ARRAY['元のリストを変更しない', 'key引数でソートキーを指定', 'reverse=Trueで降順'],
  sarcastic_title = 'ソート職人', sarcastic_notes = ARRAY['list.sort() と sorted() の違い、何回調べ直した？', 'key=lambda x: x[1] ってよく書くけど、itemgetter 使った方が速いよ', 'reverse=True を忘れて昇順のまま提出したレポート']
WHERE slug = 'sorted' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- str.join()
UPDATE entries SET
  angel_title = '文字列の結合', angel_notes = ARRAY['区切り文字.join(リスト) の形式', 'リストの要素は全て文字列である必要', '"".join(list)で区切りなし結合'],
  sarcastic_title = '文字列結合の逆転劇', sarcastic_notes = ARRAY['list.join(sep) じゃなくて sep.join(list) な理由、未だに納得してない', '", ".join(list) で数値リストがエラー、str変換忘れ', '空文字で join して「あれ、区切りがない」って言ってた過去']
WHERE slug = 'str-join' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- str.replace()
UPDATE entries SET
  angel_title = '文字列の置換', angel_notes = ARRAY['元の文字列は変更されない', '第3引数で置換回数を制限', '正規表現はre.sub()を使う'],
  sarcastic_title = '文字列置換師', sarcastic_notes = ARRAY['replace() は新しい文字列を返す、元は変わらない←これ忘れがち', '連続 replace() でチェーンするの、re.sub 使えって言われた', 'replace("", "x") で各文字の間に挿入できるの、知ってた？']
WHERE slug = 'str-replace' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- str.split()
UPDATE entries SET
  angel_title = '文字列の分割', angel_notes = ARRAY['引数なしで空白文字で分割', '第2引数で分割回数を制限', 'rsplit()で右から分割'],
  sarcastic_title = '文字列分割職人', sarcastic_notes = ARRAY['split() と split(" ") の違いで1時間溶かした経験', '「カンマ区切りなのに split() だけでいけた」←連続スペースの挙動', 'maxsplit 引数の存在を知らずに自前で実装してた']
WHERE slug = 'str-split' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- str.strip()
UPDATE entries SET
  angel_title = '前後の空白除去', angel_notes = ARRAY['改行やタブも含めた空白を除去', '引数で除去する文字を指定可能', 'lstrip()/rstrip()で片側だけ'],
  sarcastic_title = '空白の掃除人', sarcastic_notes = ARRAY['strip() で改行も消えるの、最初知らなかった', 'strip("abc") が「a、b、cのどれか」を消すの、直感に反する', 'lstrip、rstrip、strip の使い分け、正直面倒']
WHERE slug = 'str-strip' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- sum()
UPDATE entries SET
  angel_title = '合計値の計算', angel_notes = ARRAY['イテラブルの要素を合計', 'start引数で初期値を指定', '文字列の結合には使えない'],
  sarcastic_title = '合計計算機', sarcastic_notes = ARRAY['sum(list, []) でリストを平坦化できるけど、やらない方がいい', 'start引数の存在を知った時「え、そんなのあったの？」', 'sum() に文字列渡してエラー、"".join() 使えってこと']
WHERE slug = 'sum' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- try/except
UPDATE entries SET
  angel_title = '例外処理', angel_notes = ARRAY['exceptで特定の例外をキャッチ', 'elseは例外が発生しなかった場合', 'finallyは必ず実行される'],
  sarcastic_title = '例外処理の盾', sarcastic_notes = ARRAY['except: で全部キャッチして「なぜ動かない？」と1時間', 'except Exception as e: print(e) ←ログ取れよ、消えるぞ', '「Pokemon Exception Handling」←全部キャッチするなって話']
WHERE slug = 'try-except' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- 型ヒント
UPDATE entries SET
  angel_title = '静的型付け風の記述', angel_notes = ARRAY['def func(x: int) -> str: の形式', 'mypyで型チェック可能', '実行時には強制されない'],
  sarcastic_title = '型の自己申告', sarcastic_notes = ARRAY['型ヒント書いても実行時にチェックされないの、知ってた？', 'mypy 通すために Union やら Optional やら大変', 'Python に型ヒント、動的型付けの良さどこ行った']
WHERE slug = 'type-hints' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- with
UPDATE entries SET
  angel_title = 'コンテキストマネージャー', angel_notes = ARRAY['ファイルは自動でクローズ', '__enter__/__exit__を実装したオブジェクトに', '複数のコンテキストをカンマで繋げる'],
  sarcastic_title = 'コンテキストマネージャーの扉', sarcastic_notes = ARRAY['with 使わずに f.close() 忘れてファイルロック地獄', '__enter__ と __exit__ 自作したことある人、手を挙げて', 'contextlib.contextmanager 使えばもっと楽なのに']
WHERE slug = 'with' AND language_id = (SELECT id FROM languages WHERE slug = 'python');

-- zip()
UPDATE entries SET
  angel_title = '並列イテレーション', angel_notes = ARRAY['複数のイテラブルを並列に反復', '最短のイテラブルに合わせる', 'zip_longest()で最長に合わせる'],
  sarcastic_title = '並列イテレーション', sarcastic_notes = ARRAY['zip() が短い方に合わせるの忘れてデータ消えた経験', 'zip(*list) でアンパックできるの、何年目で知った？', 'zip_longest の存在を知らずに自前実装してた過去']
WHERE slug = 'zip' AND language_id = (SELECT id FROM languages WHERE slug = 'python');
