require 'rails_helper'
# testing guide:
    # - just like testing a plain old ruby class (mod 1)
    # - test attributes
    # - test methods
RSpec.describe Image do
  it 'creates an image poro' do
    location = { location: 'Denver,CO' }

    data = {
      :urls=> {
        :raw=>"https://images.unsplash.com/photo-1634507307799-ace9b49840b7?ixid=MnwyNzY0MzR8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkNDT3xlbnwwfHx8fDE2NDIxMTY5NzM&ixlib=rb-1.2.1" },
      :user=> {
         :name=>"Dillon Wanner",
         :links=> {
           :html=>"https://unsplash.com/@dillydallying"}
        }
      }

    image1 = Image.new(data, location)

    expect(image1.location).to eq('Denver,CO')
    expect(image1.raw_url).to eq('https://images.unsplash.com/photo-1634507307799-ace9b49840b7?ixid=MnwyNzY0MzR8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkNDT3xlbnwwfHx8fDE2NDIxMTY5NzM&ixlib=rb-1.2.1')
    expect(image1.credit).to be_a Hash
    expect(image1.credit[:source]).to eq("https://unsplash.com/")
    expect(image1.credit[:photographer]).to eq("Dillon Wanner")
    expect(image1.credit[:photographer_profile_link]).to eq("https://unsplash.com/@dillydallying")
  end
end
