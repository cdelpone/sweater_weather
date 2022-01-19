class LibraryService
  class << self
    def conn
      conn = Faraday.new(url: 'http://openlibrary.org/')
    end

    def search_books(location)
      response = conn.get("search.json?q=#{location}")
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
