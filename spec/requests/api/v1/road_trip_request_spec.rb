require 'rails_helper'

RSpec.describe 'RoadTripController', :vcr do
  it 'makes a successful call' do
    user = User.create!(email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123', api_key: "jgn983hy48thw9begh98h4539h4")
    rt_params = {
                  origin: "Denver,CO",
                  destination: "Pueblo,CO",
                  api_key: user.api_key
                }
    headers = { CONTENT_TYPE: "application/json", Accept: "application/json" }

    post "/api/v1/road_trip", headers: headers, params: rt_params.to_json

    expect(response).to be_successful
    expect(response.status).to be 200
  end

  it 'makes a successful call' do
    user = User.create!(email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123', api_key: "jgn983hy48thw9begh98h4539h4")
    rt_params = {
                  origin: "Denver,CO",
                  destination: "Pueblo,CO",
                  api_key: user.api_key
                }
    headers = { CONTENT_TYPE: "application/json", Accept: "application/json" }

    post "/api/v1/road_trip", headers: headers, params: rt_params.to_json

    road_trip = JSON.parse(response.body, symbolize_names: true)

    expect(road_trip).to have_key :data
  end

  it 'returns an error message when user isnt authorized' do
    rt_params = {
                  origin: "Denver,CO",
                  destination: "Pueblo,CO",
                  api_key: "jgn983hy48thw9begh98h4539h4"
                }

    headers = { CONTENT_TYPE: "application/json", Accept: "application/json" }

    post "/api/v1/road_trip", params: rt_params

    road_trip = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(401)
    expect(road_trip).to have_key :message
    expect(road_trip[:message]).to eq("Invalid credentials; please try again.")
  end

  it 'returns an error message if the api key is missing' do
    rt_params = {
                  origin: "Denver,CO",
                  destination: "Pueblo,CO"
                }

    headers = { CONTENT_TYPE: "application/json", Accept: "application/json" }

    post "/api/v1/road_trip", params: rt_params

    road_trip = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(401)
    expect(road_trip).to have_key :message
    expect(road_trip[:message]).to eq("Invalid credentials; please try again.")
  end

  it 'sends route is impossible for travel time' do
    user = User.create!(email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123', api_key: "jgn983hy48thw9begh98h4539h4")
    rt_params = {
                  origin: "Denver,CO",
                  destination: "honolulu, hi",
                  api_key: "jgn983hy48thw9begh98h4539h4"
                }

    headers = { CONTENT_TYPE: "application/json", Accept: "application/json" }

    post "/api/v1/road_trip", params: rt_params

    road_trip = JSON.parse(response.body, symbolize_names: true)

    expect(road_trip[:data][:attributes][:travel_time]).to eq("Impossible route")
    expect(road_trip[:data][:attributes][:weather_at_eta]).to eq({})
  end
end
