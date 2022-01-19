require 'rails_helper'

RSpec.describe 'RoadTripFacade', :vcr do
  context 'happy paths' do
    it 'returns a rt object' do
      user = User.create(email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123', api_key: '132w4tergydfiuxbjght')

      origin = 'Denver,CO'
      destination = 'Estes Park, CO'

      rt_obj = RoadTripFacade.travel_details(origin, destination)

      expect(rt_obj).to be_a RoadTrip
      expect(rt_obj.start_city).to eq(origin)
      expect(rt_obj.end_city).to eq(destination)
      expect(rt_obj.travel_time).to eq("01:22:19")
      expect(rt_obj.weather_at_eta).to be_a Hash
      expect(rt_obj.weather_at_eta).to have_key :conditions
      expect(rt_obj.weather_at_eta).to have_key :temperature
    end

    it 'returns a hash with weather conditions and temp for the eta' do
      user = User.create(email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123', api_key: '132w4tergydfiuxbjght')

      origin = 'Denver,CO'
      destination = 'Estes Park, CO'

      hour_hash = RoadTripFacade.forecast_eta(origin, destination)

      expect(hour_hash).to be_a Hash
      expect(hour_hash).to have_key :conditions
      expect(hour_hash[:conditions]).to be_a String
      expect(hour_hash).to have_key :temperature
      expect(hour_hash[:temperature]).to be_a Float
    end

    it 'gives the travel time for the route as a string' do
      user = User.create(email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123', api_key: '132w4tergydfiuxbjght')

      origin = 'Denver,CO'
      destination = 'Estes Park, CO'

      travel_time = RoadTripFacade.travel_time(origin, destination)

      expect(travel_time).to be_a String
      expect(travel_time).to eq("01:22:19")
    end
  end

  context 'edge case/sad path' do
    it 'returns an error if travel time is impossible' do
      user = User.create(email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123', api_key: '132w4tergydfiuxbjght')

      origin = 'Denver,CO'
      destination = 'london, uk'

      travel_time = RoadTripFacade.travel_time(origin, destination)

      expect(travel_time).to be_a String
      expect(travel_time).to eq("Impossible route")
    end
  end
end
