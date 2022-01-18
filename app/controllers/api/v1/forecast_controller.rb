class Api::V1::ForecastController < ApplicationController
  def index
    data = {
              current_weather: WeatherFacade.current_weather(params[:location]),
              daily_weather: WeatherFacade.daily_weather(params[:location]),
              hourly_weather: WeatherFacade.hourly_weather(params[:location])
            }
  
    render json: ForecastSerializer.serialize(data)
  end
end
