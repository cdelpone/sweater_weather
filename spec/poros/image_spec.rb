require 'rails_helper'
# testing guide:
    # - just like testing a plain old ruby class (mod 1)
    # - test attributes
    # - test methods
RSpec.describe Image do
  it 'creates an image poro' do
    data = {
            location: 'Denver, CO',
            raw_url: "https://pixabay.com/get/54e6d4444f50a814f1dc8460962930761c38d6ed534c704c7c2878dd954dc451_640.jpg",
            credit: {
                     source: "https://unsplash.com/",
                     photographer: "John Smith",
                     photographer_profile_link: "https://unsplash.com/@johnsmith?utm_source=your_app_name&utm_medium=referral"
                    }
            }
    # image1 = Image.new(data)

    # expect(image1.location).to eq('Denver, CO')
    # expect(image1.raw_url).to eq('https://pixabay.com/get/54e6d4444f50a814f1dc8460962930761c38d6ed534c704c7c2878dd954dc451_640.jpg')
    # expect(image1.credit).to be_a Hash
    # expect(image1.source).to eq("https://unsplash.com/")
    # expect(image1.photographer).to eq("John Smith")
    # expect(image1.photographer_profile_link).to eq("https://unsplash.com/@johnsmith?utm_source=your_app_name&utm_medium=referral")
  end
end
