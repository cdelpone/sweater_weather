class LibraryFacade
  def self.books_data(location)
    LibraryService.search_books(location)
  end

  def self.num_of_books(location)
    books_data = books_data(location)
    books_data[:numFound]
  end

  def self.books(location, quantity)
    books_data = books_data(location)

    books_data[:docs][1..(quantity.to_i)].map do |data|
      Book.new(data)
    end
  end
end
