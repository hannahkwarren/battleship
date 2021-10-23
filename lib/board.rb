require_relative "cell"
require_relative "ship"

class Board

  attr_reader :cells

  def initialize
    @cells = {
      "A1" => cell_1 = Cell.new("A1"),
      "A2" => cell_2 = Cell.new("A2"),
      "A3" => cell_3 = Cell.new("A3"),
      "A4" => cell_4 = Cell.new("A4"),
      "B1" => cell_5 = Cell.new("B1"),
      "B2" => cell_6 = Cell.new("B2"),
      "B3" => cell_7 = Cell.new("B3"),
      "B4" => cell_8 = Cell.new("B4"),
      "C1" => cell_9 = Cell.new("C1"),
      "C2" => cell_10 = Cell.new("C2"),
      "C3" => cell_11 = Cell.new("C3"),
      "C4" => cell_12 = Cell.new("C4"),
      "D1" => cell_13 = Cell.new("D1"),
      "D2" => cell_14 = Cell.new("D2"),
      "D3" => cell_15 = Cell.new("D3"),
      "D4" => cell_16 = Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
    @cells.key?(coordinate)
  end

  def coordinates_with_same_letter?(ship, coordinates)
    letters = coordinates.map do |letter|
      letter[0]
    end
    return letters.uniq.count == 1
  end

  def consecutive_coordinate_nums?(ship, coordinates)
    possible_nums_arrays = []
    possible_nums = (1..4).each_cons(ship.length) do |num|
      possible_nums_arrays << num
    end
    coordinate_numbers_array = coordinates.map do |coord|
      coord.split(//)
      coord[1].to_i
    end
    possible_nums_arrays.include?(coordinate_numbers_array)
  end

  def consecutive_coordinate_letters?(ship, coordinates)
    possible_letters_arrays = []
    possible_letters = ("A".."D").each_cons(ship.length) do |letter|
      possible_letters_arrays << letter
    end
    coordinate_letters_array = coordinates.map do |coord|
      coord.split(//)
      coord[0]
    end
    possible_letters_arrays.include?(coordinate_letters_array)
  end

  def coordinates_with_same_nums?(ship, coordinates)
    numbers = coordinates.map do |number|
      number[1]
    end
    return numbers.uniq.size == 1
  end

  def valid_placement?(ship, coordinates)
    if coordinates.all? {|coord| valid_coordinate?(coord)} && ship.length == coordinates.length
      if coordinates.all? {|coord| @cells[coord].empty?}
        if coordinates_with_same_letter?(ship, coordinates) && consecutive_coordinate_nums?(ship, coordinates)
          return true
        elsif consecutive_coordinate_letters?(ship, coordinates) && coordinates_with_same_nums?(ship, coordinates)
          return true
        end
      end
    end
    return false
  end

  def place(ship, coordinates)
    coordinates.each do |coord|
      @cells[coord].place_ship(ship)
    end
  end

  def render(show_ships = false)
    #for each cell on board, print the rendering (w/o S)
    rows = @cells.values.map {|val| val.render(show_ships)}
    joined = rows.join
    return "  1 2 3 4 \n" + "A #{joined[0]}" + " " + "#{joined[1]}" + " " + "#{joined[2]}" + " " + "#{joined[3]} \n" + "B #{joined[4]}" + " " + "#{joined[5]}" + " " + "#{joined[6]}" + " " + "#{joined[7]} \n" + "C #{joined[8]}" + " " + "#{joined[9]}" + " " + "#{joined[10]}" + " " + "#{joined[11]} \n" + "D #{joined[12]}" + " " + "#{joined[13]}" + " " + "#{joined[14]}" + " " + "#{joined[15]} \n"
  end
end
