class Api::V1::ForecastController < ApplicationController
  def index
    # data = WeatherFacade.get_weather_data(params[:location])
    data = {
      current_weather: WeatherFacade.current_weather(params[:location]),
      daily_weather: WeatherFacade.daily_weather(params[:location]),
      hourly_weather: WeatherFacade.hourly_weather(params[:location])
    }
    render json: ForecastSerializer.serialize(data)
  end
end
# weather_data is an object (or collection of objects)
# @current, @hour, @day = weather_data = WeatherFacade.get_weather_data(params[:location])
# render json: ForecastSerializer.serialize(@current, @hour, @day)
