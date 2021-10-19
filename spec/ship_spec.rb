require './lib/ship'
require 'rspec'

RSpec.describe Ship do
  it 'is an instance of Ship' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser).to be_instance_of(Ship)
  end

  it 'health equals length' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.health).to eq(3)
  end

  it 'cruiser afloat' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.sunk?).to be(false)
  end

  it 'take a hit' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    expect(cruiser.health).to eq(2)
    expect(cruiser.sunk?).to be(false)
    cruiser.hit
    expect(cruiser.health).to eq(1)
    expect(cruiser.sunk?).to be(false)
    cruiser.hit
    expect(cruiser.health).to eq(0)
    expect(cruiser.sunk?).to be(true)
  end
end
