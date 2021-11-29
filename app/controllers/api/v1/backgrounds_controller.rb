class Api::V1::BackgroundsController < ApplicationController
  def index
    ImagesService.image_data(background_params)
    require "pry"; binding.pry
  end

  private

  def background_params
    params.permit(:location)
  end
end
