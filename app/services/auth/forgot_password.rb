# frozen_string_literal: true

module Auth
  class ForgotPassword
    prepend SimpleCommand

    def initialize(params)
      @params = params
    end

    def call
      Rails.logger.info("Forgot password with params=#{@params}")
      user = fetch_user
      password_reset = create_password_reset(user)
      send_email(user, password_reset)
    end

    private

    def fetch_user
      user = User.find_by(email: @params[:email])
      if user.nil?
        raise(Exceptions::CustomError.new(Exceptions::ErrorMessages::NOT_FOUND,
                                          Exceptions::ErrorCodes::NOT_FOUND,
                                          404))
      end
      user
    end

    def create_password_reset(user)
      PasswordReset.where(user: user).destroy_all
      PasswordReset.create!(user: user, token: PasswordReset.generate_unique_token(user.id),
                           expires_at: Time.now + 1.day)
    end

    def send_email(user, password_reset)
      UserMailer.forgot_password(user, password_reset).deliver_now
    end
  end
end
