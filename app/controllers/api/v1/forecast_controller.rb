class Api::V1::ForecastController < ApplicationController
  def index
    result = MapQuestFacade.get_lat_lng(params[:location])
  end
end
