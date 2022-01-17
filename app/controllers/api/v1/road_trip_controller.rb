class Api::V1::RoadTripsController < ApplicationController
  def create
    rt = RoadTripFacade.rt_data(rt_params)

    render json: RoadTripSerializer.new(rt)
  end

  private

  def rt_params
    params.permit(:origin, :destination, :api_key)
  end
end
