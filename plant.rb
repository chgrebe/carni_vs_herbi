require_relative 'settings.rb'

class Plant
	attr_accessor :x, :y

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
		draw_angle = Gosu::milliseconds / 5 % 360
		@tiles[0].draw_rot(@x, @y, ZOrder::Plants, draw_angle, 0.5, 0.5, 0.6, 0.6)
	end
end
