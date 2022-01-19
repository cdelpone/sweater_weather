require 'rails_helper'

RSpec.describe 'ImagesService', :vcr do
  before :each do
    location = 'Denver,CO'
    @image = ImagesService.search_by_location(location)
  end

  it 'is structured as expected' do
    expect(@image).to be_a Hash
  end

  it 'returns expected key values and data types' do
    expect(@image).to have_key(:urls)
    expect(@image[:urls]).to be_a Hash

    expect(@image[:urls]).to have_key(:raw)
    expect(@image[:urls][:raw]).to be_a String

    expect(@image).to have_key(:user)
    expect(@image[:user]).to be_a Hash

    expect(@image[:user]).to have_key(:name)
    expect(@image[:user][:name]).to be_a String

    expect(@image[:user]).to have_key(:links)
    expect(@image[:user][:links]).to be_a Hash

    expect(@image[:user][:links]).to have_key(:html)
    expect(@image[:user][:links][:html]).to be_a String
  end
end
