require 'rails_helper'

RSpec.describe 'Session Requests' do
  describe 'post api/v1/sessions' do
    it 'returns an existing user' do
      user = User.create(email: 'pesto@fakeemail.com', password: 'password123', password_confirmation: 'password123', api_key: '132w4tergydfiuxbjght')
      user_params = {
                      email: 'pesto@fakeemail.com',
                      password: "password123",
                    }
      post '/api/v1/sessions', params: user_params
      body = JSON.parse(response.body, symbolize_names: true)
      attributes = body[:data][:attributes]

      expect(response).to have_http_status(:success) 
      expect(user.email).to eq 'pesto@fakeemail.com'
      expect(user.api_key).not_to be_empty
      expect(body[:data][:id]).to eq "#{user.id}"
      expect(response.status).to eq 200
      expect(attributes.count).to eq 2
      expect(attributes[:email]).to eq user.email
      expect(attributes[:api_key]).to eq user.api_key
    end

    it 'returns an error if the user uses the wrong credentials' do
      post '/api/v1/sessions/', params: { email: 'pesto@fakeemail.com', password: 'wrong password' }

      expect(response).to have_http_status 422
      expect(response.body).to match(/Invalid credentials; please try again./)
    end

    it 'returns an error if params are missing' do
      post '/api/v1/sessions/', params: { email: 'pesto@fakeemail.com' }

      expect(response).to have_http_status 422
      expect(response.body).to match(/Invalid credentials; please try again./)
    end

    it 'returns an error if params are missing' do
      post '/api/v1/users', params: {}

      expect(response).to have_http_status 422
      expect(response.body).to match(/Validation failed: Email can't be blank/)
    end
  end
end
