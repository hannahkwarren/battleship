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

  def valid_placement?(ship, coordinates)

    seq_possible = [(1..4).each_cons(ship.length) {|num| p num}]

    coords = coordinates.each do |coord|


    coordinates.select { |coord| coord.start_with?('A')}
    if a_coords.length == ship.length
      a_coords.each_cons
    b_coords = coordinates.select { |coord| coord.start_with?('B')}
    c_coords = coordinates.select { |coord| coord.start_with?('C')}
    d_coords = coordinates.select { |coord| coord.start_with?('D')}

    if coordinates values start with same letter
      then see if numbers match an array in seq_possible

    #if the letters are are all the same, check for range of numbers
    #if numbers are all the same, check for range of letters

    if coordinates.length == ship.length && coordinates.range(1..4)
      true
    else
      false
    end
  end
end
