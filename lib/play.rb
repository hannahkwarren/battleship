require_relative 'turn'

class Play

attr_reader :turn
attr_accessor :computer_board, :player_board, :computer_ships, :player_ships

  def initialize
    @computer_board = nil
    @player_board = nil
    @computer_ships = nil
    @player_ships = []
  end

  def start
    loop do
      system "clear"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n" +
          "   ____    _  _____ _____ _     _____ ____  _   _ ___ ____\n" +
          "  | __ )  / ||_   _|_   _| |   | ____/ ___|| | | |_ _|  _  \n" +
          "  |  _   / _|  | |   | | | |   |  _|  ___  | |_| || || |_) |\n" +
          "  | |_) / __|  | |   | | | |___| |___ ___) |  _  || ||  __/\n" +
          "  |____/_/  |  |_|   |_| |_____|_____|____/|_| |_|___|_|\n" +
          "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts ""
      puts "Welcome to BATTLESHIP"
      puts "Enter p to play. Enter q to quit."
      print ">"
      user_response = gets.chomp
      if user_response == "p"

        @computer_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
        # @player_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]

        self.set_up_game
        self.create_custom_ships
        self.random_computer_placements
        self.player_placements
        self.play_process
      elsif user_response == "q"
        puts "Goodbye!"
        break
      else
        puts "Sorry, I didn't get that.
        Please enter p to play or q to quit."
      end
    end
  end

  def set_up_game
    puts "BOARD SIZE: Please enter the number of columns you want in the boards (up to 26):"
    @columns = Integer(gets)
    @computer_board = Board.new(@columns)
    @player_board = Board.new(@columns)
    @computer_board.custom_board_setup
    #create player_board cells the same size as computer board
    @player_board.custom_board_setup
  end

  def create_custom_ships
    puts "Time to create your ships!"
    puts "Remember your ship length maximum is #{@columns}."

      loop do
        puts "Please name your ship:"
        name = gets.chomp
        puts "How long is #{name}?"
        
          loop do
            length = gets.chomp.to_i
            if length > @columns
              puts "Invalid length, please try again:"
            elsif length <= @columns
              ship = Ship.new(name, length)
              @player_ships << ship
              break
            end
          end

        puts "Would you like to create another ship?"
        puts "Enter y for Yes or n for No:"
        print ">"
        user_response = gets.chomp
        if user_response == "n"
          break
        end
      end
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
    puts "I have laid out my ships on the grid. I have two ships: The Cruiser is three cells long, and the Submarine is two cells long."
    puts "You now need to lay out your own #{@player_ships.length} ships."

    @player_ships.each do |item|
      loop do
        puts @player_board.render(true)

        prompt = "Enter #{item.length} comma-separated cells (e.g. 'A1, A2'...) where you want the #{item.name} to go."
        puts prompt

        user_placement = gets.chomp
        placement = user_placement.split(/\s*, \s*/)

        if @player_board.valid_placement?(item, placement) == false
          puts "Those are invalid coordinates, please try again:"
        elsif @player_board.valid_placement?(item, placement)
          @player_board.place(item, placement)
          puts "\nHere's your current board:\n"
          break
        end
      end
    end
    puts @player_board.render(true)
  end

  def game_over?
    @player_ships.all? {|ship| ship.sunk?} || @computer_ships.all? {|ship| ship.sunk?}
  end

  def winner
    if @player_ships.all? {|ship| ship.sunk?}
      return "I won!"
    elsif @computer_ships.all? {|ship| ship.sunk?}
      return "You won!"
    end
  end

  def play_process
    @turn = Turn.new(self)

    while self.game_over? == false
      @turn.start_turn
      @turn.player_turn
      break if self.game_over? == true
      @turn.computer_turn
      break if self.game_over? == true
      @turn.show_results
    end

    puts self.winner
  end

#need to return to the start process
end
