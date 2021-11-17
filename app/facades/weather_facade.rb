class WeatherFacade
  class << self
    def get_weather_data(location)
      location_data = MapQuestFacade.get_lat_lng(location)
      weather_data = WeatherService.weather_data(location_data.latitude, location_data.longitude)
      attributes(weather_data)
    end

    def attributes(weather_data)
      {
        data: {
                id: nil,
                type: 'forecast',
                attributes: {
                    current_weather: Current.new(weather_data[:current]),
                    hourly_weather: hourly_weather(weather_data[:hourly]),
                    daily_weather: daily_weather(weather_data[:daily]),
                    }
            }
      }
    end

    def hourly_weather(weather_data)
      weather_data[0..7].map do |data|
        Hourly.new(data)
      end
    end

    def daily_weather(weather_data)
      weather_data[0..4].map do |data|
        Daily.new(data)
      end
    end
  end
end
