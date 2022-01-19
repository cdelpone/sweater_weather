class ImagesService
  class << self
    def search_by_location(location)
      response = conn.get("/search/photos?page=1&per_page=1&query=#{location}") do |faraday|
        faraday.params['client_id'] = ENV['UNSPLASH_KEY']
      end

      image = JSON.parse(response.body, symbolize_names: true)

      image[:results].first
    end

    def conn
      Faraday.new(url: 'https://api.unsplash.com')
    end
  end
end
