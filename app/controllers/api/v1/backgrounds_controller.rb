class Api::V1::BackgroundsController < ApplicationController
  def index
    image = BackgroundFacade.image_data(background_params)
    # require "pry"; binding.pry
    render json: ImageSerializer.new(image)
  end

  private

  def background_params
    params.permit(:location)
  end
end
