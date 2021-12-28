require 'rails_helper'
# testing guide:
# - test structure of the response from the api
        # 1. what comes back from the service call (keys)
        # 2. format (place) of what comes back from the service call

RSpec.describe 'ImagesService', :vcr do
  before :each do
    location = 'Denver,CO'
    @searched_response = ImagesService.search_by_location(location)
  end

  it 'is structured as expected' do
    expect(@searched_response).to be_a Hash
    expect(@searched_response).to have_key(:total)
    expect(@searched_response[:total]).to be_an Integer
    expect(@searched_response).to have_key(:total_pages)
    expect(@searched_response[:total_pages]).to be_an Integer
    expect(@searched_response).to have_key(:results)
    expect(@searched_response[:results]).to be_an Array
  end

  it 'returns expected key values and data types' do
    results = @searched_response[:results][0]

    expect(results).to have_key(:urls)
    expect(results[:urls]).to be_a Hash

    expect(results[:urls]).to have_key(:raw)
    expect(results[:urls][:raw]).to be_a String

    expect(results).to have_key(:user)
    expect(results[:user]).to be_a Hash

    expect(results[:user]).to have_key(:name)
    expect(results[:user][:name]).to be_a String

    expect(results[:user]).to have_key(:links)
    expect(results[:user][:links]).to be_a Hash

    expect(results[:user][:links]).to have_key(:html)
    expect(results[:user][:links][:html]).to be_a String
  end
end
