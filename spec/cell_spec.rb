require 'rspec'
require './lib/ship'
require './lib/cell'

RSpec.describe Cell do

  it 'is an instance of cell' do
    cell = Cell.new("B4")
    expect(cell). to be_instance_of(Cell)
  end

end
