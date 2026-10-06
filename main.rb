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
  end

  def update

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
end

Window.new.show
