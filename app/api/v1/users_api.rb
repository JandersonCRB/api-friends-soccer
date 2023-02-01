# frozen_string_literal: true

module V1
  class UsersAPI < Grape::API
    helpers API::V1::Helpers

    namespace :users do
      desc "List all users"
      params do
        use :authorization_token
      end
      get do
        user_authenticate!
        users = Users::List.call(decoded_token, params).result
        present users, with: Entities::User
      end

      desc "Create a new user"
      params do
        use :authorization_token
        requires :name, type: String, desc: "Name of the user"
        requires :email, type: String, desc: "Email of the user"
        optional :password, type: String, desc: "Password of the user"
      end
    end
  end
end
