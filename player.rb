require_relative 'stacker.rb'
require_relative 'trail.rb'

class Player < Stacker
  def initialize
    super
    @spd = 5
    @move_x = 0
    @move_y = 0
    @facing = 0
  end

  def update
    move
  end

  def draw
    super
  end

  def angle
    @facing
  end
  
  def shape(mult, col)
    size = 20+(mult*40)
    Gosu.draw_rect(@x - size/2, @y - size/2, size, size, col)
  end

  def color(i)
    hue = (i * 20 + Gosu.milliseconds / 7 + Math.sin(Gosu.milliseconds/100)*2.5) % 360
    Gosu::Color.from_hsv(hue, 5, 0.9)
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

    if Math.hypot(@move_x, @move_y) > 0.5
      @facing = Gosu.angle(0, 0, @move_x, @move_y)
    end
  end
end
