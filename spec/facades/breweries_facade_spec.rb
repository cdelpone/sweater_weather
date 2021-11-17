require 'rails_helper'

RSpec.describe 'BreweriesFacade', :vcr do
  before :each do
    @brewery_params = { location: 'Denver, CO', quantity: 5 }
    @city = 'Denver'
  end

  it 'returns 5 breweries with only id name and type' do
    brewery_call = BreweriesService.brewery_data(@city)
    brewery = BreweriesFacade.brewery(brewery_data)

    expect(brewery).to be_an Array

    first_brewery = brewery[0]
    expect(first_brewery).to be_a Brewery
    expect(first_brewery.id).to be_a String
    expect(first_brewery.name).to be_a String
    expect(first_brewery.brewery_type).to be_a String
  end

  it 'returns forecast data or brewery hash' do
    weather_data = WeatherFacade.get_weather_data(@brewery_params[:location])
    result = BreweriesFacade.forecast(weather_data)
    expect(result).to be_a Hash
  end

  it 'returns expected hash' do
    weather_data = WeatherFacade.get_weather_data(@brewery_params[:location])
    brewery_data = BreweriesService.brewery_data(@city)
    data = BreweriesFacade.brewery(brewery_data)

    result = BreweriesFacade.attributes(weather_data, @brewery_params, brewery_data)

    expect(result).to be_a Hash
  end
end
