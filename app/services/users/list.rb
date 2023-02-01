# frozen_string_literal: true

module Users
  class List
    prepend SimpleCommand

    def initialize(decoded_token, params)
      @decoded_token = decoded_token
      @params = params
    end

    def call
      Rails.logger.info("Listing users with params=#{@params}")
      fetch_users
    end

    private

    def fetch_users
      User.all
    end
  end
end
