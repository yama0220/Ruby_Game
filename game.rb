class Game
  
  # じゃんけんメソッド
  def janken
    
    player_hand = gets.to_i
    cpu_hand = rand(3)    # rand()で0〜2の数字をランダム取得
    hand_list = ["グー", "チョキ", "パー"]
    
    # 指定の値が入力された時
    if (player_hand == 0) || (player_hand == 1) || (player_hand == 2)
      
      # hand_list内の要素と紐付けて出した手を表示させる
      puts "----------------------------"
      puts "自分： 「#{hand_list[player_hand]}」 を出しました"
      puts "相手： 「#{hand_list[cpu_hand]}」 を出しました"
      puts "----------------------------"
      
      if (player_hand == 0 && cpu_hand == 1) || (player_hand == 1 && cpu_hand == 2) || (player_hand == 2 && cpu_hand == 0)
        puts "******こちらが指を差す側です******"
        @win = "あなた"
        look
      elsif (player_hand == 0 && cpu_hand == 2) || (player_hand == 1 && cpu_hand == 0) || (player_hand == 2 && cpu_hand == 1)
        puts "*****こちらが顔を向ける側です*****"
        @win = "cpu"
        look
      elsif player_hand == cpu_hand
        puts "あいこで、、、"
        return true
      else
        puts "無効な入力です。「0〜2のいずれかを入力してください」"
        return true
      end
    
    # 3(戦わなが押された時)
    elsif player_hand == 3
      puts "ゲームを終了します"
    else
      puts "無効な入力です。"
    end
    
  end
  
  
  # あっち向いてホイメソッド
  def look
    
    puts "あっち向いて、、、"
    puts "「0:上」 「1:右」 「2:下」 「3:左」"
    player_look = gets.to_i
    cpu_look = rand(4)
    look_list = ["上", "右", "下", "左"]
    
    # 指定の値が入力された時
    if (player_look == 0) || (player_look == 1) || (player_look == 2) || (player_look == 3)
      puts "----------------------------"
      puts "ホイ！"
      puts "自分： 「#{look_list[player_look]}」 を向きました"
      puts "相手： 「#{look_list[cpu_look]}」 を向きました"
      puts "----------------------------"
      
      # 向いた方向が一致したかの判定
      if (player_look == cpu_look)
        # じゃんけんの勝者をインスタンス変数に格納して流用
        puts "「 #{@win} 」 の勝ちです！！"
        return false
      else
        puts "*****勝敗がつきませんでした******"
        puts "じゃんけん、、、"
        puts "「0:グー」 「1:チョキ」 「2:パー」 「3:戦わない」"
        return true
      end
    else
      puts "無効な入力です"
    end
    
  end
  
end



# メイン処理
puts "最初はグー、じゃんけん、、、"
puts "「0:グー」 「1:チョキ」 「2:パー」 「3:戦わない」"

# Gameクラスをインスタンス化
game = Game.new
    
# while → falseになるまでループさせる
next_game = true
while next_game
  next_game = game.janken
end
