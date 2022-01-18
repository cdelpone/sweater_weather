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

  it 'returns current weather data' do
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


    expect(@current_weather[:conditions]).to be_a String
    expect(@current_weather[:datetime]).to be_a String
    expect(@current_weather[:feels_like]).to be_a Float
    expect(@current_weather[:humidity]).to be_a Numeric
    expect(@current_weather[:icon]).to be_a String
    expect(@current_weather[:sunrise]).to be_a String
    expect(@current_weather[:sunset]).to be_a String
    expect(@current_weather[:temperature]).to be_a Float
    expect(@current_weather[:uvi]).to be_a Numeric
    expect(@current_weather[:visibility]).to be_a Numeric

  end

  it 'returns hourly weather data' do
    expect(@hourly_weather).to be_a Hash
    expect(@hourly_weather).to have_key(:time)
    expect(@hourly_weather).to have_key(:temperature)
    expect(@hourly_weather).to have_key(:conditions)
    expect(@hourly_weather).to have_key(:icon)

    expect(@hourly_weather[:conditions]).to be_a String
    expect(@hourly_weather[:time]).to be_a String
    expect(@hourly_weather[:icon]).to be_a String
    expect(@hourly_weather[:temperature]).to be_a Float
  end

  it 'returns daily weather data' do
    expect(@daily_weather).to be_a Hash
    expect(@daily_weather).to have_key(:date)
    expect(@daily_weather).to have_key(:sunrise)
    expect(@daily_weather).to have_key(:sunset)
    expect(@daily_weather).to have_key(:min_temp)
    expect(@daily_weather).to have_key(:max_temp)
    expect(@daily_weather).to have_key(:conditions)
    expect(@daily_weather).to have_key(:icon)

    expect(@daily_weather[:conditions]).to be_a String
    expect(@daily_weather[:date]).to be_a String
    expect(@daily_weather[:icon]).to be_a String
    expect(@daily_weather[:max_temp]).to be_a Float
    expect(@daily_weather[:min_temp]).to be_a Float
    expect(@daily_weather[:sunrise]).to be_a String
    expect(@daily_weather[:sunset]).to be_a String
  end
end
