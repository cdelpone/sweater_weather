class MapQuestService
  class << self
    def mapquest_data(location)
      conn = Faraday.new(url: 'http://www.mapquestapi.com')

      response = conn.get('/geocoding/v1/address') do |faraday|
        faraday.params['key'] = ENV['MAPQUEST_KEY']
        faraday.params['location'] = location
      end

      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
