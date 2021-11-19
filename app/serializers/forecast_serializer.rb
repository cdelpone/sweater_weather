class ForecastSerializer
  class << self
    def serialize(weather_data)
      { data: {
              id: nil,
              type: 'forecast',
              attributes: {
                  current_weather: weather_data[:current],
                  daily_weather: weather_data[:daily],
                  hourly_weather: weather_data[:hourly]
                          }
              }
      }
      #pass in objects to format for json
      #current_weather.temperature
    end
  end
end
