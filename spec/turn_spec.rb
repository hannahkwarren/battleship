require './lib/turn'
require './lib/play'
require './lib/board'
require './lib/cell'
require './lib/ship'

RSpec.describe Turn do

  before(:each) do
    @turn = Turn.new
    @play = Play.new
  end

  it 'exists' do
    expect(@turn).to be_instance_of(Turn)
  end

  it '' do
    @player_shot = "A1"
    expect(@turn.player_turn).to eq()
  end

end
