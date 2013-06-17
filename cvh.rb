require 'gosu'
require_relative 'settings'
require_relative 'carnivore'
require_relative 'herbivore'
require_relative 'plant'


class SimWindow < Gosu::Window
  def initialize
    super Sim::Width, Sim::Height, Sim::Fullscreen
    self.caption = "Carnivore vs Herbivore Simulator"

    @background_image = Gosu::Image.new(self, "media/stone_rocky_surface_texture.jpg", true)
    
    $plants = Array.new
    @herbies = Array.new
    @carnies = Array.new
    initialize_plants
    initialize_herbies
    initialize_carnies
    @info_bar = Gosu::Image::from_text(self, "Herbivores: #{@herbies.size}  Carnivores: #{@carnies.size} ", "Courier New Bold", 32, 16, Sim::Width, :left) 
  end
  
  def update
    @herbies.each { |h| h.simulate_tick }
    @carnies.each { |c| c.simulate_tick }
    remove_starved_and_old_animals!
  end

  def remove_starved_and_old_animals!
    @herbies.reject! do |h|
      h.age > Herbi::Max_Age || h.hunger > Herbi::Max_Hunger
    end
  end
  
  def draw
    # Stretch background to fit screen size
    bg_x_factor = Sim::Width.to_f / @background_image.width.to_f
    bg_y_factor = Sim::Height.to_f / @background_image.height.to_f
    @background_image.draw(0, 0, 0, bg_x_factor, bg_y_factor)
    @info_bar.draw(10, 10, ZOrder::Info_Bar)

    $plants.each { |h| h.draw }
    @herbies.each { |h| h.draw }
    @carnies.each { |h| h.draw }
    
  end

  def initialize_plants
    20.times do
      $plants << Plant.new(self)
      $plants.last.warp( rand(Sim::Width), rand(Sim::Height) )
      $plants.last.draw
    end
  end

  def initialize_herbies
    32.times do
      @herbies << Herbivore.new(self)
      @herbies.last.warp( rand(Sim::Width), rand(Sim::Height) )
    end
  end

  def initialize_carnies
    
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end


window = SimWindow.new

window.show

