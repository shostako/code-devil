-- 014_angel_notes_bash.sql
-- Bash 天使のノート（39件）
-- 実用的なTips、ベストプラクティス、注意点

-- echo
UPDATE entries SET angel_title = '出力の基本', angel_notes = ARRAY['-n で改行なしで出力', '-e でエスケープシーケンスを解釈', 'printf の方が移植性が高い'] WHERE slug = 'echo' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- printf
UPDATE entries SET angel_title = '書式付き出力', angel_notes = ARRAY['echoより移植性が高い', '%s, %d, %f などの書式指定子', '改行は自動で入らないので\\nを付ける'] WHERE slug = 'printf' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- read
UPDATE entries SET angel_title = 'ユーザー入力の取得', angel_notes = ARRAY['-p でプロンプトを表示', '-s でパスワード入力（非表示）', '-t でタイムアウトを設定'] WHERE slug = 'read' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- cd
UPDATE entries SET angel_title = 'ディレクトリ移動', angel_notes = ARRAY['cd - で直前のディレクトリに戻る', 'cd ~ でホームに移動', 'CDPATH変数でよく使うパスを設定可能'] WHERE slug = 'cd' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- ls
UPDATE entries SET angel_title = 'ファイル一覧表示', angel_notes = ARRAY['-la で隠しファイル含む詳細表示', '-h でサイズを人間が読みやすい形式に', '-t で更新日時順にソート'] WHERE slug = 'ls' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- cat
UPDATE entries SET angel_title = 'ファイル内容表示', angel_notes = ARRAY['-n で行番号を表示', '複数ファイルを連結して表示', 'ヒアドキュメントと組み合わせてファイル作成'] WHERE slug = 'cat' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- grep
UPDATE entries SET angel_title = 'テキスト検索', angel_notes = ARRAY['-i で大文字小文字を無視', '-r でディレクトリを再帰検索', '-v でマッチしない行を表示'] WHERE slug = 'grep' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- find
UPDATE entries SET angel_title = 'ファイル検索', angel_notes = ARRAY['-name でファイル名検索', '-type f でファイルのみ、-type d でディレクトリのみ', '-exec で見つけたファイルにコマンド実行'] WHERE slug = 'find' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- sed
UPDATE entries SET angel_title = 'ストリームエディタ', angel_notes = ARRAY['-i で直接ファイルを編集（要注意）', 's/old/new/g で全置換', 'macOSでは -i '''' が必要'] WHERE slug = 'sed' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- awk
UPDATE entries SET angel_title = 'テキスト処理の万能ツール', angel_notes = ARRAY['$1, $2... でフィールドアクセス', '-F で区切り文字を指定', 'BEGIN/END で前処理・後処理'] WHERE slug = 'awk' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- sort
UPDATE entries SET angel_title = 'ソート処理', angel_notes = ARRAY['-n で数値としてソート', '-r で降順', '-u で重複を除去（uniq不要）'] WHERE slug = 'sort' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- uniq
UPDATE entries SET angel_title = '重複行の処理', angel_notes = ARRAY['事前にsortが必要（連続した重複のみ検出）', '-c で出現回数をカウント', '-d で重複行のみ表示'] WHERE slug = 'uniq' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- wc
UPDATE entries SET angel_title = '行数・単語数カウント', angel_notes = ARRAY['-l で行数のみ', '-w で単語数のみ', '-c でバイト数、-m で文字数'] WHERE slug = 'wc' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- head
UPDATE entries SET angel_title = '先頭部分の表示', angel_notes = ARRAY['-n 数字 で行数指定', 'デフォルトは10行', '-c でバイト数指定も可能'] WHERE slug = 'head' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- tail
UPDATE entries SET angel_title = '末尾部分の表示', angel_notes = ARRAY['-f でリアルタイム監視（ログに便利）', '-n 数字 で行数指定', '-F でファイルのローテーションに追従'] WHERE slug = 'tail' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- cp
UPDATE entries SET angel_title = 'ファイルコピー', angel_notes = ARRAY['-r でディレクトリを再帰的にコピー', '-p でパーミッションと日時を保持', '-i で上書き確認'] WHERE slug = 'cp' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- mv
UPDATE entries SET angel_title = '移動とリネーム', angel_notes = ARRAY['-i で上書き確認', '-n で既存ファイルを上書きしない', '同一ファイルシステム内なら高速'] WHERE slug = 'mv' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- rm
UPDATE entries SET angel_title = 'ファイル削除', angel_notes = ARRAY['-i で削除確認', '-r でディレクトリを再帰的に削除', 'rm -rf は本当に危険、慎重に'] WHERE slug = 'rm' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- mkdir
UPDATE entries SET angel_title = 'ディレクトリ作成', angel_notes = ARRAY['-p で親ディレクトリも同時に作成', '-p は既存でもエラーにならない', '-m でパーミッションを指定'] WHERE slug = 'mkdir' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- rmdir
UPDATE entries SET angel_title = '空ディレクトリ削除', angel_notes = ARRAY['空でないとエラーになる', '-p で親ディレクトリも削除', '中身ごと消すならrm -r'] WHERE slug = 'rmdir' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- touch
UPDATE entries SET angel_title = 'ファイル作成とタイムスタンプ更新', angel_notes = ARRAY['ファイルが無ければ空ファイル作成', '存在すればタイムスタンプ更新', '-t で特定の日時を指定可能'] WHERE slug = 'touch' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- chmod
UPDATE entries SET angel_title = 'パーミッション変更', angel_notes = ARRAY['755 = rwxr-xr-x（実行可能スクリプト向け）', '644 = rw-r--r--（一般的なファイル向け）', '+x で実行権限を付与'] WHERE slug = 'chmod' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- chown
UPDATE entries SET angel_title = '所有者変更', angel_notes = ARRAY['user:group で所有者とグループを同時に変更', '-R で再帰的に変更', 'root権限が必要な場合が多い'] WHERE slug = 'chown' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- tar
UPDATE entries SET angel_title = 'アーカイブ操作', angel_notes = ARRAY['-czvf で圧縮、-xzvf で展開', '-t で中身を確認（展開せず）', '-C で展開先ディレクトリを指定'] WHERE slug = 'tar' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- curl
UPDATE entries SET angel_title = 'HTTP通信', angel_notes = ARRAY['-o でファイルに保存', '-I でヘッダーのみ取得', '-X POST -d でPOSTリクエスト'] WHERE slug = 'curl' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- wget
UPDATE entries SET angel_title = 'ファイルダウンロード', angel_notes = ARRAY['-O でファイル名を指定', '-c で中断したダウンロードを再開', '-r でサイト全体をダウンロード'] WHERE slug = 'wget' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- ssh
UPDATE entries SET angel_title = 'リモート接続', angel_notes = ARRAY['-i で秘密鍵を指定', '-p でポート番号を指定', '~/.ssh/config で接続設定を管理'] WHERE slug = 'ssh' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- scp
UPDATE entries SET angel_title = 'リモートファイルコピー', angel_notes = ARRAY['-r でディレクトリを再帰的にコピー', '-P でポート番号を指定', 'rsyncの方が効率的な場合も'] WHERE slug = 'scp' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- ps
UPDATE entries SET angel_title = 'プロセス表示', angel_notes = ARRAY['aux で全プロセスを詳細表示', '-ef でも似た結果（SysV形式）', 'grep と組み合わせて特定プロセスを検索'] WHERE slug = 'ps' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- kill
UPDATE entries SET angel_title = 'プロセス終了', angel_notes = ARRAY['デフォルトはSIGTERM（15）', '-9 で強制終了（SIGKILL）', 'killall でプロセス名指定も可能'] WHERE slug = 'kill' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- top
UPDATE entries SET angel_title = 'リアルタイムプロセス監視', angel_notes = ARRAY['q で終了', 'k でプロセスをkill', 'htop の方が使いやすい（要インストール）'] WHERE slug = 'top' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- df
UPDATE entries SET angel_title = 'ディスク使用量', angel_notes = ARRAY['-h で人間が読みやすい形式', '-i でinode使用状況', '特定パスを指定してそのファイルシステムのみ表示'] WHERE slug = 'df' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- du
UPDATE entries SET angel_title = 'ディレクトリサイズ', angel_notes = ARRAY['-h で人間が読みやすい形式', '-s で合計のみ表示', '--max-depth=1 で1階層のみ'] WHERE slug = 'du' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- export
UPDATE entries SET angel_title = '環境変数の設定', angel_notes = ARRAY['子プロセスに変数を継承させる', '~/.bashrc に書けば永続化', 'export VAR=value の形式'] WHERE slug = 'export' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- alias
UPDATE entries SET angel_title = 'コマンドの別名定義', angel_notes = ARRAY['~/.bashrc に書けば永続化', 'unalias で解除', 'バックスラッシュを付けるとalias無効で実行'] WHERE slug = 'alias' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- xargs
UPDATE entries SET angel_title = '標準入力からコマンド実行', angel_notes = ARRAY['-I {} で引数の位置を指定', '-P で並列実行数を指定', 'find と組み合わせてよく使う'] WHERE slug = 'xargs' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- tee
UPDATE entries SET angel_title = '出力の分岐', angel_notes = ARRAY['画面表示とファイル保存を同時に', '-a で追記モード', 'sudo と組み合わせる時に便利'] WHERE slug = 'tee' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- test / [ ]
UPDATE entries SET angel_title = '条件判定', angel_notes = ARRAY['-f でファイル存在確認', '-d でディレクトリ存在確認', '-z で空文字判定、-n で非空判定'] WHERE slug = 'test' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');

-- if文
UPDATE entries SET angel_title = '条件分岐', angel_notes = ARRAY['[[ ]] の方が機能が豊富（Bash拡張）', 'then は改行またはセミコロンの後', 'fiで閉じるのを忘れずに'] WHERE slug = 'if' AND language_id = (SELECT id FROM languages WHERE slug = 'bash');
