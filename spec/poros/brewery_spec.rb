require 'rails_helper'

RSpec.describe Brewery do
  it 'creates a brewery poro' do
    brewery_data = {
      id: "10-barrel-brewing-co-denver-denver",
      name: "10 Barrel Brewing Co - Denver",
      brewery_type: "large"
    }
    brewery = Brewery.new(brewery_data)

    expect(brewery.id).to eq('10-barrel-brewing-co-denver-denver')
    expect(brewery.name).to eq('10 Barrel Brewing Co - Denver')
    expect(brewery.brewery_type).to eq('large')
  end
end
