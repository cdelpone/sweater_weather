class Api::V1::BreweriesController < ApplicationController
  def index
    render json: BreweriesFacade.get_brewery_data(brewery_params).to_json
  end

  private

  def brewery_params
    params.permit(:location, :quantity)
  end
end
