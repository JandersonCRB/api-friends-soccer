# frozen_string_literal: true

module Auth
  class Login
    prepend SimpleCommand

    def initialize(params)
      @params = params
    end

    def call
      Rails.logger.info("Logging in user with params=#{@params}")
      user = fetch_user
      validate_user_password(user)
      token = Auth::Helpers.generate_token(user)
      { token: token, user: user }
    end

    private

    def fetch_user
      user = User.find_by(email: @params[:email])
      if user.nil?
        raise(Exceptions::CustomError.new(Exceptions::ErrorMessages::WRONG_CREDENTIALS,
                                          Exceptions::ErrorCodes::WRONG_CREDENTIALS,
                                          404))
      end
      user
    end

    def validate_user_password(user)
      return if user.authenticate(@params[:password])

      raise(Exceptions::CustomError.new(Exceptions::ErrorMessages::WRONG_CREDENTIALS,
                                        Exceptions::ErrorCodes::WRONG_CREDENTIALS,
                                        404))
    end
  end
end
