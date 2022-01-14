require 'rails_helper'
# testing guide:
    # - testing the return value of that facade method (test for object(s))

RSpec.describe 'BackgroundFacade', :vcr do
  it 'returns an image object' do
    location = { location: 'Denver,CO' }
    image_data = ImagesService.search_by_location(location)
    image = BackgroundFacade.image_data(location)

    expect(image).to be_an Image
    expect(image.location).to be_a String
    expect(image.location).to eq("Denver,CO")
    expect(image.raw_url).to be_a String
    expect(image.credit).to be_a Hash
  end
end
