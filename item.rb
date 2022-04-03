class Item
    attr_reader :x, :y

    def initialize #初期化
        @image.set_color_key(Color::WHITE)
        reset
    end
    
    def drop
        @y = @y + @speed_y
        if @y > BackWindow::WINDOW_HEIGHT
            reset
        end
    end

    def reset
        @x = rand(BackWindow::WINDOW_WIDTH) #ランダムの位置に配置
        @y = 0
        @speed_y = rand(10)+1
    end

    def centerx
        return @x + @image.width/2
    end

    def centery
        return @y + @image.heigth/2
    end

    def draw
        Window.draw( @x, @y, @image)
    end
end

class Virus < Item #継承
    def initialize
        @image = Image.load("./img/virus.png")
       super
    end

    def drop
        @x = @x + @speed_x
        super
    end

    def reset
        @speed_x = rand(3) - 1
        super
    end
end

class Vaccine < Item #継承
    def initialize
        @image = Image.load("./img/vaccine.png")
       super
    end

    def get_score
        return 10
    end
end