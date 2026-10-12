class Stacker
  def initialize
    @x = View::WIDTH/2
    @y = View::HEIGHT/2
    @time_offset = rand(0..5000)
  end

  def update
    move
  end

  def move

  end

  def draw
    angle = angle()
    layers = 15
    layers.times do |i|
      mult = (layers-i).to_f/layers
      col = color(i)
      Gosu.translate(0, -i*5) do
        Gosu.rotate(angle, @x, @y) do
          shape(mult, col)  
        end
      end
    end
  end

  def color(i)
    brightness = i*15+40
    col = Gosu::Color.new(255, 255, brightness, brightness)
  end

  def shape(mult, col)
    Gosu.draw_triangle(@x, @y - 100*mult, col, 
                        @x + 87*mult, @y + 50*mult, col, 
                        @x - 87*mult, @y + 50*mult, col)
  end

  def angle 
    angle = Gosu.milliseconds / 20 + @time_offset
  end

end


