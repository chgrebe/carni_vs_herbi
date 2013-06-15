require 'gosu'
require_relative 'settings'
require_relative 'carnivore'
require_relative 'herbivore'
require_relative 'plant'


class SimWindow < Gosu::Window
  def initialize
    super Sim::Width, Sim::Height, false
    self.caption = "Carnivore vs Herbivore Simulator"
    @background_image = Gosu::Image.new(self, "media/stone_rocky_surface_texture.jpg", true)
    @plants = Array.new
    @herbies = Array.new
    @carnies = Array.new()
    initialize_plants
    initialize_herbies
    initialize_carnies
  end
  
  def update
    @herbies.each { |h| h.move }
    @carnies.each { |c| c.move }
  end
  
  def draw
  	@background_image.draw(0, 0, 0)
    @plants.each { |h| h.draw }
    @herbies.each { |h| h.draw }
    @carnies.each { |h| h.draw }
    
  end

  def initialize_plants
    20.times do
    @plants << Plant.new(self)
    @plants.last.warp( rand(Sim::Width), rand(Sim::Height) )
    @plants.last.draw
    end
  end

  def initialize_herbies
    16.times do
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

