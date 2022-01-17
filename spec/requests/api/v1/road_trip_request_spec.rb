require 'rails_helper'

RSpec.describe 'RoadTripController', :vcr do
  it 'makes a successful call' do
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
