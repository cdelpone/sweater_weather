class BreweriesFacade
  class << self
    def  get_brewery_data(brewery_params)
      city = brewery_params[:location].split(',').first
      brewery_data = BreweriesService.brewery_data(city)
      location_data = MapQuestFacade.get_lat_lng(brewery_params[:location])
      weather_data = WeatherFacade.get_weather_data(brewery_params[:location])
      attributes(weather_data, brewery_params, brewery_data)
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
                    breweries: brewery(brewery_data).take(brewery_params[:quantity].to_i)
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
