require_relative 'stacker.rb'

class Enemy < Stacker
  def initialize
    super 
    @x, @y = random_edge_position

    @spd = 5
    @spawn_time = Gosu.milliseconds
    @lifetime = 10000
    @move_direction = rand(0..360)
    @move_direction = Gosu.angle(@x, @y, rand(0..View::WIDTH), rand(0..View::HEIGHT))
  end

  def dead?
    Gosu.milliseconds > @spawn_time + @lifetime
  end

  def move
    @x += Gosu::offset_x(@move_direction, @spd)
    @y += Gosu::offset_y(@move_direction, @spd)
  end

  def random_edge_position
    margin = 100
    case rand(4)
    when 0 then [rand(-margin..View::WIDTH + 100), -margin]                # top
    when 1 then [rand(-margin..View::WIDTH + 100), View::HEIGHT + margin]  # bottom
    when 2 then [-margin, rand(-margin..View::HEIGHT + 100)]               # left
    else        [View::WIDTH + margin, rand(-margin..View::HEIGHT + margin)]  # right
    end
  end
end
