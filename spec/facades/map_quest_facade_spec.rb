require 'rails_helper'

RSpec.describe 'MapQuestFacade', :vcr do
  it 'returns lat and lon data in a hash' do
    location = 'Denver,CO'
    location_data = MapQuestFacade.lat_lon(location)

    expect(location_data).to be_a Hash
    expect(location_data[:latitude]).to be_a Float
    expect(location_data[:longitude]).to be_a Float
    expect(location_data[:provided_location]).to be_a String
    expect(location_data[:provided_location]).to eq(location)
  end

  it 'returns all location data' do
    location = 'Denver,CO'
    mapquest_data = MapQuestFacade.mapquest_data(location)

    expect(mapquest_data).to be_a Hash
  end

  it 'returns a location poro with expected info' do
    location = 'Denver,CO'
    location_obj = MapQuestFacade.location_data(location)

    expect(location_obj).to be_a Location
    expect(location_obj.latitude).to be_a Float
    expect(location_obj.longitude).to be_a Float
    expect(location_obj.provided_location).to be_a String
    expect(location_obj.provided_location).to eq(location)
  end
end
