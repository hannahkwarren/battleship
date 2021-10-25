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

  xit 'generates random_computer_placements' do
    expect(@play.random_computer_placements).to eq(true)
    #need to ask at our project checkin about a way to test
    # that the placed cells have a ship object
  end

  xit 'inputs player_placements' do
    #need to ask at checkin about a way to verify
    # that placed cells have a ship object
    # @play.player_placements
    # expect(@player_board.cells.empty? == false).to eq()
  end



end
