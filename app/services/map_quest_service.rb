class MapQuestService
  class << self
    def conn
      Faraday.new(url: 'http://www.mapquestapi.com')
    end

    def mapquest_geocoding_response(location)
      response = conn.get('/geocoding/v1/address') do |faraday|
        faraday.params['key'] = ENV['MAPQUEST_KEY']
        faraday.params['location'] = location
      end

      JSON.parse(response.body, symbolize_names: true)
    end

    def mapquest_geocoding_data(location)
      mapquest_geocoding_response(location)[:results].first
    end

    def mapquest_directions_response(origin, destination)
      response = conn.get('/directions/v2/route') do |faraday|
        faraday.params['key'] = ENV['MAPQUEST_KEY']
        faraday.params['from'] = origin
        faraday.params['to'] = destination
      end

      JSON.parse(response.body, symbolize_names: true)[:route]
    end
  end
end
