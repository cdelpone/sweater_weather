require 'rails_helper'

RSpec.describe 'WeatherService' do
  it 'can get all weather data for given latitude/longitude' do
    lat = 39.738453
    lon = -104.984853

    weather_data = WeatherService.weather_data(lat, lon)

    expect(weather_data).to be_a Hash

    expect(weather_data).not_to have_key(:minutely)

    expect(weather_data).to have_key(:lat)
    expect(weather_data[:lat]).to be_a Float
    expect(weather_data).to have_key(:lon)
    expect(weather_data[:lon]).to be_a Float
    expect(weather_data).to have_key(:timezone)
    expect(weather_data[:timezone]).to be_a String
    expect(weather_data).to have_key(:timezone_offset)
    expect(weather_data[:timezone_offset]).to be_a Numeric

    expect(weather_data).to have_key(:current)
    expect(weather_data[:current]).to be_a Hash
    expect(weather_data).to have_key(:hourly)
    expect(weather_data[:hourly]).to be_an Array
    expect(weather_data[:hourly].size).to eq(48)
    expect(weather_data).to have_key(:daily)
    expect(weather_data[:daily]).to be_an Array
    expect(weather_data[:daily].size).to eq(8)
  end
end
