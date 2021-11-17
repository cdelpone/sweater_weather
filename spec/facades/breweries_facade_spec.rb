require 'rails_helper'

RSpec.describe 'BreweriesFacade' do
  it 'returns only 5 results' do
    location = 'Denver,CO'
    result = BreweriesFacade.all_breweries(location)
    expect(result).to be_an Array
    expect(result.size).to eq(5)
  end

  it 'can get only brewery id name and type' do
    location = 'Denver,CO'
    result = BreweriesFacade.brewery_data(brewery_data)
    require "pry"; binding.pry
    expect(result).to be_an Array
  end

  # it 'returns forecast data or brewery hash' do
  #   location = 'Denver,CO'
  #   brewery_data = BreweriesFacade.get_brewery_data(location)
  #   expect(brewery_data).to eq('')
  # end
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
