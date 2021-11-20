class Api::V1::ForecastController < ApplicationController
  def index
    data = WeatherFacade.get_weather_data(params[:location])
    render json: ForecastSerializer.serialize(data)
  end
end
# weather_data is an object (or collection of objects)
# @current, @hour, @day = weather_data = WeatherFacade.get_weather_data(params[:location])
# render json: ForecastSerializer.serialize(@current, @hour, @day)
