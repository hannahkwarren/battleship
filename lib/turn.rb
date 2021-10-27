class Turn

  attr_reader :play,:results, :comp_previous_shots, :player_previous_shots
  attr_accessor :player_shot, :computer_shot

  def initialize(play)
    @computer_shot = computer_shot
    @player_shot = player_shot
    @results = {"." => "nothing",
                "H" => "hit",
                "M" => "miss",
                "X" => "sink",
                "S" => "ship"}
    @play = play
  end

  def start_turn
    puts "=============COMPUTER BOARD============="
    puts @play.computer_board.render
    puts "==============PLAYER BOARD=============="
    puts @play.player_board.render(true)
  end

  def player_turn
    prompt = "Enter the coordinate for your shot:"
    puts prompt

    loop do
      @player_shot = gets.chomp

      if @play.computer_board.valid_coordinate?(@player_shot) == false
        puts "Please enter a valid coordinate:"
      elsif @play.computer_board.valid_coordinate?(@player_shot)
        if @play.computer_board.cells[@player_shot].fired_upon?
          puts "You've already fired upon this cell. Please try again:"
        else
          @play.computer_board.cells[@player_shot].fire_upon
          break
        end
      end
    end
  end

  def computer_turn
    possible_shots = @play.player_board.cells.values.select {|cell| cell.fired_upon? == false}

    @computer_shot = possible_shots.sample #one cell obj

    @computer_shot.fire_upon
  end

  def show_results
    player_turn_result = @play.computer_board.cells[@player_shot].render()

    puts "Your shot on #{@player_shot} was a #{@results[player_turn_result]}."

    puts @play.computer_board.render()

    comp_turn_result = @computer_shot.render

    puts "My shot on #{@computer_shot.coordinate} was a #{@results[comp_turn_result]}."

    puts @play.player_board.render(true)
  end


end
