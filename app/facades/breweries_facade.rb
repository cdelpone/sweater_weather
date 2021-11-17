class BreweriesFacade
  class << self
    def  get_brewery_data(location)
      city = location.split(',').first
      state = location.split(',').last
      brewery_data = BreweriesService.brewery_data(city, state)
      location_data = MapQuestFacade.get_lat_lng(location)
      weather_data = WeatherService.weather_data(location_data.latitude, location_data.longitude)
      provided_location = location_data.provided_location
      attributes(weather_data, provided_location)
    end

    def brewery_data(brewery_data)
      brewery_data[0..4].map do |data|
        Brewery.new(data)
      end
    end

    def attributes(weather_data, provided_location)
      null = nil
      {
        data: {
                id: nil,
                type: 'breweries',
                attributes: {
                    destination: provided_location,
                    forecast: forecast,
                    breweries: brewery_data(provided_location)
                    }
            }
      }
    end

    def forecast(weather_data)
      {
        summary: 'current_weather data description',
        temperature: 'current_weather data temperature'
      }
    end

    def all_breweries(location)
      city = location.split(',').first
      state = location.split(',').last
      brewery_data = BreweriesService.brewery_data(city, state)
      brewery_data[0..4]
    end


    # def current_weather(weather_data)
    #   {
    #     date_time: weather_data[:dt],
    #     sunrise: weather_data[:sunrise],
    #     sunset: weather_data[:sunset],
    #     temp: weather_data[:temp],
    #     feels_like: weather_data[:feels_like],
    #     humidity: weather_data[:humidity],
    #     uvi: weather_data[:uvi],
    #     visibility: weather_data[:visibility],
    #     weather: weather_data[:weather],
    #     conditions: weather_data[:weather][0][:description],
    #     icon: weather_data[:weather][0][:icon]
    #   }
    # end
  end
end
