require 'rails_helper'

RSpec.describe 'RoadTripController', :vcr do
  it 'sends a successful response' do
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

  it 'creates a roadtrip response' do
    user = User.create!(email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123', api_key: "jgn983hy48thw9begh98h4539h4")
    rt_params = {
                  origin: "Denver,CO",
                  destination: "Pueblo,CO",
                  api_key: user.api_key
                }
    headers = { CONTENT_TYPE: "application/json", Accept: "application/json" }

    post "/api/v1/road_trip", headers: headers, params: rt_params.to_json

    road_trip = JSON.parse(response.body, symbolize_names: true)

    expect(road_trip).to be_a Hash
    expect(road_trip).to have_key :data

    expect(road_trip[:data]).to have_key :id
    expect(road_trip[:data][:id]).to eq(nil)

    expect(road_trip[:data]).to have_key :type
    expect(road_trip[:data][:type]).to eq("roadtrip")

    expect(road_trip[:data]).to have_key :attributes

    expect(road_trip[:data][:attributes]).to have_key :start_city
    expect(road_trip[:data][:attributes][:start_city]).to eq(rt_params[:origin])
    expect(road_trip[:data][:attributes]).to have_key :end_city
    expect(road_trip[:data][:attributes][:end_city]).to eq(rt_params[:destination])

    expect(road_trip[:data][:attributes]).to have_key :travel_time
    expect(road_trip[:data][:attributes][:travel_time]).to be_a String

    expect(road_trip[:data][:attributes]).to have_key :weather_at_eta
    expect(road_trip[:data][:attributes][:weather_at_eta]).to be_a Hash
    expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key :temperature
    expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key :conditions

    expect(road_trip).not_to have_key :api_key
    expect(road_trip[:data]).not_to have_key :api_key
    expect(road_trip[:data][:attributes]).not_to have_key :api_key
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
    expect(road_trip).to have_key :errors
    expect(road_trip[:errors]).to eq("Unauthorized")
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
    expect(road_trip).to have_key :errors
    expect(road_trip[:errors]).to eq("Unauthorized")
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
