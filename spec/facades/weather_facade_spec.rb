require 'rails_helper'

RSpec.describe 'WeatherFacade', :vcr do
    before :each do
      @location = 'Denver,CO'
      @location_data = MapQuestFacade.get_lat_lng(@location)
      @weather_data = WeatherService.weather_data(@location_data.latitude, @location_data.longitude)
    end

    it 'returns all weather data' do
      weather_data = WeatherFacade.get_weather_data(@location)

      expect(weather_data).to be_an Array
      expect(weather_data.size).to eq(3)
    end

    it 'creates poros' do
      collection = WeatherFacade.weather_collection(@weather_data)
      expect(collection).to be_an Array
      expect(collection.size).to eq(3)
    end

   it 'hourly_weather' do
     hourly_objects = WeatherFacade.hourly_weather_poro(@weather_data)
     expect(hourly_objects).to be_an Array
     expect(hourly_objects.first).to be_a Hour
   end

   it 'daily_weather' do
     daily_objects = WeatherFacade.daily_weather_poro(@weather_data)

     expect(daily_objects).to be_an Array
     expect(daily_objects.first).to be_a Day
   end
end
