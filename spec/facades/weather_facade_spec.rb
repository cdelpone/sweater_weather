require 'rails_helper'

RSpec.describe 'WeatherFacade', :vcr do
  it 'returns all weather data' do
    location = 'Denver,CO'
    result = WeatherFacade.get_weather_data(location)
    expect(result).to be_an Array
    # expect(result.size).to eq(3)
    # expect(result).to have_key :current_weather
    # expect(result).to have_key :hourly_weather
    # expect(result).to have_key :daily_weather
  end

  xit 'returns a hash with current, hourly, and daily weather data' do
    location = 'Denv\er,CO'
    location_data = MapQuestFacade.get_lat_lng(location)
    weather_data = WeatherService.weather_data(location_data.latitude, location_data.longitude)
    result = WeatherFacade.attributes(weather_data)

    expect(result).to be_a Hash
    expect(result.size).to eq(3)

    expect(result).to have_key :current_weather
    expect(result[:current_weather]).to be_a Current
    current = result[:current_weather]
    expect(current.conditions).to be_a String
    expect(current.datetime).to be_a Time
    expect(current.feels_like).to be_a Float
    expect(current.humidity).to be_a Numeric
    expect(current.icon).to be_a String
    expect(current.sunrise).to be_a Time
    expect(current.sunset).to be_a Time
    expect(current.temperature).to be_a Float
    expect(current.uvi).to be_a Numeric
    expect(current.visibility).to be_a Numeric

    expect(result).to have_key :hourly_weather
    expect(result[:hourly_weather]).to be_an Array
    expect(result[:hourly_weather].size).to eq(8)
    hourly = result[:hourly_weather][0]
    expect(hourly.conditions).to be_a String
    expect(hourly.time).to be_a String
    expect(hourly.icon).to be_a String
    expect(hourly.temperature).to be_a Float

    expect(result).to have_key :daily_weather
    expect(result[:daily_weather]).to be_an Array
    expect(result[:daily_weather].size).to eq(5)
    daily = result[:daily_weather][0]
    expect(daily.conditions).to be_a String
    expect(daily.date).to be_a String
    expect(daily.icon).to be_a String
    expect(daily.max_temp).to be_a Float
    expect(daily.min_temp).to be_a Float
    expect(daily.sunrise).to be_a Time
    expect(daily.sunset).to be_a Time
  end

   xit 'hourly_weather' do
     location = 'Denver,CO'
     location_data = MapQuestFacade.get_lat_lng(location)
     weather_data = WeatherService.weather_data(location_data.latitude, location_data.longitude)
     hourly_objects = WeatherFacade.hourly_weather(weather_data[:hourly])

     expect(hourly_objects).to be_an Array
     expect(hourly_objects.first).to be_a Hourly
   end

   xit 'daily_weather' do
     location = 'Denver,CO'
     location_data = MapQuestFacade.get_lat_lng(location)
     weather_data = WeatherService.weather_data(location_data.latitude, location_data.longitude)
     daily_objects = WeatherFacade.daily_weather(weather_data[:daily])

     expect(daily_objects).to be_an Array
     expect(daily_objects.first).to be_a Daily
   end
end
