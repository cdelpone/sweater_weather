class ForecastSerializer
  class << self
    def serialize(data)
      {
        current_weather: data[:current_weather],
        hourly_weather: data[:hourly_weather],
        daily_weather: data[:daily_weather]
      }
    end
  end
end
