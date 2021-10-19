require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do

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
end
