class WeatherFacade
  class << self
    def get_weather_data(location)
      location_data = MapQuestFacade.get_lat_lng(location)
      weather_data = WeatherService.weather_data(location_data.latitude, location_data.longitude)
      attributes(weather_data)
    end

    def attributes(weather_data)
      null = nil
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
