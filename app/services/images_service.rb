class ImagesService
  class << self
    def search_by_location(location)
      conn = Faraday.new(url: 'https://api.unsplash.com')

      response = conn.get("/search/photos?page=1&per_page=1&query=#{location}") do |faraday|
        faraday.params['client_id'] = ENV['UNSPLASH_KEY']
      end

      image = JSON.parse(response.body, symbolize_names: true)

      image[:results].first
    end
    # def conn
    #   Faraday.new(url: 'https://api.unsplash.com')
    # end
    #
    # def parse_data(response)
    #   JSON.parse(response.body, symbolize_names: true)
    # end
    #
    # def get_image(location)
    #   image = parse_data(search_location(location))
    #   image[:results].first
    # end
    #
    # def search_by_location(location)
    #   conn.get("/search/photos?page=1&per_page=1&query=#{location}") do |faraday|
    #     faraday.params['client_id'] = ENV['UNSPLASH_KEY']
    #   end
    # end
  end
end
