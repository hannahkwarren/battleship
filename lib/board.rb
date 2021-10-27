require_relative "cell"
require_relative "ship"
require_relative "play"

class Board

  attr_accessor :cells, :columns, :char_map

  def initialize(columns = 4)
    @all_pairs = { 1 => "A",
        2 => "B",
        3 => "C",
        4 => "D",
        5 => "E",
        6 => "F",
        7 => "G",
        8 => "H",
        9 => "I",
        10 => "J",
        11 => "K",
        12 => "L",
        13 => "M",
        14 => "N",
        15 => "O",
        16 => "P",
        17 => "Q",
        18 => "R",
        19 => "S",
        20 => "T",
        21 => "U",
        22 => "V",
        23 => "W",
        24 => "X",
        25 => "Y",
        26 => "Z"
      }
    @cells = {}
    @columns = columns
    @char_map = nil
  end

  def custom_board_setup

    # shorten the all_pairs hash to the correct length
    # per column input
    @char_map = @all_pairs.keep_if {|key| key <= columns}

    #make the cell hash with nested iteration
    @char_map.each_value do |val|
      @char_map.each_key do |key|
        @cells["#{val}" + "#{key}"] = Cell.new("#{val}" + "#{key}")
      end
    end
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
    possible_nums = (1..@columns).each_cons(ship.length) do |num|
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
    possible_letters = ("A"..self.char_map.values.last).each_cons(ship.length) do |letter|
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
    
    column_headers = char_map.keys
    row_headers = char_map.values
    all_renders = ""

    all_renders += "  #{column_headers.join(" ")}\n"
    row_headers.each do |letter|
      letter = letter
      all_renders += letter + " "
      column_headers.each do |number|
        all_renders += self.cells["#{letter}#{number}"].render(show_ships)
        all_renders += " "
      end
      all_renders += "\n"
    end
    return all_renders
  end
end
