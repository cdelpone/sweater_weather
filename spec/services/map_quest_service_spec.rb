require 'rails_helper'

RSpec.describe 'MapQuestService' do
  it 'can get all map quest data for a given location' do
    location = 'Denver,CO'

    mapquest_data = MapQuestService.mapquest_data(location)

    expect(mapquest_data).to be_a Hash
    expect(mapquest_data[:results]).to be_an Array

    locations_data = mapquest_data[:results][0]

    expect(locations_data).to have_key(:providedLocation)
    expect(locations_data[:providedLocation]).to have_key(:location)
    expect(locations_data[:providedLocation][:location]).to eq(location)

    expect(locations_data).to have_key(:locations)
    expect(locations_data[:locations]).to be_an Array
    expect(locations_data[:locations][0]).to be_a Hash
    expect(locations_data[:locations][0]).to have_key(:latLng)
    expect(locations_data[:locations][0][:latLng]).to be_a Hash

    lat_lng = locations_data[:locations][0][:latLng]
    expect(lat_lng).to be_a Hash
    expect(lat_lng).to have_key(:lat)
    expect(lat_lng).to have_key(:lng)
    expect(lat_lng[:lat]).to be_a Float
    expect(lat_lng[:lng]).to be_a Float
  end
end
