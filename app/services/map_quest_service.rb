class MapQuestService
  class << self
    def conn
      Faraday.new(url: 'http://www.mapquestapi.com')
    end

    def mapquest_response(location)
      response = conn.get('/geocoding/v1/address') do |faraday|
        faraday.params['key'] = ENV['MAPQUEST_KEY']
        faraday.params['location'] = location
      end

      JSON.parse(response.body, symbolize_names: true)
    end

    def mapquest_data(location)
      mapquest_response(location)[:results].first
    end
  end
end
