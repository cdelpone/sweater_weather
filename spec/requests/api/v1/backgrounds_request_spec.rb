require 'rails_helper'

RSpec.describe 'BackgroundsController', :vcr do
  it 'makes a successful call' do
    location = 'Denver,CO'

    get "/api/v1/backgrounds?location=#{location}"

    expect(response).to be_successful
    expect(response.status).to be 200
  end

  it 'serialized the image with certain attributes' do
    location = 'Denver,CO'

    get "/api/v1/backgrounds?location=#{location}"

    image = JSON.parse(response.body, symbolize_names: true)

    expect(image).to have_key :data
    expect(image[:data]).to have_key :id
    expect(image[:data]).to have_key :type
    expect(image[:data][:type]).to eq("image")
    expect(image[:data]).to have_key :attributes
    expect(image[:data][:attributes]).to have_key :raw_url
    expect(image[:data][:attributes]).to have_key :location
    expect(image[:data][:attributes]).to have_key :credit
    expect(image[:data][:attributes][:credit]).to have_key :source
    expect(image[:data][:attributes][:credit]).to have_key :photographer
    expect(image[:data][:attributes][:credit]).to have_key :photographer_profile_link
    expect(image[:data][:attributes][:location]).to eq(location)
  end

  # it 'returns expected key value data types' do
  # end

  # it 'does not return unnecessary data' do
  # end
end

# expect().to be_an Array
# expect().to be_a Time
# expect().to be_a Float
# expect().to be_a Numeric
# expect().to be_a String
