-- 017_devil_notes_bash.sql
-- Bash 悪魔のノート（39件）
-- 本物の皮肉、開発者あるある、★★★★★レベル

-- echo
UPDATE entries SET sarcastic_title = '出力の原始', sarcastic_notes = ARRAY['echo "$var" と echo $var の違いで1日溶かした経験', '-n と -e のオプション、どっちがどっちか毎回忘れる', 'printf 使えばいいのに echo で頑張る人'] WHERE slug = 'echo' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- printf
UPDATE entries SET sarcastic_title = '書式の達人', sarcastic_notes = ARRAY['C言語出身者「やっとまともな出力関数」', 'echo で済むのに printf 使ってマウント取る人', '改行入れ忘れて出力がくっつく、毎回やる'] WHERE slug = 'printf' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- read
UPDATE entries SET sarcastic_title = '入力待ちの番人', sarcastic_notes = ARRAY['パイプから read するとサブシェルで変数消える罠', 'IFS いじり忘れてスペース区切りで分割されて泣く', '-r オプション忘れてバックスラッシュが消える'] WHERE slug = 'read' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- cd
UPDATE entries SET sarcastic_title = '移動の基本', sarcastic_notes = ARRAY['cd 失敗してもスクリプト続行、set -e 付けてなかった悲劇', 'cd - で戻れるの知らない人、まだいる', 'CDPATH 設定したら混乱して結局戻した'] WHERE slug = 'cd' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- ls
UPDATE entries SET sarcastic_title = '一覧表示の王道', sarcastic_notes = ARRAY['ls の結果をパースするな、find 使え←これ何回言った？', '-la 以外のオプション知らない人が多すぎる', '--color=auto が効かない環境でパニック'] WHERE slug = 'ls' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- cat
UPDATE entries SET sarcastic_title = '連結と表示', sarcastic_notes = ARRAY['cat file | grep pattern ←UUOC(Useless Use of Cat)の代表', 'cat << EOF でヒアドキュメント、インデント崩れて泣く', '大きいファイルを cat して端末固まった経験'] WHERE slug = 'cat' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- grep
UPDATE entries SET sarcastic_title = '検索の覇王', sarcastic_notes = ARRAY['grep -r . で再帰検索してバイナリファイルにヒットする地獄', 'egrep, fgrep が非推奨になったの知ってる？', '正規表現で検索したいのか固定文字列か、-F オプション忘れがち'] WHERE slug = 'grep' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- find
UPDATE entries SET sarcastic_title = '探索の魔術師', sarcastic_notes = ARRAY['-exec {} \\; と -exec {} + の違い、説明できる？', 'find . -name "*.txt" のクォート忘れてシェル展開される罠', '-delete オプション、-name より先に書いて全削除した伝説'] WHERE slug = 'find' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- sed
UPDATE entries SET sarcastic_title = 'ストリームの魔法使い', sarcastic_notes = ARRAY['macOS と Linux で -i の挙動違う問題、何人犠牲になった？', 's/foo/bar/g の g 忘れて「1個しか置換されない」', '複数行置換したいけど sed じゃ無理、perl か awk 使え'] WHERE slug = 'sed' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- awk
UPDATE entries SET sarcastic_title = '万能テキスト処理機', sarcastic_notes = ARRAY['awk で何でもできるけど、その awk スクリプト誰が保守する？', 'print $1 だけ知ってる人、awk の1%も使いこなせてない', 'gawk と mawk で挙動違って本番で爆発'] WHERE slug = 'awk' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- sort
UPDATE entries SET sarcastic_title = 'ソートの職人', sarcastic_notes = ARRAY['-n 忘れて 2 が 10 より後に来て「なんで？」', 'ロケール依存でソート順変わって CI で落ちる', '-u オプションで重複除去できるの、uniq 使わなくていい'] WHERE slug = 'sort' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- uniq
UPDATE entries SET sarcastic_title = '重複削除の条件付き', sarcastic_notes = ARRAY['sort してから uniq しないと連続した重複しか消えない', '「なんで重複消えない？」←sort 忘れてるだろ', '-c オプションでカウントできるの、意外と便利'] WHERE slug = 'uniq' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- wc
UPDATE entries SET sarcastic_title = 'カウントの魔術', sarcastic_notes = ARRAY['wc -l file のスペースと数字の位置、パースで泣く', 'ファイル名も一緒に出力されるの邪魔、< file で回避', '行末に改行ないと1行少なくカウントされる罠'] WHERE slug = 'wc' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- head
UPDATE entries SET sarcastic_title = '先頭取得係', sarcastic_notes = ARRAY['head -n -5 で末尾5行以外を取得、知らない人多い', 'デフォルト10行、-n 忘れて全部見えると思ってた', 'tail と組み合わせて中間部分取得、面倒くさい'] WHERE slug = 'head' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- tail
UPDATE entries SET sarcastic_title = 'ログ監視の友', sarcastic_notes = ARRAY['tail -f で監視してるけど、ファイルローテーションで死ぬ', '-F オプションの存在を知らずに -f --retry で頑張ってた', 'tail -n +2 でヘッダースキップ、毎回構文調べる'] WHERE slug = 'tail' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- cp
UPDATE entries SET sarcastic_title = 'コピーの基本', sarcastic_notes = ARRAY['cp -r でシンボリックリンクがどうなるか知ってる？', '-p オプション忘れてパーミッション変わって事故', 'cp file{,.bak} っていうブレース展開、知ってる？'] WHERE slug = 'cp' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- mv
UPDATE entries SET sarcastic_title = '移動と改名', sarcastic_notes = ARRAY['mv で上書きして泣いた回数、-i オプション付けろ', '同一ファイルシステム内なら一瞬、違うと遅い', 'mv *.txt dir/ で dir がなかったらどうなる？'] WHERE slug = 'mv' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- rm
UPDATE entries SET sarcastic_title = '削除の恐怖', sarcastic_notes = ARRAY['rm -rf / 防止のため --no-preserve-root がデフォルト', '変数展開失敗して rm -rf $dir/ で / 消した伝説', 'ゴミ箱なんてものは Unix にはない、消したら終わり'] WHERE slug = 'rm' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- mkdir
UPDATE entries SET sarcastic_title = 'ディレクトリ作成', sarcastic_notes = ARRAY['-p なしで親ディレクトリないとエラー、毎回忘れる', 'mkdir -p は既存でもエラーにならない、冪等性の鑑', 'umask の影響でパーミッション変わるの忘れがち'] WHERE slug = 'mkdir' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- rmdir
UPDATE entries SET sarcastic_title = '空ディレクトリ専用', sarcastic_notes = ARRAY['空じゃないとエラー、rm -r 使えって話', 'rmdir の存在意義、安全のためなんだろうけど', '-p オプションで親も消せるの、危険だけど'] WHERE slug = 'rmdir' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- touch
UPDATE entries SET sarcastic_title = 'タイムスタンプ職人', sarcastic_notes = ARRAY['空ファイル作成に使うけど、本来はタイムスタンプ更新用', '>> file で空ファイル作れるの知ってる？', 'touch で更新日時偽装、バックアップシステム騙すやつ'] WHERE slug = 'touch' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- chmod
UPDATE entries SET sarcastic_title = '権限管理の番人', sarcastic_notes = ARRAY['777 設定する人、セキュリティって知ってる？', 'u+x, g+x, o+x の違い、ちゃんと理解してる？', '+x だけだとumaskの影響受けるの知ってた？'] WHERE slug = 'chmod' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- chown
UPDATE entries SET sarcastic_title = '所有者変更の権力', sarcastic_notes = ARRAY['sudo chown -R 間違えてシステムファイルの所有者変えた', 'user:group の : 忘れて user だけ変更される', '再帰的に変更して戻せなくなった経験'] WHERE slug = 'chown' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- tar
UPDATE entries SET sarcastic_title = 'アーカイブの古参', sarcastic_notes = ARRAY['tar のオプション順番、毎回調べる -czvf なのか -zcvf なのか', 'tar bomb 作って展開先汚染した経験', 'tar.gz と tgz、同じなのに両方使う人'] WHERE slug = 'tar' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- curl
UPDATE entries SET sarcastic_title = 'HTTP の万能ナイフ', sarcastic_notes = ARRAY['curl | bash をインストール方法に書く文化、怖くない？', '-s -S -L -f オプション全部付ける呪文', 'wget と curl どっち使う派、宗教戦争'] WHERE slug = 'curl' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- wget
UPDATE entries SET sarcastic_title = 'ダウンロードの定番', sarcastic_notes = ARRAY['curl と wget、機能被ってるのに両方入ってる', '-c で再開できるの知らずに最初からやり直してた', '--spider オプションで存在確認だけ、地味に便利'] WHERE slug = 'wget' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- ssh
UPDATE entries SET sarcastic_title = 'リモートの扉', sarcastic_notes = ARRAY['パスワード認証してる人、鍵認証にしろ2024年だぞ', '~/.ssh/config 書けば楽なのにフル引数打つ人', 'known_hosts 警告出て「yes」連打する人、中間者攻撃って知ってる？'] WHERE slug = 'ssh' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- scp
UPDATE entries SET sarcastic_title = 'リモートコピー', sarcastic_notes = ARRAY['rsync の方が優秀なのにまだ scp 使ってる人', ':の位置間違えてローカルにコロン付きファイル作成', 'sftp に移行しろって言われ始めてるの知ってる？'] WHERE slug = 'scp' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- ps
UPDATE entries SET sarcastic_title = 'プロセス一覧', sarcastic_notes = ARRAY['BSD形式と SysV形式で書式違う、aux と -ef 論争', 'ps aux | grep xxx | grep -v grep ←この呪文', 'pgrep 使えばいいのに ps | grep する人'] WHERE slug = 'ps' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- kill
UPDATE entries SET sarcastic_title = '終了の宣告', sarcastic_notes = ARRAY['kill -9 を最初に使う人、SIGTERM 試してから使え', 'kill してもゾンビになるプロセス、親が wait してない', 'PID 間違えて別プロセス殺した経験'] WHERE slug = 'kill' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- top
UPDATE entries SET sarcastic_title = 'リアルタイム監視', sarcastic_notes = ARRAY['htop 入ってるのに top 使う人、カラフルな方使えよ', '「CPU 100%だ！」←それ、1コアの100%な', 'q で終了するの知らずに Ctrl+C してた'] WHERE slug = 'top' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- df
UPDATE entries SET sarcastic_title = 'ディスク使用量', sarcastic_notes = ARRAY['-h 付けないと読めない数字が出てくる', '100% になってから気づく、監視入れとけ', 'inode 枯渇で df は余裕あるのに書き込めない地獄'] WHERE slug = 'df' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- du
UPDATE entries SET sarcastic_title = 'サイズ調査員', sarcastic_notes = ARRAY['du -sh * して . が一番大きいと分かる虚しさ', 'ncdu 使えばいいのに du で頑張る人', '--max-depth=1 なしで実行して後悔'] WHERE slug = 'du' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- export
UPDATE entries SET sarcastic_title = '環境変数の魔法', sarcastic_notes = ARRAY['export なしで変数定義して「なぜ子プロセスで見えない？」', '.bashrc と .bash_profile どっちに書く論争', 'export PATH=$PATH:xxx を何回も書いて PATH が長大に'] WHERE slug = 'export' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- alias
UPDATE entries SET sarcastic_title = 'ショートカットの魔術', sarcastic_notes = ARRAY['alias 設定したの忘れて「このコマンドの挙動おかしい」', '\\command で alias 無効化できるの知ってる？', 'alias rm="rm -i" 設定して毎回 y 打つ生活'] WHERE slug = 'alias' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- xargs
UPDATE entries SET sarcastic_title = '引数変換の魔術', sarcastic_notes = ARRAY['find -exec より xargs の方が速い、けど空白で死ぬ', '-0 オプションと find -print0 のセット、忘れると地獄', '-P でパラレル実行できるの、知らない人多い'] WHERE slug = 'xargs' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- tee
UPDATE entries SET sarcastic_title = '分岐出力の魔法', sarcastic_notes = ARRAY['sudo でファイル書き込みたい時の sudo tee 技', 'tee /dev/null で出力捨てながらコピー、謎テクニック', '> file と tee file の違い、パイプの途中で使う'] WHERE slug = 'tee' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- test / [ ]
UPDATE entries SET sarcastic_title = '条件判定の古代魔法', sarcastic_notes = ARRAY['[ の後にスペース必須、これで何時間溶かした？', '[[ ]] と [ ] の違い、bash と sh の互換性問題', '-eq, -ne, -lt, -gt 覚えるの面倒、(( )) 使え'] WHERE slug = 'test' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- if文
UPDATE entries SET sarcastic_title = '条件分岐の門', sarcastic_notes = ARRAY['then 忘れてシンタックスエラー、毎回やる', 'fi の綴り、if の逆さま、Algol の伝統らしい', '[[ $var == *pattern* ]] のグロブ、ダブルクォートで囲むと動かない'] WHERE slug = 'if' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');
