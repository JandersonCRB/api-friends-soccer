# frozen_string_literal: true

module Auth
  module Helpers
    module_function

    def generate_token(user)
      payload = {
        user_id: user.id,
        roles: user.roles.map(&:code),
        exp: 30.days.from_now.to_i
      }
      JWT.encode(payload, ENV.fetch("JWT_SECRET", nil), "HS256")
    end

    def decode_token(token)
      decoded = JWT.decode(token, ENV.fetch("JWT_SECRET", nil), true, { algorithm: "HS256" })[0]
      decoded.symbolize_keys
    end
  end
end
