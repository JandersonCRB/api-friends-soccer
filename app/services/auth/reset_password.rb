# frozen_string_literal: true

module Auth
  class ResetPassword
    prepend SimpleCommand

    def initialize(params)
      @params = params
    end

    def call
      password_reset = fetch_password_reset
      validate_password_reset(password_reset)

      change_password(password_reset)
    end

    private

    def fetch_password_reset
      token = PasswordReset.find_by(token: @params[:token])
      if token.nil?
        raise(Exceptions::CustomError.new(Exceptions::ErrorMessages::INVALID_TOKEN,
                                          Exceptions::ErrorCodes::INVALID_TOKEN,
                                          400))
      end
      token
    end

    def validate_password_reset(password_reset)
      validate_expiration(password_reset)
      validate_mismatch
    end

    def validate_expiration(password_reset)
      return unless password_reset.expires_at < Time.now

      raise(Exceptions::CustomError.new(Exceptions::ErrorMessages::TOKEN_EXPIRED,
                                        Exceptions::ErrorCodes::TOKEN_EXPIRED,
                                        400))
    end

    def validate_mismatch
      return if @params[:password] == @params[:password_confirmation]

      raise(Exceptions::CustomError.new(Exceptions::ErrorMessages::PASSWORD_MISMATCH,
                                        Exceptions::ErrorCodes::PASSWORD_MISMATCH,
                                        400))
    end

    def change_password(password_reset)
      user = password_reset.user
      user.password = @params[:password]

      user.save!
    end
  end
end
