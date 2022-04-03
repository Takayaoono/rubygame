class BackWindow
    WINDOW_WIDTH =640
    WINDOW_HEIGHT = 480
    SKYLINE = 400

    def initialize
        Window.width = WINDOW_WIDTH
        Window.height = WINDOW_HEIGHT
        @image = Image.new(WINDOW_WIDTH, WINDOW_HEIGHT, Color::SkYBLUE)
        @image.box_fill(0, SKYLINE, WINDOW_WIDTH, WINDOW_HEIGHT, Color::GREEN)
        @font = Font.new(30, "MS Pゴシック",{ :weight=>false, :italic=>true})
    end

    def draw
        Window.draw(0,0,@image)
    end

    def draw_endback
        Window.draw(0,0,@image)
        @image.box_fill( 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, Color::BLACK)

        Window.draw_font( 190, 200, "ゲームオーバー", @font, {:Color=>Color::WHITE})
    end

    def write_char( x, y, char, color)
        Window.draw_font( x, y, char, @font, {:color=>color})
    end

    def game_over(backwindow, player)
        backwindow.draw_endback
        player.draw
        Window.update
        sleep 2
        exit
    end
end
