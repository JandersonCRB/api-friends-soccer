# frozen_string_literal: true

module Users
  class SignUp
    prepend SimpleCommand

    def initialize(params)
      @params = params
    end

    def call
      Rails.logger.info("Sign up with params=#{@params}")
      user = create_user

      token = Auth::Helpers.generate_token(user)
      # TODO: SEND EMAIL\
      # send_email(user)

      { token: token, user: user }
    end

    private

    def create_user
      User.create!(create_user_params)
    end

    def create_user_params
      {
        first_name: @params[:first_name],
        last_name: @params[:last_name],
        email: @params[:email],
        password: @params[:password]
      }
    end
  end
end
