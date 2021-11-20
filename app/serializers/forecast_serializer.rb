class ForecastSerializer
  class << self
    def serialize(data)
      { data: {
              id: nil,
              type: 'forecast',
              attributes: {
                  current_weather: data[0],
                  daily_weather: data[1],
                  hourly_weather: data[2]
                          }
              }
      }
      #pass in objects to format for json
      #current_weather.temperature
    end
  end
end
# def serialize(@current, @hour, @day)
#   { data: {
#           id: nil,
#           type: 'forecast',
#           attributes: {
#               current_weather: @current,
#               daily_weather: @day,
#               hourly_weather: @hour
#                       }
#           }
#   }
