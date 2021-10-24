# require 'play'
# require 'board'
# require 'cell'
# require 'ship'

class Turn

  attr_reader :play, :player_shot, :computer_shot

  def initialize
    @play = Play.new
    @player_shot = player_shot
    @computer_shot = computer_shot
  end

  def start_turn
    puts "=============COMPUTER BOARD============="
    puts @play.computer_board.render
    puts "==============PLAYER BOARD=============="
    require "pry"; binding.pry
    puts @play.player_board.render(true)
  end

  def player_turn
    prompt = "Enter the coordinate for your shot:"
    puts prompt

    @player_shot = [gets.chomp]

    @player_shot.each do |shot|
      loop do
        if @play.player_board.valid_coordinate?(shot) == false
          puts "Please enter a valid coordinate:"
        elsif @play.player_board.valid_coordinate?(shot)
          @play.player_board.cells[shot].fire_upon
          break
        end
      end
    end
  end

  def computer_turn
    previous_shots = [] # collects all computer shots

    @computer_shot = [@play.computer_board.cells.keys.sample]

    @computer_shot.each do |shot|
      loop do
        if @play.computer_board.valid_coordinate?(shot) == false
          # make another guess
        elsif @play.computer_board.valid_coordinate?(shot)
          if previous_shots.include?(shot)
            # make another guess
          elsif previous_shots.include?(shot) == false
            previous_shots << shot
            @play.computer_board.cells[shot].fire_upon
            break
          end
        end
      end
    end
  end
  #there's no hit, miss, sunk in the coordinate

  # def
  #
  # end
end
