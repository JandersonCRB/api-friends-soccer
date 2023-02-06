# frozen_string_literal: true

module Users
  class Create
    prepend SimpleCommand
    include Auth::Validations

    PRIVILEGES = %w[ADMIN].freeze

    def initialize(decoded_token, params)
      @decoded_token = decoded_token
      @params = params
    end

    def call
      Rails.logger.info("Creating user with params=#{@params}")
      validate_request
      create_user
    end

    private

    def validate_request
      one_of_privileges!(PRIVILEGES)
    end

    def create_user
      user = User.new(
        name: @params[:name],
        email: @params[:email],
        password: @params[:password],
        roles: Role.where(code: "USER")
      )
      raise(ActiveRecord::RecordInvalid, user) unless user.save

      user
    end
  end
end
