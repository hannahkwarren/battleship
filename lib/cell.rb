class Cell

  attr_reader :coordinate, :occupied
  attr_accessor :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_counter = 0
    @occupied = occupied
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

  def render(show_ship = false)

    if @fired_counter == 0
      if show_ship = true && @ship != nil
        "S"
      else
        "."
      end
    else #fire_counter > 0
      if @ship == nil
        "M"
      elsif @ship != nil
        if @ship.sunk? == false
          "H"
        else
          "X"
        end
      end
    end
  end

end
