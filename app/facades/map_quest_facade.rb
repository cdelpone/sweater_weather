class MapQuestFacade
  class << self
    def get_lat_lng(location)
      location_data = mapquest_data(location)

      data =  {
              latitude: location_data[:results][0][:locations][0][:latLng][:lat],
              longitude: location_data[:results][0][:locations][0][:latLng][:lng],
              provided_location: location_data[:results][0][:providedLocation][:location]
            }

      Location.new(data)
    end

    def mapquest_data(location)
      MapQuestService.mapquest_data(location)
    end
  end
end
