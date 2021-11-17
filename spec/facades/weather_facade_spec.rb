require 'rails_helper'

RSpec.describe 'WeatherFacade', :vcr do
  it 'returns all weather data with given lat lon' do
    location = 'Denver,CO'
    result = WeatherFacade.get_weather_data(location)

    expect(result).to be_a Hash
  end

  it 'returns current weather data with string location' do

  end

   it 'creates poros' do

   end

  it 'returns formatted data' do

  end
end
