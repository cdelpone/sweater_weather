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
            weather_at_eta: impossible_route(data)
          }
        }
      }
    end

    def errors
      { "errors": "Unauthorized" }
    end

    def impossible_route(data)
      if data.travel_time == "Impossible route"
          { }
      else
        {
          temperature: data.weather_at_eta[:temperature],
          conditions: data.weather_at_eta[:conditions]
        }
      end
    end
  end
end
