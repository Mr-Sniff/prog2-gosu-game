require 'gosu'
require_relative 'player.rb'
require_relative 'stacker.rb'
require_relative 'enemy.rb'

module View
  WIDTH = 640*2
  HEIGHT = 480*2
end

class Window < Gosu::Window
  def initialize
    super View::WIDTH, View::HEIGHT
    self.caption = "Tutorial Game"
    @player = Player.new
    @spawner = Spawner.new
    @bg = Bg.new
  end
  
  def update
    @spawner.update
    @player.update
  end
  
  def draw
    @bg.draw
    @spawner.draw
    @player.draw
  end
end

class Bg
  def draw 
    col = Gosu::Color.new(255, 30, 30, 30)
    Gosu.draw_rect(0, 0, View::WIDTH, View::HEIGHT, col)
  end
end

class Spawner
  def initialize
    @interval = 1000
    @last_spawn = Gosu.milliseconds
    @enemies = []
  end

  def update
    if Gosu.milliseconds > @last_spawn+@interval
      @last_spawn = Gosu.milliseconds
      @enemies << Enemy.new
    end

    @enemies.each {|e| e.update}
    @enemies.reject! {|e| e.dead?}
  end

  def draw
    @enemies.each {|e| e.draw}
  end
end

Window.new.show
