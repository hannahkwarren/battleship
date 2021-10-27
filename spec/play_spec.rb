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
    expect(@computer_board.cells.count).to eq(@player_board.cells.count)
  end

  it 'has a process' do
    @turn = Turn.new(self)
    expect(@turn).to be_instance_of(Turn)
  end
end
