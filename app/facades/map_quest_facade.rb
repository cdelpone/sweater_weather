class MapQuestFacade
  class << self
    def lat_lon(location)
      location_data = mapquest_geocoding_data(location)

      data =  {
              latitude: location_data[:locations][0][:latLng][:lat],
              longitude: location_data[:locations][0][:latLng][:lng],
              provided_location: location_data[:providedLocation][:location]
            }
    end

    def location_data(location)
      Location.new(lat_lon(location))
    end

    def mapquest_geocoding_data(location)
      MapQuestService.mapquest_geocoding_data(location)
    end

    def mapquest_travel_time(origin, destination)
      MapQuestService.mapquest_directions_response(origin, destination)[:formattedTime]
    end
  end
end
