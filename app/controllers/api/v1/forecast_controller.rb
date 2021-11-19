class Api::V1::ForecastController < ApplicationController
  def index
    weather_data = WeatherFacade.get_weather_data(params[:location])
# weather_data is an object (or collection of objects)
    render json: ForecastSerializer.serialize(weather_data)
  end
end
