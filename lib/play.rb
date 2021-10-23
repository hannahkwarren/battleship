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
        self.set_up_game
      elsif user_response == "q"
        puts "Goodbye!"
      else
        puts "Sorry, I didn't get that.
        Please enter p to play or q to quit."
    end
  end

  def set_up_game
    self.random_computer_placements
    self.player_placements
  end

  def random_computer_placements
    sample = []
     @computer_ships.each do |ship|
       until @computer_board.valid_placement?(ship, sample)
         sample = @computer_board.cells.keys.sample(ship.length)
       end
       @computer_board.place(ship, sample)
     end
  end

  def player_placements
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your own two ships."
    puts "The Cruiser is three cells long, and the Submarine is two cells long."

    @player_ships.each do |item|
      loop do
        puts @player_board.render(true)
        
        prompt = "Enter #{item.length} comma-separated cells (e.g. 'A1') where you want the #{item.name} to go."
        puts prompt

        user_placement = gets.chomp
        placement = user_placement.split(/\s*, \s*/)

        if @player_board.valid_placement?(item, placement)
          @player_board.place(item, placement)
          puts " "
          puts "Here's your current board:"
          puts @player_board.render(true)
          puts " "
          break
        end
      end
    end
  end

end
