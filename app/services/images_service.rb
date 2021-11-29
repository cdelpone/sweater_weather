class ImagesService
  class << self
    def image_data(location)
      conn = Faraday.new(url: 'https://api.unsplash.com')

      response = conn.get('/search/photos?page=1&per_page=1') do |faraday|
        faraday.params['client_id'] = ENV['UNSPLASH_KEY']
        faraday.params['query'] = location
      end

      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
