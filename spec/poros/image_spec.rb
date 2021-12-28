require 'rails_helper'
# testing guide:
    # - just like testing a plain old ruby class (mod 1)
    # - test attributes
    # - test methods
RSpec.describe Image do
  it 'creates an image poro' do
    image = {
            location: 'Denver, CO',
            raw_url: "https://pixabay.com/get/54e6d4444f50a814f1dc8460962930761c38d6ed534c704c7c2878dd954dc451_640.jpg",
            credit: {
                     source: "https://unsplash.com/?utm_source=your_app_name&utm_medium=referral",
                     photographer: "John Smith",
                     photographer_profile_link:"https://unsplash.com/@johnsmith?utm_source=your_app_name&utm_medium=referral"
                    }
            }

    image = Image.new(data)

    expect(image.location).to eq('Denver, CO')
    # expect(image.address).to eq('12345 Vine, Denver, CO, 80205')
    # expect(image.fuel_type).to eq('ELEC')
    # expect(image.access_times).to eq('never')
    # expect(image.distance).to eq('1.43 miles')
    # expect(image.travel_time).to eq('00:00:48')
    # expect(image.directions).to be_an Array
    # expect(image.directions[0]).to eq('left')
    # expect(image.directions[1]).to eq('right')
  end
end
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
#get location from params, use serializer to add params to this hash
#         "raw_url": "https://pixabay.com/get/54e6d4444f50a814f1dc8460962930761c38d6ed534c704c7c2878dd954dc451_640.jpg",
#         "credit": {
#           "source": "https://unsplash.com/?utm_source=your_app_name&utm_medium=referral",
#           "photographer": "John Smith",
#           "photographer_profile_link": "https://unsplash.com/@johnsmith?utm_source=your_app_name&utm_medium=referral"
#         }
#       }
#     }
#   }
# }
