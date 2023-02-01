# frozen_string_literal: true

module Entities
  class Login < Grape::Entity
    expose :token, documentation: { type: "String", desc: "JWT token" }
    expose :user, using: User, documentation: { desc: "User" }
  end
end
