class WeatherFacade
  class << self

    def get_weather_data(location)
      location_data = MapQuestFacade.get_lat_lng(location)
      weather_data = WeatherService.weather_data(location_data.latitude, location_data.longitude)
      weather_collection(weather_data)
    end

    def weather_collection(weather_data)
      [Current.new(weather_data), daily_weather_poro(weather_data), hourly_weather_poro(weather_data)]
    end

    def daily_weather_poro(weather_data)
      weather_data[:daily][0..4].map do |data|
        Day.new(data)
      end
    end

    def hourly_weather_poro(weather_data)
      weather_data[:hourly][0..7].map do |data|
        Hour.new(data)
      end
    end
  end
end
# def for_controller(location)
#   weather_data = get_weather_data(location)
#   create_poros(weather_data)
# end
# def get_weather_data(location)
#   location_data = MapQuestFacade.get_lat_lng(location)
#   weather_data = WeatherService.weather_data(location_data.latitude, location_data.longitude)
# end
# def create_poros(weather_data)
  # {
  #   current: Current.new(weather_data[:current]),
  #   daily: daily_weather_poro(weather_data),
  #   hourly: hourly_weather_poro(weather_data)
  # }
# end
