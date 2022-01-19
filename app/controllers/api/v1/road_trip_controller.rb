class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: rt_params[:api_key])

    if user && rt_params[:api_key].present?
      roadtrip_data = RoadTripFacade.travel_details(params[:origin], params[:destination])
      render json: RoadTripSerializer.serialize(roadtrip_data)
    else
      render json: { errors: "Invalid credentials" }
    end
  end

  private

  def rt_params
    params.permit(:origin, :destination, :api_key)
  end
end
