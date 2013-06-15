require_relative 'settings'

class Herbivore
	Acceleration = 0.8
	#Max_Speed = 15
	Fixed_Turn_Angle = 40
	Random_Turn_Angle = 40
	Image_Scale_X = 0.4
	Image_Scale_Y = 0.4

	def initialize(window)
		@window = window
		@image = Gosu::Image.new(window, "media/Bunny.png", false)
		@x = @y = @vel_x = @vel_y = @angle = 0.0
	end

	def warp(x, y)
		@x, @y = x, y
	end

	def accelerate
		@vel_x += Gosu::offset_x(@angle, Acceleration)
		@vel_y += Gosu::offset_y(@angle, Acceleration)
		# @vel_x = Max_Speed if @vel_x > Max_Speed
		# @vel_y = Max_Speed if @vel_y > Max_Speed
		# @vel_x = - Max_Speed if @vel_x < - Max_Speed
		# @vel_y = - Max_Speed if @vel_y < - Max_Speed
		#puts @vel_y.to_s + "\t" + @vel_x.to_s + "\t" + @angle.to_s
		@vel_x *= 0.8
		@vel_y *= 0.8
	end

	def move
		change_direction
		accelerate
		
		@x += @vel_x
		@y += @vel_y
		@x %= Sim::Width
		@y %= Sim::Height
	end


	def change_direction
		r = rand(100)
		if r > 90
			angle_change = ( Fixed_Turn_Angle + rand(Random_Turn_Angle) )

			if rand(2) == 0
				@angle += angle_change
			else
				@angle -= angle_change 
			end
		end
	end

	def draw
		@image.draw_rot(@x, @y, 1, @angle, 0.5, 0.5, Image_Scale_X, Image_Scale_Y)
	end
end
