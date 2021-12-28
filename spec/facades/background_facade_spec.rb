require 'rails_helper'
# testing guide:
    # - testing the return value of that facade method (test for object(s))

RSpec.describe 'BackgroundFacade', :vcr do
  before :each do
  end

  it 'returns an image object' do
    location = 'Denver,CO'
    data = BackgroundFacade.image_data(location)
    expect(data).to be_an Image
  end
end
