
require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @board.custom_board_setup
  end

  it 'exists' do
    expect(@board).to be_instance_of(Board)
  end

  it 'it has cells' do

    expect(@board.respond_to?(:cells)).to be(true)
    expect(@board.cells).to be_a(Hash)
    expect(@board.cells.length).to eq(16)
    expect(@board.cells.values[0]).to be_instance_of(Cell)
  end

  it 'has valid coordinates?' do
    expect(@board.valid_coordinate?("A1")).to eq(true)
    expect(@board.valid_coordinate?("D4")).to eq(true)
    expect(@board.valid_coordinate?("A5")).to eq(false)
    expect(@board.valid_coordinate?("E1")).to eq(false)
    expect(@board.valid_coordinate?("A22")).to eq(false)
  end

  it "has coordinates with same letters" do
    expect(@board.coordinates_with_same_letter?(@submarine, ["A1", "A2"])).to eq(true)
    expect(@board.coordinates_with_same_letter?(@submarine, ["A1", "B2"])).to eq(false)
  end

  it "has consecutive coordinate numbers" do
    expect(@board.consecutive_coordinate_nums?(@submarine, ["A1", "A2"])).to eq(true)
    expect(@board.consecutive_coordinate_nums?(@submarine, ["A1", "A4"])).to eq(false)
    expect(@board.consecutive_coordinate_nums?(@cruiser, ["A1", "A2", "A3"])).to eq(true)
    expect(@board.consecutive_coordinate_nums?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
  end

  it "has consecutive coordinate letters" do
    expect(@board.consecutive_coordinate_letters?(@submarine, ["A1", "A2"])).to eq(false)
    expect(@board.consecutive_coordinate_letters?(@submarine, ["A1", "B1"])).to eq(true)
  end

  it "has coordinates with same numbers" do
    expect(@board.coordinates_with_same_nums?(@submarine, ["A1", "A2"])).to eq(false)
  end

  it "valid placement? ship length" do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
    expect(@board.valid_placement?(@cruiser, ["A2", "A3", "A4"])).to eq(true)
  end

  it "valid placement? consecutive coordinates" do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["A3", "A2", "A1"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["A1", "A1"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to eq(true)
  end

  it "valid placement? valid coordinates" do
    expect(@board.valid_placement?(@cruiser, ["A1", "B2", "BORK"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["C2", "D33"])).to eq(false)
  end

  it "valid placement? diagonals" do
    expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to eq(false)
  end

  it "valid placement? good examples" do
    expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to eq(true)
    expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to eq(true)
  end

  it "place ships" do
    @board.place(@cruiser, ["A1", "A2", "A3"])
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]
    expect(cell_3.ship == cell_2.ship).to eq(true)
  end

  it "prevent overlap" do
    @board.place(@cruiser, ["A1", "A2", "A3"])
    expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to be(false)
    expect(@board.valid_placement?(@submarine, ["B1", "C1"])).to be(true)
  end

  it "render the board" do
    @board.place(@cruiser, ["A1", "A2", "A3"])
    expect(@board.render).to eq("  1 2 3 4\n" +
                                "A . . . . \n" +
                                "B . . . . \n" +
                                "C . . . . \n" +
                                "D . . . . \n")
    expect(@board.render(true)).to eq("  1 2 3 4\n" +
                                "A S S S . \n" +
                                "B . . . . \n" +
                                "C . . . . \n" +
                                "D . . . . \n")
  end

  it "renders the board with different sizes" do
    board2 = Board.new(6)
    # board2.place(@cruiser, ["A1", "A2", "A3"])
    board2.custom_board_setup
    # require "pry"; binding.pry
    expect(board2.render).to eq("  1 2 3 4 5 6\n" +
                                "A . . . . . . \n" +
                                "B . . . . . . \n" +
                                "C . . . . . . \n" +
                                "D . . . . . . \n" +
                                "E . . . . . . \n" +
                                "F . . . . . . \n" )
    expect(board2.render(true)).to eq("  1 2 3 4 5 6\n" +
                                "A . . . . . . \n" +
                                "B . . . . . . \n" +
                                "C . . . . . . \n" +
                                "D . . . . . . \n" +
                                "E . . . . . . \n" +
                                "F . . . . . . \n" )
  end

end
