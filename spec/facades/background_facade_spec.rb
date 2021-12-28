require 'rails_helper'

RSpec.describe 'BackgroundFacade', :vcr do
  before :each do
  end

  it 'returns an image object' do
    location = 'Denver,CO'
    data = BackgroundFacade.image_data(location)

    expect(data).to be_an Image
  end
end
