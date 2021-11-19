class ForecastSerializer
  class << self
    def serialize(weather_data)
      {
        data: {
                  id: null,
                  type: forecast,
                  attributes: {
                      current_weather:
                        {
                          weather_data[:current]
                        },
                      daily_weather: [
                        {
                          weather_data[:daily]
                        }
                      ],
                      hourly_weather: [
                        {
                          weather_data[:hourly]
                        }
                      ]
                  }
                }
      }
      require "pry"; binding.pry
      #pass in objects to format for json
      #current_weather.temperature
        {
          current_weather: weather_data[:current_weather],
          hourly_weather: weather_data[:hourly_weather],
          daily_weather: weather_data[:daily_weather]
        }.to_json
    end
  end
end
