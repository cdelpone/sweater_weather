require 'rails_helper'

RSpec.describe 'WeatherService' do
  before :each do
    lat = 39.738453
    lon = -104.984853
    @weather_data = WeatherService.weather_data(lat, lon)
  end

  it 'can get all weather data for given latitude/longitude' do
    expect(@weather_data).to be_a Hash
    expect(@weather_data).not_to have_key(:minutely)

    expect(@weather_data).to have_key(:lat)
    expect(@weather_data[:lat]).to be_a Float
    expect(@weather_data).to have_key(:lon)
    expect(@weather_data[:lon]).to be_a Float
    expect(@weather_data).to have_key(:timezone)
    expect(@weather_data[:timezone]).to be_a String
    expect(@weather_data).to have_key(:timezone_offset)
    expect(@weather_data[:timezone_offset]).to be_a Numeric
    expect(@weather_data).to have_key(:current)
    expect(@weather_data[:current]).to be_a Hash
    expect(@weather_data).to have_key(:hourly)
    expect(@weather_data[:hourly]).to be_an Array
    expect(@weather_data[:hourly].size).to eq(48)
    expect(@weather_data).to have_key(:daily)
    expect(@weather_data[:daily]).to be_an Array
    expect(@weather_data[:daily].size).to eq(8)
  end

  it 'returns current weather data' do
    current = @weather_data[:current]
    expect(current).to be_a Hash
    expect(current).to have_key(:dt)
    expect(current).to have_key(:sunrise)
    expect(current).to have_key(:sunset)
    expect(current).to have_key(:temp)
    expect(current).to have_key(:feels_like)
    expect(current).to have_key(:humidity)
    expect(current).to have_key(:uvi)
    expect(current).to have_key(:visibility)

    expect(current).to have_key(:weather)
    expect(current[:weather]).to be_an Array
    expect(current[:weather][0]).to have_key(:description)
    expect(current[:weather][0]).to have_key(:icon)
  end

  it 'returns hourly weather data' do
    hourly = @weather_data[:hourly][0]
    expect(hourly).to be_a Hash
    expect(hourly).to have_key(:dt)
    expect(hourly).to have_key(:temp)

    expect(hourly).to have_key(:weather)
    expect(hourly[:weather]).to be_an Array
    expect(hourly[:weather][0]).to have_key(:description)
    expect(hourly[:weather][0]).to have_key(:icon)
  end

  it 'returns daily weather data' do
    daily = @weather_data[:daily][0]
    expect(daily).to be_a Hash
    expect(daily).to have_key(:dt)
    expect(daily).to have_key(:sunrise)
    expect(daily).to have_key(:sunset)

    expect(daily).to have_key(:temp)
    expect(daily[:temp]).to be_a Hash
    expect(daily[:temp]).to have_key(:min)
    expect(daily[:temp]).to have_key(:max)

    expect(daily).to have_key(:weather)
    expect(daily[:weather]).to be_an Array
    expect(daily[:weather][0]).to have_key(:description)
    expect(daily[:weather][0]).to have_key(:icon)
  end
end
