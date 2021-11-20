require 'rails_helper'

RSpec.describe 'BreweriesFacade', :vcr do
  before :each do
    @brewery_params = { location: 'Denver, CO', quantity: 5 }
    @city = 'Denver'
    @weather_data = WeatherFacade.get_weather_data(@brewery_params[:location])
    @brewery_call = BreweriesService.brewery_data(@city)
  end

  it 'returns 5 breweries with only id name and type' do
    brewery = BreweriesFacade.brewery(@brewery_call)

    expect(brewery).to be_an Array

    first_brewery = brewery[0]
    expect(first_brewery).to be_a Brewery
    expect(first_brewery.id).to be_a String
    expect(first_brewery.name).to be_a String
    expect(first_brewery.brewery_type).to be_a String
  end

  it 'returns forecast data or brewery hash' do
    forecast = BreweriesFacade.forecast(@weather_data)
    expect(forecast).to be_a Hash
  end

  it 'returns expected hash' do
    attributes = BreweriesFacade.attributes(@weather_data, @brewery_params, @brewery_call)

    expect(attributes).to be_a Hash
  end
end
