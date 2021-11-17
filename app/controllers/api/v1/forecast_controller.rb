class Api::V1::ForecastController < ApplicationController
  def index
    data = WeatherFacade.get_weather_data(params[:location])
    render json: ForecastSerializer.new(data)
  end
end
