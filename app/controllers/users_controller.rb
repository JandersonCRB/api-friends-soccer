# frozen_string_literal: true

class UsersController < ApplicationController
  def sign_up
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def list
    render json: User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end
end
