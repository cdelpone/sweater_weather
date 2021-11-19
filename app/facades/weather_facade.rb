class WeatherFacade
  class << self
    def get_weather_data(location)
      location_data = MapQuestFacade.get_lat_lng(location)
      weather_data = WeatherService.weather_data(location_data.latitude, location_data.longitude)

      # Current.new(weather_data)
      # Hourly.new(weather_data)
      # Daily.new(weather_data)

        # attributes(weather_data)
    end

    def attributes(weather_data)
      { current_weather: Current.new(weather_data[:current]),
        hourly_weather: hourly_weather(weather_data[:hourly]),
        daily_weather: daily_weather(weather_data[:daily]),
      }
    end
  end
end
