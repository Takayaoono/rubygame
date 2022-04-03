class Player
    attr_reader :x, :y
    def initialize(x, y)
        @image = Image.load("./img/man.png")
        @image.set_color_key(Color::WHITE)
        @x = x
        @y = y
        @speed = 3
    end

    def move
        @x += Input.x * @speed
    end
    
    def draw
        Window.draw(@x, @y, @image)
    end
end