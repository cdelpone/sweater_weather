require 'rails_helper'

RSpec.describe 'BreweriesController' do
  it 'makes a successful call' do
    location = 'Denver,CO'
    quantity = 5
    get "/api/v1/breweries?location=denver,co&quantity=5"
    expect(response).to be_successful
    # breweries = JSON.parse(response.body, symbolize_names: true)
    # expect(breweries).to be_a Hash
  end

  it 'returns expected keys and data types' do

  end

  it 'does not return unnecessary data' do

  end
end
# get "/api/v1/breweries?location=#{location}&quantity=#{quantity}"
# https://api.openbrewerydb.org/breweries?by_city=denver&by_state=co
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
#         { ... same format for breweries 3, 4 and 5 ... }
#       ]
#     }
#   }
# }
