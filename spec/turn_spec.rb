require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'
require './lib/play'

RSpec.describe Turn do

  before(:each) do
    @play = Play.new
    @turn = Turn.new(@play)
  end

  it 'exists' do
    expect(@turn).to be_instance_of(Turn)
  end

  describe 'it has attributes' do
    xit '#computer_shot' do
      @play.computer_board = Board.new
      @play.player_board = Board.new
      @play.computer_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
      @play.player_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
      # @play.set_up_game
      @turn.start_turn
      @turn.player_turn
      @turn.computer_turn
      possible_shots = @play.player_board.cells.values.select {|cell| cell.fired_upon? == false}
      computer_shot = possible_shots.sample
      computer_shot.fire_upon
      expect(@turn.computer_shot.fired_upon?).to eq(true)
    end

    xit '#player_shot' do
    end

    xit '#has_results' do
    end
  end
end
