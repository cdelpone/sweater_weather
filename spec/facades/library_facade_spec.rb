require 'rails_helper'

RSpec.describe 'LibraryFacade', :vcr do
  it 'returns book data' do
    location = 'Denver,CO'

    book_data = LibraryFacade.books_data(location)

    expect(book_data).to be_a Hash
    expect(book_data[:docs]).to be_an Array
    expect(book_data[:numFound]).to be_an Integer

    book1 = book_data[:docs][0]

    expect(book1).to have_key(:title)
    expect(book1[:title]).to be_a String
    expect(book1).to have_key(:isbn)
    expect(book1[:isbn]).to be_an Array
    expect(book1).to have_key(:publisher)
    expect(book1[:publisher]).to be_an Array
  end

  it 'returns a book object' do
    location = 'Denver,CO'

    books = LibraryFacade.books(location)

    expect(books.first).to be_a Book

    book1 = books.first

    expect(book1.isbn).to be_an Array
    expect(book1.title).to be_a String
    expect(book1.publisher).to be_an Array
  end

  it 'returns a book object' do
    location = 'Denver,CO'
    book_count = LibraryFacade.num_of_books(location)

    expect(book_count).to be_an Integer
  end
end
