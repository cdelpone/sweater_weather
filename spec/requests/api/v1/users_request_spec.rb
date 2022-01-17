require 'rails_helper'

RSpec.describe 'User Requests' do
  describe 'post /users' do
    it 'creates a new user when there is no user with a matching email and returns that user' do
      user_params =
        {
          email: 'pesto@fakeemail.com',
          password: "password123",
          password_confirmation: "password123"
        }

      post '/api/v1/users/', params: user_params

      expect(response).to have_http_status(:success)

      expect(response.status).to eq 201

      user = User.find_by(email: 'pesto@fakeemail.com')

      expect(user.email).to eq 'pesto@fakeemail.com'
      expect(user.api_key).not_to be_empty

      body = JSON.parse(response.body, symbolize_names: true)

      attributes = body[:data][:attributes]

      expect(attributes.count).to eq 2
      expect(attributes[:email]).to eq user.email
      expect(attributes[:api_key]).to eq user.api_key
    end

    it 'returns the existing user if the user already exists' do
      user = User.create(email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123', api_key: '132w4tergydfiuxbjght')

      post '/api/v1/users/', params: { email: 'pesto@fakeemail.com' }

      body = JSON.parse(response.body, symbolize_names: true)

      attributes = body[:data][:attributes]

      expect(body[:data][:id]).to eq "#{user.id}"
      expect(attributes.count).to eq 2
      expect(attributes[:email]).to eq user.email
      expect(attributes[:api_key]).to eq user.api_key
    end

    it 'returns an error if the user cannot be saved' do
      post '/api/v1/users', params: {}

      expect(response).to have_http_status 422
      expect(response.body).to match(/Validation failed: Email can't be blank, Password confirmation can't be blank, Password digest can't be blank, Password can't be blank/)
    end

    it 'returns an error if params are missing' do
      post '/api/v1/users/', params: { email: 'pesto@fakeemail.com' }

      expect(response).to have_http_status 422
      expect(response.body).to match(/Validation failed: Password confirmation can't be blank, Password digest can't be blank, Password can't be blank/)
    end

    it 'returns an error if email params are missing' do
      post '/api/v1/users/', params: { password: 'password123', password_confirmation: 'password123' }

      expect(response).to have_http_status 422
      expect(response.body).to match(/Validation failed: Email can't be blank/)
    end

    it 'returns an error if password confirmation params are missing' do
      post '/api/v1/users/', params: { email: 'pesto@fakeemail.com', password: 'password123' }

      expect(response).to have_http_status 422
      expect(response.body).to match(/Validation failed: Password confirmation can't be blank/)
    end

    it 'returns an error if params are incorrect' do
      post '/api/v1/users/', params: { email: 'pesto@fakeemail.com', password_confirmation: 'password123' }

      expect(response).to have_http_status 422
      expect(response.body).to match(/Validation failed: Password confirmation doesn't match Password, Password digest can't be blank, Password can't be blank/)
    end
  end
end
