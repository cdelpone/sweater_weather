class Api::V1::ForecastController < ApplicationController
  def index
    render json: WeatherFacade.get_weather_data(params[:location]).to_json
  end
end
