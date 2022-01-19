class RoadTripSerializer
  class << self
    def serialize(data, origin, destination)
      {
        data: {
          id: nil,
          type: 'roadtrip',
          attributes: {
            start_city: origin,
            end_city: destination,
            travel_time: travel_time(data),
            weather_eta: {
              temperature: weather_eta(data).temperature,
              conditions: weather_eta(data).conditions
            }
          }
        }
      }
    end

    def travel_time(data)
      data[:travel_time][:formattedTime]
    end

    def weather_eta(data)
      data[:forecast_weather]
    end
  end
end
