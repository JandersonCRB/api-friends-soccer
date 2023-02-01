# frozen_string_literal: true

module V1
  module Helpers
    extend Grape::API::Helpers

    module_function

    def decoded_token
      Auth::Helpers.decode_token(headers["Authorization"])
    end

    def user_authenticate!(token: nil)
      headers["Authorization"] = token.to_s unless token.nil?

      error!("401 Unauthorized", 401) unless decoded_token.present?
    end

    params :authorization_token do
      optional :Authorization, type: String,
                               desc: "Access Token",
                               documentation: { param_type: :header }
    end
  end
end
