require 'rails_helper'

RSpec.describe Location do
  it 'creates a location poro' do
    data = {
            latitude: 39.7385,
            longitude: -104.9849,
            provided_location: 'Denver,CO'
          }

    location = Location.new(data)

    expect(location.latitude).to eq(39.7385)
    expect(location.longitude).to eq(-104.9849)
    expect(location.provided_location).to be_a String
    expect(location.provided_location).to eq('Denver,CO')
  end
end
