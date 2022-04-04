require 'dxruby'
require_relative 'color' #色用
require_relative 'window' #表示用
require_relative 'player' #player用
require_relative 'item' #落下物用


def hit(player, bomb) #当たり判定
    diffx = player.centerx - bomb.centerx
    diffy = player.centery - bomb.centery

    if (diffx > -20) and (diffx < 20) and (diffy > -20) and (diffy < 20)
        return true
    else
        return false
   end
end

player = Player.new(BackWindow::WINDOW_WIDTH/2,BackWindow::SKYLINE-100) #player生成
backwindow = BackWindow.new #画面を区切るwindow生成

#落下物の個数指定
VIRUSS = 3 
VACCINES = 2

viruss = []
VIRUSS.times do
    viruss << Virus.new
end

vaccines = []
VACCINES.times do
    vaccines << Vaccine.new
end

score = 0 #score初期化

Window.loop do
    player.move

    viruss.each do |virus|
        virus.drop
    end

    vaccines.each do |vaccine|
        vaccine.drop
    end

    backwindow.draw
    player.draw

    viruss.each do |virus|
        virus.draw
    end

    vaccines.each do |vaccine|
        vaccine.draw
    end

    vaccines.each do |vaccine|
        if hit(player, vaccine) #点数加算処理
            score = score + vaccine.get_score
            vaccine.reset
        end
    end
    
    viruss.each do |virus|
        if hit(player, virus) #衝突処理
            backwindow.game_over(backwindow, player)
        end
    end

    backwindow.write_char( 50, 400, "あなたの得点は#{score}点", Color::WHITE)

    break if Input.key_push?(K_ESCAPE)
end
