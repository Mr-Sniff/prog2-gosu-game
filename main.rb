require 'gosu'

class Window < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Tutorial Game"
    @projectile = Projectile.new
  end
  
  def update
    @projectile.update
  end
  
  def draw
    @projectile.draw
  end
end

class Projectile
  def initialize
    @x = 640/2
    @y = 480/2
    @spd = 5
    @move_x = 0
    @move_y = 0
  end

  def update
    move
  end

  def draw
    angle = Gosu.milliseconds / 20
    layers = 15
    layers.times do |i|
      mult = (layers-i).to_f/layers
      brightness = i*30
      col = Gosu::Color.new(255, brightness*0.5, brightness, 255)
      Gosu.translate(0, -i*5) do
        Gosu.rotate(angle, @x, @y) do
            Gosu.draw_triangle(@x, @y - 100*mult, col, 
                              @x + 87*mult, @y + 50*mult, col, 
                              @x - 87*mult, @y + 50*mult, col)
        end
      end
    end
  end

  def move
    @move_x -= @spd if Gosu.button_down?(Gosu::KB_A)
    @move_x += @spd if Gosu.button_down?(Gosu::KB_D)
    @move_y -= @spd if Gosu.button_down?(Gosu::KB_W)
    @move_y += @spd if Gosu.button_down?(Gosu::KB_S)

    @move_x *= 0.7
    @move_y *= 0.7

    @x += @move_x
    @y += @move_y
  end
end

Window.new.show
