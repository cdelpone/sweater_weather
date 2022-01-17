class Api::V1::SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    # return user if user && user.authenticate(params[:password])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(user)
    else
      render json: UserSerializer.verification_failed, status: 422
    end
  end

  def destroy
    session.clear
  end
end
