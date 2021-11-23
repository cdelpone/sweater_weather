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

    it 'creates an array of poros' do
      collection = WeatherFacade.weather_collection(@weather_data)
      expect(collection).to be_an Array
      expect(collection.size).to eq(3)
      expect(collection[0]).to be_a Current
      expect(collection[1]).to eq()
      expect(collection[2]).to eq()
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

   it 'returns objects' do
     # expect(result).to have_key :current_weather
     # expect(result[:current_weather]).to be_a Current
     # current = result[:current_weather]
     # expect(current.conditions).to be_a String
     # expect(current.datetime).to be_a Time
     # expect(current.feels_like).to be_a Float
     # expect(current.humidity).to be_a Numeric
     # expect(current.icon).to be_a String
     # expect(current.sunrise).to be_a Time
     # expect(current.sunset).to be_a Time
     # expect(current.temperature).to be_a Float
     # expect(current.uvi).to be_a Numeric
     # expect(current.visibility).to be_a Numeric
     #
     # expect(result).to have_key :hourly_weather
     # expect(result[:hourly_weather]).to be_an Array
     # hourly = result[:hourly_weather][0]
     # expect(hourly.conditions).to be_a String
     # expect(hourly.time).to be_a String
     # expect(hourly.icon).to be_a String
     # expect(hourly.temperature).to be_a Float
     #
     # expect(result).to have_key :daily_weather
     # expect(result[:daily_weather]).to be_an Array
     # daily = result[:daily_weather][0]
     # expect(daily.conditions).to be_a String
     # expect(daily.date).to be_a String
     # expect(daily.icon).to be_a String
     # expect(daily.max_temp).to be_a Float
     # expect(daily.min_temp).to be_a Float
     # expect(daily.sunrise).to be_a Time
     # expect(daily.sunset).to be_a Time
   end

end
