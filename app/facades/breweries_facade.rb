class BreweriesFacade
  class << self
    def  get_brewery_data(brewery_params)
      city = brewery_params[:location].split(',').first
      quantity = brewery_params[:quantity]
      brewery_data = BreweriesService.brewery_data(city)
      location_data = MapQuestFacade.get_lat_lng(location)
      weather_data = WeatherService.weather_data(location_data.latitude, location_data.longitude)
      attributes(weather_data, brewery_params)
    end

    def brewery(brewery_data)
      brewery_data.map do |data|
        Brewery.new(data)
      end
    end

    def attributes(weather_data, brewery_params, brewery_data)
      null = nil
      {
        data: {
                id: nil,
                type: 'breweries',
                attributes: {
                    destination: brewery_params[:location],
                    forecast: forecast(weather_data),
                    breweries: brewery(brewery_data).take(brewery_params[:quantity])
                    }
            }
      }
    end

    def forecast(weather_data)
      current_weather = weather_data[:data][:attributes][:current_weather]
      {
        summary: current_weather.conditions,
        temperature: "#{current_weather.temperature} F"
      }
    end
  end
end
