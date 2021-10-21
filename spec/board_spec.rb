require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it 'exists' do
    expect(@board).to be_instance_of(Board)
  end

  xit 'board has cells' do
    expect(@board.cells).to be(@cells)
  end
  #   {
  #   "A1" => setup.fetch("A1"),
  #   "A2" => cell_2 = Cell.new("A2"),
  #   "A3" => cell_3 = Cell.new("A3"),
  #   "A4" => cell_4 = Cell.new("A4"),
  #   "B1" => cell_5 = Cell.new("B1"),
  #   "B2" => cell_6 = Cell.new("B2"),
  #   "B3" => cell_7 = Cell.new("B3"),
  #   "B4" => cell_8 = Cell.new("B4"),
  #   "C1" => cell_9 = Cell.new("C1"),
  #   "C2" => cell_10 = Cell.new("C2"),
  #   "C3" => cell_11 = Cell.new("C3"),
  #   "C4" => cell_12 = Cell.new("C4"),
  #   "D1" => cell_13 = Cell.new("D1"),
  #   "D2" => cell_14 = Cell.new("D2"),
  #   "D3" => cell_15 = Cell.new("D3"),
  #   "D4" => cell_16 = Cell.new("D4")
  # })
  # end

  it 'valid coordinates?' do
    expect(@board.valid_coordinate?("A1")).to eq(true)
    expect(@board.valid_coordinate?("D4")).to eq(true)
    expect(@board.valid_coordinate?("A5")).to eq(false)
    expect(@board.valid_coordinate?("E1")).to eq(false)
    expect(@board.valid_coordinate?("A22")).to eq(false)
  end

  it "valid placement? ship length" do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
  end

  it "valid placement? consecutive coordinates" do
    pry
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["A3", "A2", "A1"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to eq(false)
  end

end
