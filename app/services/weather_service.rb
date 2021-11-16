class WeatherService
  class << self
    def weather_data(lat,lon)
      conn = Faraday.new(url: 'https://api.openweathermap.org')

      response = conn.get('/data/2.5/onecall') do |faraday|
        faraday.params['appid'] = ENV['OPEN_WEATHER_KEY']
        faraday.params['lat'] = lat
        faraday.params['lon'] = lon
        faraday.params['exclude'] = 'minutely'
      end

      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
