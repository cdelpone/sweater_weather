class BreweriesService
  class << self
    def brewery_data(city, state)
      conn = Faraday.new(url: 'https://api.openbrewerydb.org')

      response = conn.get('/breweries') do |faraday|
        faraday.params['by_city'] = city
        faraday.params['by_state'] = state
      end

      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
