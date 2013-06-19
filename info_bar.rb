#encode: UTF-8

class InfoBar
	attr_accessor :x, :y, :text

	def initialize(window, x, y, font_size)
		@x = x
		@y = y
		@window = window
		@font = Gosu::Font.new(@window, "Courier New Bold", font_size)
	end

	def draw(text)
		@font.draw(text, @x, @y, ZOrder::Info_Bar, 1, 1, 0xff33ff33)
	end
	
end