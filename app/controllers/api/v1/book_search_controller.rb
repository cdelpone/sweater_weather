class Api::V1::BookSearchController < ApplicationController
  def index
    data = {
      count: LibraryFacade.num_of_books(params[:location]),
      book: LibraryFacade.books(params[:location], params[:quantity]),
      weather: WeatherFacade.get_weather_data(params[:location])
    }
    render json: BooksSerializer.serialize(data, params[:location])
  end

  private

  def book_params
    params.permit(:location, :quantity)
  end
end
