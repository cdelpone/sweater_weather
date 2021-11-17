class BreweriesFacade
  class << self
    def  get_brewery_data(brewery_params)
      city = brewery_params[:location].split(',').first
      quantity = brewery_params[:quantity]
      brewery_data = BreweriesService.brewery_data(city)
      location_data = MapQuestFacade.get_lat_lng(location)
      weather_data = WeatherService.weather_data(location_data.latitude, location_data.longitude)
      provided_location = location_data.provided_location
      attributes(weather_data, provided_location)
    end

    def brewery_data(brewery_data)
      brewery_data.map do |data|
        Brewery.new(data)
      end
    end

    def attributes(weather_data, provided_location, brewery_data)
      null = nil
      {
        data: {
                id: nil,
                type: 'breweries',
                attributes: {
                    destination: provided_location,
                    forecast: forecast,
                    breweries: brewery_data(brewery_data).take(quantity)
                    }
            }
      }
    end

    def forecast(weather_data)
      current_weather = weather_data[:data][:attributes][:current_weather]
      {
        summary: current_weather.conditions,
        temperature: current_weather.temperature
      }
    end
  end
end
