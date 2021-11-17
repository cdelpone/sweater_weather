require 'rails_helper'

RSpec.describe 'WeatherFacade', :vcr do
  it 'returns all weather data' do
    location = 'Denver,CO'
    result = WeatherFacade.get_weather_data(location)
    expect(result).to be_a Hash
  end

  it 'returns a hash with current, hourly, and daily weather data' do
    location = 'Denver,CO'
    location_data = MapQuestFacade.get_lat_lng(location)
    weather_data = WeatherService.weather_data(location_data.latitude, location_data.longitude)
    result = WeatherFacade.attributes(weather_data)
    expect(result).to be_a Hash
  end

   it 'hourly_weather' do
     location = 'Denver,CO'
     location_data = MapQuestFacade.get_lat_lng(location)
     weather_data = WeatherService.weather_data(location_data.latitude, location_data.longitude)
     hourly_objects = WeatherFacade.hourly_weather(weather_data[:hourly])

     expect(hourly_objects).to be_an Array
     expect(hourly_objects.first).to be_a Hourly
   end

   it 'daily_weather' do
     location = 'Denver,CO'
     location_data = MapQuestFacade.get_lat_lng(location)
     weather_data = WeatherService.weather_data(location_data.latitude, location_data.longitude)
     daily_objects = WeatherFacade.daily_weather(weather_data[:daily])

     expect(daily_objects).to be_an Array
     expect(daily_objects.first).to be_a Daily
   end
end
