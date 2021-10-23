require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/play'

RSpec.describe Play do
  before(:each) do
    @play = Play.new
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it 'exists' do
    expect(@play).to be_instance_of(Play)
  end

  it 'has attributes' do
    expect(@play.computer_board.render).to eq("  1 2 3 4 \n" +
                                              "A . . . . \n" +
                                              "B . . . . \n" +
                                              "C . . . . \n" +
                                              "D . . . . \n")
  end

  it 'generates random_computer_placements' do
    expect(@play.random_computer_placements).to eq(true)
  end

  xit 'inputs player_placements' do
    expect(@play.player_placements).to eq()
  end


end
