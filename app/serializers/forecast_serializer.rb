class ForecastSerializer
  class << self
    def serialize(location)
      weather_data = WeatherFacade.get_weather_data(location)
require "pry"; binding.pry
      #pass in objects to format for json
      #current_weather.temperature
        {
          current_weather: weather_data[:current_weather],
          hourly_weather: weather_data[:hourly_weather],
          daily_weather: weather_data[:daily_weather]
        }.to_json

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
