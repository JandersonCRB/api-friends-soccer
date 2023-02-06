# frozen_string_literal: true

class AuthController < ApplicationController
  def login
    user = User.find_by(email: auth_params[:email])
    if user&.authenticate(auth_params[:password])
      render json: user
    else
      render json: { error: "Wrong email or password" }, status: :bad_request
    end
  end

  private

  def auth_params
    params.require(:auth).permit(:email, :password)
  end
end
