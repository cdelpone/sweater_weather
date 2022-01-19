require 'rails_helper'

RSpec.describe 'WeatherFacade', :vcr do
    before :each do
      @location = 'Denver,CO'
    end

    it 'returns all weather data' do
      weather_data = WeatherFacade.weather_data(@location)

      expect(weather_data).to be_a Hash
      expect(weather_data).to have_key :lat
      expect(weather_data).to have_key :lon
      expect(weather_data).to have_key :timezone
      expect(weather_data).to have_key :timezone_offset
      expect(weather_data).to have_key :current
      expect(weather_data).to have_key :hourly
      expect(weather_data).to have_key :daily
    end

   it 'current_weather' do
     current = WeatherFacade.current_weather(@location)

     expect(current).to be_a Current
     expect(current.conditions).to be_a String
     expect(current.datetime).to be_a Time
   end

   it 'hourly_weather' do
     hour = WeatherFacade.hourly_weather(@location)

     expect(hour.count).to eq(8)
     expect(hour.first).to be_a Hour
   end

   it 'daily_weather' do
     day = WeatherFacade.daily_weather(@location)

     expect(day.count).to eq(5)
     expect(day.first).to be_a Day
   end

   it 'gives the weather data for destination city at eta' do
     origin = 'Denver,CO'
     destination = 'Redlands, CA'

     hour_data = WeatherFacade.forecast_eta(origin, destination)

     expect(hour_data).to be_a Hour
     expect(hour_data.conditions).to be_a String
     expect(hour_data.temperature).to be_a Float
     expect(hour_data.icon).to be_a String
     expect(hour_data.time).to be_a String
     expect(hour_data).to be_a Hour
   end
end
