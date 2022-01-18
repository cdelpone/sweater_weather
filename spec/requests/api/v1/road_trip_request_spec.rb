require 'rails_helper'

RSpec.describe 'RoadTripController' do
  it 'makes a successful call' do
    # user = User.create(email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123', api_key: '132w4tergydfiuxbjght')

    rt_params = {
                  origin: "Denver,CO",
                  destination: "Pueblo,CO",
                  api_key: "jgn983hy48thw9begh98h4539h4"
                }

    post "/api/v1/road_trip", params: rt_params

    expect(response).to be_successful
    expect(response.status).to be 200
  end

  xit 'returns the expected rt info' do
    rt_params = {
                  origin: "Denver,CO",
                  destination: "Pueblo,CO",
                  api_key: "jgn983hy48thw9begh98h4539h4"
                }

    post "/api/v1/road_trip", params: rt_params

    road_trip = JSON.parse(response.body, symbolize_names: true)
  end
end
