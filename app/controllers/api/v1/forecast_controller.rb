class Api::V1::ForecastController < ApplicationController
  def index
    # weather_data = WeatherFacade.get_weather_data(params[:location])
    render json: ForecastSerializer.serialize(params[:location])
  end
end
