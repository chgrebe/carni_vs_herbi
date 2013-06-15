require_relative 'settings.rb'

class Plant
	def initialize(window)
		@window = window
		@tiles = Gosu::Image::load_tiles(window, "media/carrot_animated.png", 40, 40, false)
		@x = @y = 0.0
		@age
	end

	def warp(x, y)
		@x, @y = x, y
	end

	def draw
		current_tile = Gosu::milliseconds / 1000 % @tiles.size
		@tiles[current_tile].draw(@x, @y, ZOrder::Plants, 0.5, 0.5)
	end
end
