# require 'play'
# require 'board'
# require 'cell'
# require 'ship'

class Turn

  attr_reader :play, :player_shot, :computer_shot, :results, :comp_previous_shots, :player_previous_shots

  def initialize
    @play = Play.new
    @player_shot = player_shot
    @computer_shot = computer_shot
    @results = {"." => "nothing",
                "H" => "hit",
                "M" => "miss",
                "X" => "sunk",
                "S" => "ship"}
    @player_previous_shots = []
    @comp_previous_shots = []
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

      if @play.player_board.valid_coordinate?(@player_shot) == false
        puts "Please enter a valid coordinate:"
      elsif @play.player_board.valid_coordinate?(@player_shot)
        if @player_previous_shots.include?(@player_shot)
          puts "You've already fired upon this cell. Please try again:"
        else
          @play.player_board.cells[@player_shot].fire_upon
          @player_previous_shots << @player_shot
          break
        end
      end
    end

  end

  def computer_turn

    loop do

      @computer_shot = @play.computer_board.cells.keys.sample

      if @play.computer_board.valid_coordinate?(@computer_shot) && @comp_previous_shots.include?(@computer_shot) == false
        @play.computer_board.cells[@computer_shot].fire_upon
        @comp_previous_shots << @computer_shot
        break
      end
    end
  end

  def show_results
    player_turn_result = @play.player_board.cells[@player_previous_shots.last].render(true)

    puts "Your shot on #{@player_shot} was a #{@results[player_turn_result]}."

    comp_turn_result = @play.player_board.cells[@comp_previous_shots.last].render()

    puts "My shot on #{@computer_shot} was a #{@results[comp_turn_result]}."
  end
end
