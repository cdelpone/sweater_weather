require 'rails_helper'

RSpec.describe 'ForecastController', :vcr do
  it 'makes a successful call' do
    location = 'denver,CO'

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful
  end

  it 'returns expected hash keys' do
    location = 'Denver,CO'
    get "/api/v1/forecast?location=#{location}"

    forecast_data = JSON.parse(response.body, symbolize_names: true)

    expect(forecast_data).to be_a Hash
    expect(forecast_data).to have_key(:current_weather)
    expect(forecast_data[:current_weather]).to be_a Hash
    expect(forecast_data).to have_key(:hourly_weather)
    expect(forecast_data[:hourly_weather]).to be_an Array
    expect(forecast_data[:hourly_weather].size).to eq(8)
    expect(forecast_data).to have_key(:daily_weather)
    expect(forecast_data[:daily_weather]).to be_an Array
    expect(forecast_data[:daily_weather].size).to eq(5)
    current_weather = forecast_data[:current_weather]
    expect(current_weather).to be_a Hash
    expect(current_weather).to have_key(:datetime)
    expect(current_weather).to have_key(:sunrise)
    expect(current_weather).to have_key(:sunset)
    expect(current_weather).to have_key(:temperature)
    expect(current_weather).to have_key(:feels_like)
    expect(current_weather).to have_key(:humidity)
    expect(current_weather).to have_key(:uvi)
    expect(current_weather).to have_key(:visibility)
    expect(current_weather).not_to have_key(:weather)
    expect(current_weather).to have_key(:conditions)
    expect(current_weather).to have_key(:icon)

    hourly_weather = forecast_data[:hourly_weather][0]
    expect(hourly_weather).to be_a Hash
    expect(hourly_weather).to have_key(:time)
    expect(hourly_weather).to have_key(:temperature)
    expect(hourly_weather).not_to have_key(:weather)
    expect(hourly_weather).to have_key(:conditions)
    expect(hourly_weather).to have_key(:icon)


    daily_weather = forecast_data[:daily_weather][0]
    expect(daily_weather).to be_a Hash
    expect(daily_weather).to have_key(:date)
    expect(daily_weather).to have_key(:sunrise)
    expect(daily_weather).to have_key(:sunset)

    expect(daily_weather).not_to have_key(:temperature)
    expect(daily_weather).to have_key(:min_temp)
    expect(daily_weather).to have_key(:max_temp)

    expect(daily_weather).not_to have_key(:weather)
    expect(daily_weather).to have_key(:conditions)
    expect(daily_weather).to have_key(:icon)
  end

  it 'does not return unnecessary data' do
  end
end
