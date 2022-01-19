require 'rails_helper'

RSpec.describe 'BookSearchController', :vcr do
  it 'makes a successful call' do
    location = 'Denver,CO'
    quantity = 5

    get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"

    books = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to be 200
  end

  it 'serialized with attributes' do
    location = 'Denver,CO'
    quantity = 5

    get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"

    books = JSON.parse(response.body, symbolize_names: true)
    expect(books).to have_key :data
    expect(books[:data]).to have_key :id
    expect(books[:data]).to have_key :type
    expect(books[:data][:type]).to eq("books")
    expect(books[:data]).to have_key :attributes
    expect(books[:data][:attributes]).to have_key :forecast
    expect(books[:data][:attributes]).to have_key :destination
    expect(books[:data][:attributes]).to have_key :total_books_found
    expect(books[:data][:attributes]).to have_key :books
    expect(books[:data][:attributes][:forecast]).to have_key :summary
    expect(books[:data][:attributes][:forecast]).to have_key :temperature
    expect(books[:data][:attributes][:books][0]).to have_key :isbn
    expect(books[:data][:attributes][:books][0]).to have_key :title
    expect(books[:data][:attributes][:books][0]).to have_key :publisher
    expect(books[:data][:attributes][:destination]).to eq(location)
  end
end
