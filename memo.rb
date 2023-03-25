# CSVファイルを扱うためのライブラリ読み込み
require "csv"

puts "1 → 新規でメモを作成する　/ 2 → 既存のメモを編集する"

# ユーザーの入力値を取得し、数字へ変換
memo_type = gets.to_i

if memo_type == 1
  
  puts "1が入力されました。新規ファイルを作成します。"
  puts "拡張子を除いたファイル名を入力してください。"
  
  # ファイル名の入力
  # chomp → 改行の「¥n」を消すため
  file_name = gets.chomp
  
  puts "メモの内容を入力してください。　※ Ctrl + Dで保存します。"
  
  # メモ内容の入力
  # STDIN → 標準入力のための定数　　readlines → 複数業の読み取り
  memo = STDIN.read.chomp                     
  
  # open → CSV書き込み
  CSV.open("#{file_name}.csv", "w") do |result|
    result << ["#{memo}"]
  end
  
elsif memo_type == 2
  
  puts "2が入力されました。既存のファイルを編集します。"
  puts "拡張子を除いたファイル名を入力してください。"
  
  # ファイル名の入力
  file_name = gets.chomp
  
  # ファイルが存在するかの確認
  if File.exist?("#{file_name}.csv")
    p "ファイルがありました"
    
    puts "-------------------------"
    text = CSV.open("#{file_name}.csv", "r")
    puts text.readlines
    puts "-------------------------"
    puts "このファイルに追記します。"
    puts "メモの内容を入力してください。　※ Ctrl + Dで保存します。"
    puts "-------------------------"
    
    memo = STDIN.read.chomp
    
    CSV.open("#{file_name}.csv", "a") do |result|
      result.puts ["#{memo}"]
    end
    
    puts "-------------------------"
    puts "追記が完了しました。終了します。"
    
  else
    p "ファイルが存在しません"
  end
  
else
  # 1または2以外が押された時
  puts "無効な入力です"
end