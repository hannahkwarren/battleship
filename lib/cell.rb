class Cell

  attr_reader :coordinate
  attr_accessor :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_counter = 0
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


end
