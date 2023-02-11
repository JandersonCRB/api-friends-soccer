# frozen_string_literal: true

module Entities
  class SignUp < Grape::Entity
    expose :token
    expose :user, using: Entities::User
  end
end
