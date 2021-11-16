require 'rails_helper'

RSpec.describe Location do
  it 'creates a location poro' do
    data = {
            latitude: 39.5,
            longitude: 105.5,
            provided_location: 'Denver,CO'
          }

    location = Location.new(data)

    expect(location.latitude).to eq(39.5)
    expect(location.longitude).to eq(105.5)
    expect(location.provided_location).to be_a String
    expect(location.provided_location).to eq('Denver,CO')
  end
end
