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

end
