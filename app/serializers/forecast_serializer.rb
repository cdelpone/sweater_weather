class ForecastSerializer
  class << self
    def serialize(data)
      {
        data: {
              id: nil,
              type: 'forecast',
              attributes: {
                  current_weather: data[:current_weather],
                  daily_weather: data[:daily_weather],
                  hourly_weather: data[:hourly_weather]
                          }
              }
      }
    end
  end
end
