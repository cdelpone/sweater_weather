require 'rails_helper'

RSpec.describe 'RoadTripFacade', :vcr do
  it 'returns a rt object' do
    user = User.create(email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123', api_key: '132w4tergydfiuxbjght')

    origin = 'Denver,CO'
    destination = 'Estes Park, CO'

    rt_obj = RoadTripFacade.travel_details(origin, destination)
    expect(rt_obj).to be_a RoadTrip
  end
end
