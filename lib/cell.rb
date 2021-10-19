class Cell

  attr_reader :coordinate
  attr_accessor :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_counter = 0
    # @render = {"nothing" => ".",
    #             "hit" => "H",
    #             "miss" => "M",
    #             "sunk" => "X",
    #             "ship" => "S"}
end

  def empty?
    if ship == nil
      true
    else
      false
    end
  end

  def place_ship(new_ship)
    @ship = new_ship
  end

  def fired_upon?
    if @fired_counter == 0
      false
      # @render.key("nothing")
    else
      true
    end
  end

  def fire_upon
    if @ship != nil
      ship.hit
    end
    @fired_counter += 1
  end

  def render
    if @fired_counter == 0
      "."
    elsif @fired_counter > 0
      "M"
    end
  end

end
