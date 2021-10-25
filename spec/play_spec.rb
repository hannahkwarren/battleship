require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/play'

RSpec.describe Play do
  before(:each) do
    @play = Play.new
    @computer_board = Board.new
    @player_board = Board.new
    @computer_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
    @player_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
  end

  it 'exists' do
    expect(@play).to be_instance_of(Play)
  end

  it 'has attributes' do
    expect(@computer_board).to be_instance_of(Board)
    expect(@player_board).to be_instance_of(Board)
    expect(@computer_ships.class).to be(Array)
    expect(@player_ships.class).to be(Array)
  end

  it 'has the same size computer_board and player_board' do
    expect(@computer_board.cells.keys).to eq(["A1", "A2", "A3", "A4", "B1", "B2",
    "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"])
    expect(@computer_board.cells.keys).to eq(@player_board.cells.keys)
  end
end
