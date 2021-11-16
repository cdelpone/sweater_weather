require 'rails_helper'

RSpec.describe 'MapQuestFacade' do
  it 'returns latitude and longitude' do
    location = 'Denver,CO'

    mapquest_data = MapQuestFacade.mapquest_data(location)
    location_data = MapQuestFacade.get_lat_lng(location)

    expect(mapquest_data).to be_a Hash
    expect(location_data).to be_a Location
    expect(location_data.latitude).to be_a Float
    expect(location_data.longitude).to be_a Float
    expect(location_data.provided_location).to be_a String
    expect(location_data.provided_location).to eq(location)
  end
end
