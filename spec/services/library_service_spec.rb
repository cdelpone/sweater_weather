require 'rails_helper'

RSpec.describe 'LibraryService' do
  it 'can get data on books', :vcr do
    location = 'Denver,CO'

    books_data = LibraryService.search_books(location)

    expect(books_data).to be_a Hash
    expect(books_data[:docs]).to be_an Array
    expect(books_data[:numFound]).to be_an Integer

    book1 = books_data[:docs][0]

    expect(book1).to have_key(:title)
    expect(book1[:title]).to be_a String
    expect(book1).to have_key(:isbn)
    expect(book1[:isbn]).to be_an Array
    expect(book1).to have_key(:publisher)
    expect(book1[:publisher]).to be_an Array
  end
end
