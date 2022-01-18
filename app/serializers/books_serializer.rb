class BooksSerializer
  class << self
    def serialize(data, location)
      { data: {
              id: nil,
              type: 'books',
              attributes: {
                  destination: location,
                  forecast: forecast(data),
                  total_books_found: data[:count],
                  books: data[:book]
                          }
              }
      }
    end

    def forecast(data)
      {
        summary: data[:weather].first.conditions,
        temperature: data[:weather].first.temperature
      }
    end
  end
end
