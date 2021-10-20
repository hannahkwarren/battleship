require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
before(:each) do

end

  it 'is an instance of cell' do
    cell = Cell.new("B4")
    expect(cell).to be_instance_of(Cell)
  end

  it 'has a ship' do
    cell = Cell.new("B4")
    expect(cell.ship).to eq(nil)
  end

  it 'is empty' do
    cell = Cell.new("B4")
    expect(cell.empty?).to be(true)
  end

  it 'place a ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    expect(cell.ship).to eq(cruiser)
    expect(cell.empty?).to be(false)
  end

  it 'fire upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    expect(cell.fired_upon?).to be(false)
    cell.fire_upon
    expect(cell.ship.health).to eq(2)
    expect(cell.fired_upon?).to be(true)
  end

  it 'renders for no ship in the cell' do
    cell_1 = Cell.new("B4")
    expect(cell_1.render).to eq(".")
    cell_1.fire_upon
    expect(cell_1.render).to eq("M")
  end

  it 'renders when cell is occupied' do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    expect(cell_2.render(true)).to eq("S")
    cell_2.fire_upon
    expect(cell_2.render).to eq("H")
    expect(cruiser.sunk?).to be(false)
    cruiser.hit
    cruiser.hit
    expect(cruiser.sunk?).to be(true)
    expect(cell_2.render).to eq("X")
  end
end
