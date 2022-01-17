class Api::V1::UsersController < ApplicationController

  def new; end

  def create
    user = User.find_by(email: params[:email])
    # if there's not a user, create it and then render json
    unless user
      user = User.create!(user_params.merge({ api_key: User.api_key }))
    end
    # if there is a user, redirect to the sessions controller (or sessions method?) to authenticate
    render json: UserSerializer.new(user), status: 201
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
