require 'rails_helper'

RSpec.describe 'WeatherFacade' do
  it 'returns all weather data with given lat lon' do
    location = 'Denver,CO'
    # location_data = MapQuestFacade.get_lat_lng(location)
    # weather_data = WeatherService.weather_data(location_data.latitude, location_data.longitude)
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
