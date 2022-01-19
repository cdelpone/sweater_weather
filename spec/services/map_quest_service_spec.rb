require 'rails_helper'

RSpec.describe 'MapQuestService', :vcr do
  describe 'geocoding' do
    it 'receives all data for a given location' do
      location = 'Denver,CO'
      mapquest_geocoding_response = MapQuestService.mapquest_geocoding_response(location)

      expect(mapquest_geocoding_response).to be_a Hash
      expect(mapquest_geocoding_response[:results]).to be_an Array

      results = mapquest_geocoding_response[:results][0]

      expect(results).to have_key(:providedLocation)
      expect(results[:providedLocation]).to have_key(:location)
      expect(results).to have_key(:locations)
      expect(results[:locations]).to be_an Array
      expect(results[:locations][0]).to be_a Hash
      expect(results[:locations][0]).to have_key(:latLng)
      expect(results[:locations][0][:latLng]).to be_a Hash

      lat_lng = results[:locations][0][:latLng]

      expect(lat_lng).to be_a Hash
      expect(lat_lng).to have_key(:lat)
      expect(lat_lng).to have_key(:lng)
    end

    it 'returns results key from all data' do
      location = 'Denver,CO'
      mapquest_data = MapQuestService.mapquest_geocoding_data(location)

      expect(mapquest_data).to be_a Hash
      expect(mapquest_data[:locations]).to be_an Array

      expect(mapquest_data).to have_key(:providedLocation)
      expect(mapquest_data[:providedLocation]).to have_key(:location)
      expect(mapquest_data[:providedLocation][:location]).to eq(location)

      locations_data = mapquest_data[:locations][0]

      expect(mapquest_data).to have_key(:locations)
      expect(mapquest_data[:locations]).to be_an Array
      expect(mapquest_data[:locations][0]).to be_a Hash
      expect(mapquest_data[:locations][0]).to have_key(:latLng)
      expect(mapquest_data[:locations][0][:latLng]).to be_a Hash

      lat_lng = mapquest_data[:locations][0][:latLng]

      expect(lat_lng).to be_a Hash
      expect(lat_lng).to have_key(:lat)
      expect(lat_lng).to have_key(:lng)
      expect(lat_lng[:lat]).to be_a Float
      expect(lat_lng[:lng]).to be_a Float
    end
  end

  describe 'directions' do
    it 'receives formatted time with all route data' do
      origin = 'Denver,CO'
      destination = 'Estes Park, CO'
      mq_directions = MapQuestService.mapquest_directions_response(origin, destination)

      expect(mq_directions).to have_key :formattedTime
      expect(mq_directions[:formattedTime]).to be_a String
    end
  end
end
