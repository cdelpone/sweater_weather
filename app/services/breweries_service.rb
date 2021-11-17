class BreweriesService
  class << self
    def brewery_data(city)
      conn = Faraday.new(url: 'https://api.openbrewerydb.org')

      response = conn.get('/breweries') do |faraday|
        faraday.params['by_city'] = city
      end

      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
