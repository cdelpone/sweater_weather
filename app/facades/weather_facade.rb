class WeatherFacade
  class << self
    def weather_data(location)
      location_data = MapQuestFacade.location_data(location)
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

    def forecast_eta(origin, destination)
      travel_time = MapQuestFacade.mapquest_travel_time(origin, destination)
      arrival = travel_time.to_i.round - 1
      arrival_hour = weather_data(destination)[:hourly][arrival]
      Hour.new(arrival_hour)
    end
  end
end
