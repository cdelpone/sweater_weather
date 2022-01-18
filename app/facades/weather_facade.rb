class WeatherFacade
  class << self
    def weather_data(location)
      location_data = MapQuestFacade.get_lat_lng(location)
      WeatherService.weather_data(location_data.latitude, location_data.longitude)
    end

    def current_weather(location)
      Current.new(weather_data(location))
    end

    def daily_weather(location)
      weather_data(location)[:daily][0..4].map do |data|
        Day.new(data)
      end
    end

    def hourly_weather(location)
      weather_data(location)[:hourly][0..7].map do |data|
        Hour.new(data)
      end
    end
  end
end
