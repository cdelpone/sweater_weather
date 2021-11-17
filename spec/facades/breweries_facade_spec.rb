require 'rails_helper'

RSpec.describe 'BreweriesFacade' do
  it 'returns 5 breweries with only id name and type' do
    # location = 'Denver,CO'
    quantity = 5
    city = 'Denver'
    brewery_data = BreweriesService.brewery_data(city)
    result = BreweriesFacade.brewery_data(brewery_data)

    expect(result).to be_an Array

    first_brewery = result[0]
    expect(first_brewery).to be_a Brewery
    expect(first_brewery.id).to be_a String
    expect(first_brewery.name).to be_a String
    expect(first_brewery.brewery_type).to be_a String
  end

  it 'returns forecast data or brewery hash' do
    brewery_params = { location: 'Denver, CO', quantity: 5 }
    weather_data = WeatherFacade.get_weather_data(brewery_params[:location])
    result = BreweriesFacade.forecast(weather_data)
    require "pry"; binding.pry
    expect(result).to eq('')
  end
end
# {
#   "data": {
#     "id": null,
#     "type": "breweries",
#     "attributes": {
#       "destination": "denver,co",
#       "forecast": {
#         "summary": "Cloudy with a chance of meatballs",
#         "temperature": "83 F"
#       },
#       "breweries": [
#         {
#           "id": "denver-beer-co-33,
#           "name": "Denver Beer Co Olde Town Arvada",
#           "brewery_type": "micro"
#         },
#         {
#           "id": "new-image-3342,
#           "name": "New Image Brewing Co",
#           "brewery_type": "brewpub"
#         },
#       ]
#     }
#   }
# }
