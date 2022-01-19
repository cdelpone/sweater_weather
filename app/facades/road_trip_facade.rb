class RoadTripFacade
  class << self
    def travel_details(origin, destination)
      travel_details = {
          origin: origin,
          destination: destination,
          travel_time: travel_time(origin, destination),
          weather_at_eta: forecast_eta(origin, destination)
                      }

      RoadTrip.new(travel_details)
    end

    def travel_time(origin, destination)
      MapQuestFacade.mapquest_travel_time(origin, destination)
    end

    def forecast_eta(origin, destination)
      hour = WeatherFacade.forecast_eta(origin, destination)
      { conditions: hour.conditions, temperature: hour.temperature }
    end
  end
end
