require 'rails_helper'

RSpec.describe 'ForecastController', :vcr do
  before :each do
    location = 'Denver,CO'
    get "/api/v1/forecast?location=#{location}"
    @forecast_data = JSON.parse(response.body, symbolize_names: true)
    @current_weather = @forecast_data[:data][:attributes][:current_weather]
    @hourly_weather = @forecast_data[:data][:attributes][:hourly_weather][0]
    @daily_weather = @forecast_data[:data][:attributes][:daily_weather][0]
  end

  it 'makes a successful call' do
    expect(response).to be_successful
  end

  it 'returns expected hash keys' do
    expect(@forecast_data).to be_a Hash
    expect(@forecast_data).to have_key(:data)
    expect(@forecast_data[:data]).to have_key(:id)
    expect(@forecast_data[:data]).to have_key(:type)
    expect(@forecast_data[:data]).to have_key(:attributes)
    expect(@forecast_data[:data][:attributes]).to have_key(:current_weather)
    expect(@forecast_data[:data][:attributes]).to have_key(:daily_weather)
    expect(@forecast_data[:data][:attributes]).to have_key(:hourly_weather)
    expect(@forecast_data[:data][:attributes][:current_weather]).to be_a Hash

    expect(@forecast_data[:data][:attributes][:hourly_weather]).to be_an Array
    expect(@forecast_data[:data][:attributes][:hourly_weather].size).to eq(8)

    expect(@forecast_data[:data][:attributes][:daily_weather]).to be_an Array
    expect(@forecast_data[:data][:attributes][:daily_weather].size).to eq(5)

    expect(@current_weather).to be_a Hash
    expect(@current_weather).to have_key(:datetime)
    expect(@current_weather).to have_key(:sunrise)
    expect(@current_weather).to have_key(:sunset)
    expect(@current_weather).to have_key(:temperature)
    expect(@current_weather).to have_key(:feels_like)
    expect(@current_weather).to have_key(:humidity)
    expect(@current_weather).to have_key(:uvi)
    expect(@current_weather).to have_key(:visibility)
    expect(@current_weather).to have_key(:conditions)
    expect(@current_weather).to have_key(:icon)

    expect(@hourly_weather).to be_a Hash
    expect(@hourly_weather).to have_key(:time)
    expect(@hourly_weather).to have_key(:temperature)
    expect(@hourly_weather).to have_key(:conditions)
    expect(@hourly_weather).to have_key(:icon)

    expect(@daily_weather).to be_a Hash
    expect(@daily_weather).to have_key(:date)
    expect(@daily_weather).to have_key(:sunrise)
    expect(@daily_weather).to have_key(:sunset)
    expect(@daily_weather).to have_key(:min_temp)
    expect(@daily_weather).to have_key(:max_temp)
    expect(@daily_weather).to have_key(:conditions)
    expect(@daily_weather).to have_key(:icon)
  end

  it 'returns expected key values' do
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
    # expect(result[:hourly_weather].size).to eq(8)
    # hourly = result[:hourly_weather][0]
    # expect(hourly.conditions).to be_a String
    # expect(hourly.time).to be_a String
    # expect(hourly.icon).to be_a String
    # expect(hourly.temperature).to be_a Float
    #
    # expect(result).to have_key :daily_weather
    # expect(result[:daily_weather]).to be_an Array
    # expect(result[:daily_weather].size).to eq(5)
    # daily = result[:daily_weather][0]
    # expect(daily.conditions).to be_a String
    # expect(daily.date).to be_a String
    # expect(daily.icon).to be_a String
    # expect(daily.max_temp).to be_a Float
    # expect(daily.min_temp).to be_a Float
    # expect(daily.sunrise).to be_a Time
    # expect(daily.sunset).to be_a Time
  end

  it 'does not return unnecessary data' do
    expect(@current_weather).not_to have_key(:weather)
    expect(@hourly_weather).not_to have_key(:weather)
    expect(@daily_weather).not_to have_key(:temperature)
    expect(@daily_weather).not_to have_key(:feels_like)
    expect(@daily_weather).not_to have_key(:weather)
    expect(@forecast_data).not_to have_key(:minutely)
    expect(@forecast_data).not_to have_key(:lat)
    expect(@forecast_data).not_to have_key(:lon)
    expect(@forecast_data).not_to have_key(:timezone)
    expect(@forecast_data).not_to have_key(:timezone_offset)
  end
end
