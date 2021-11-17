require 'rails_helper'

RSpec.describe 'BreweriesService' do
  it 'can get all brewery data for a given city and state' do
    city = 'Denver'
    state = 'CO'

    brewery_data = BreweriesService.brewery_data(city, state)

    expect(brewery_data).to be_an Array
    expect(brewery_data[0]).to be_a Hash

    first_brewery = brewery_data[0]

    expect(first_brewery).to have_key(:id)
    expect(first_brewery[:id]).to be_a String
    expect(first_brewery).to have_key(:name)
    expect(first_brewery[:name]).to be_a String
    expect(first_brewery).to have_key(:brewery_type)
    expect(first_brewery[:brewery_type]).to be_a String
    expect(first_brewery).to have_key(:street)
    expect(first_brewery).to have_key(:address_2)
    expect(first_brewery).to have_key(:address_3)
    expect(first_brewery).to have_key(:city)
    expect(first_brewery[:city]).to be_a String
    expect(first_brewery).to have_key(:state)
    expect(first_brewery[:state]).to be_a String
    expect(first_brewery).to have_key(:county_province)
    expect(first_brewery).to have_key(:postal_code)
    expect(first_brewery).to have_key(:country)
    expect(first_brewery).to have_key(:longitude)
    expect(first_brewery[:longitude]).to be_a String
    expect(first_brewery).to have_key(:latitude)
    expect(first_brewery[:latitude]).to be_a String
    expect(first_brewery).to have_key(:phone)
    expect(first_brewery).to have_key(:website_url)
    expect(first_brewery).to have_key(:updated_at)
    expect(first_brewery).to have_key(:created_at)
  end
end
