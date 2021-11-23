require 'rails_helper'

RSpec.describe 'BackgroundsController', :vcr do
  before :each do
    location = 'Denver,CO'
    get "/api/v1/backgrounds?location=#{location}"
    # @data = JSON.parse(response.body, symbolize_names: true)
  end

  it 'makes a successful call' do
    expect(response).to be_successful
  end

  it 'returns expected keys' do
    # expect(@).to be_a Hash
    # expect(@.size).to eq(8)
    # expect(@).to have_key(:)
    # expect(@).to have_key(:)
    # expect(@).to have_key(:)
    # expect(@).to have_key(:)
    # expect(@).to have_key(:)
  end

  it 'returns expected key values' do
  end

  it 'returns expected key value data types' do
    # expect().to be_an Array
    # expect().to be_a Time
    # expect().to be_a Float
    # expect().to be_a Numeric
    # expect().to be_a String
  end

  it 'does not return unnecessary data' do
    # expect(@).not_to have_key(:)
    # expect(@).not_to have_key(:)
    # expect(@).not_to have_key(:)
    # expect(@).not_to have_key(:)
    # expect(@).not_to have_key(:)
    # expect(@).not_to have_key(:)
    # expect(@).not_to have_key(:)
    # expect(@).not_to have_key(:)
    # expect(@).not_to have_key(:)
    # expect(@).not_to have_key(:)
  end
end
