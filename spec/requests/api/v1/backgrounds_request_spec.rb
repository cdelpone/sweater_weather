require 'rails_helper'

RSpec.describe 'BackgroundsController', :vcr do
  before :each do
  end

  it 'makes a successful call' do
    location = 'Denver,CO'
    get "/api/v1/backgrounds?location=#{location}"
    # @background_params = { location: 'Denver,CO' }
    # @image_data = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response).to be 200
  end

  it 'gives credit' do
    # When displaying a photo from Unsplash, your application must attribute
    # Unsplash,
    # the Unsplash photographer, and
    # contain a link back to their Unsplash profile.
    # Photo by Annie Spratt on Unsplash
    # photpgrapher profile link:  # https://unsplash.com/@anniespratt?utm_source=your_app_name&utm_medium=referral
    # Unsplash link:  # https://unsplash.com/?utm_source=your_app_name&utm_medium=referral
  end

  it 'returns expected keys' do
    # expect(results).to have_key(:image_url)
    # expect(results).to have_key(:location)
    #
    # status: 200
    # body:
    #
    # {
    #   "data": {
    #     "type": "image",
    #     "id": null,
    #     "attributes": {
    #       "image": {
    #         "location": "denver,co",
    #         "image_url": "https://pixabay.com/get/54e6d4444f50a814f1dc8460962930761c38d6ed534c704c7c2878dd954dc451_640.jpg",
    #         "credit": {
    #           "source": "pixabay.com",
    #           "author": "quinntheislander",
    #           "logo": "https://pixabay.com/static/img/logo_square.png"
    #         }
    #       }
    #     }
    #   }
    # }
  end

  # it 'returns expected key values' do
  # end

  # it 'returns expected key value data types' do
  # end

  # it 'does not return unnecessary data' do
  # end
end
# expect(@image_data).to be_a Hash
# expect(@).to be_a Hash
# expect(@.size).to eq(8)
# expect(@).to have_key(:)

# expect().to be_an Array
# expect().to be_a Time
# expect().to be_a Float
# expect().to be_a Numeric
# expect().to be_a String

# expect(@).not_to have_key(:)
