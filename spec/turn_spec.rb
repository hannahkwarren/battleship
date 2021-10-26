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
    it '#computer_shot' do
      @play.computer_board = Board.new
      @play.player_board = Board.new
      @play.computer_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
      @play.player_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
      @turn.computer_turn
      possible_shots = @play.player_board.cells.values.select {|cell| cell.fired_upon? == false}
      computer_shot = possible_shots.sample
      computer_shot.fire_upon
      expect(@turn.computer_shot.fired_upon?).to eq(true)
      expect(@turn.computer_shot.class).to be(Cell)
    end

    it '#player_shot' do
      @play.computer_board = Board.new
      @play.player_board = Board.new
      @play.computer_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
      @play.player_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
      player_shot = "A4" #This is test-added user input
      @play.computer_board.cells[player_shot].fire_upon
      expect(@play.computer_board.cells[player_shot].fired_upon?).to eq(true)
      expect(@play.computer_board.cells[player_shot].class).to be(Cell)
    end

    xit '#has_results' do

    end
  end
end
