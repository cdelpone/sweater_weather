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
