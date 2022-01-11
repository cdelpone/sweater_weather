require 'rails_helper'
# testing guide:
    # - testing the return value of that facade method (test for object(s))

RSpec.describe 'BackgroundFacade', :vcr do
  before :each do
  end

  it 'returns an image object' do
    location = 'Denver,CO'
    image = BackgroundFacade.image_data(location)

    expect(image).to be_an Image
    expect(image.source).to be_a String
    expect(image.raw_url).to be_a String
    expect(image.photographer).to be_a String
    expect(image.photographer_profile_link).to be_a String
  end
end
