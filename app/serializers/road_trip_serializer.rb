class RoadTripSerializer
  class << self
    def serialize(data)
      {
        data: {
          id: nil,
          type: 'roadtrip',
          attributes: {
            start_city: data.start_city,
            end_city: data.end_city,
            travel_time: data.travel_time,
            weather_eta: {
              temperature: data.weather_at_eta[:temperature],
              conditions: data.weather_at_eta[:conditions]
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
