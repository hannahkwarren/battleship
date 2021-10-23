class Play
attr_reader :computer_board, :player_board, :computer_ships, :player_ships
  def initialize
    @computer_board = Board.new
    @player_board = Board.new
    @computer_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
    @player_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
  end


  def start
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    print ">"
    user_response = gets.chomp
      if user_response == "p"
        random_computer_placements
      elsif user_response == "q"
        puts "Goodbye"
      else
        puts "Sorry, I didn't get that.
        Please enter p to play or q to quit."
    end
  end

  def random_computer_placements
    sample = []
     @computer_ships.each do |ship|
       until @computer_board.valid_placement?(ship, sample)
         sample = @computer_board.cells.keys.sample(ship.length)
       end
       @computer_board.place(ship, sample)
       # require "pry"; binding.pry
     end
     return true
  end

  # def player_placements
  #
  # end
  #
  # def set_up_game
  #
  # end
end
