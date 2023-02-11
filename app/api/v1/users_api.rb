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

      desc "Sign up"
      params do
        requires :first_name, type: String, desc: "First Name of the user"
        requires :last_name, type: String, desc: "Last Name of the user"
        requires :email, type: String, desc: "Email of the user"
        requires :password, type: String, desc: "Password of the user"
      end
      post "/sign_up" do
        user = Users::SignUp.call(params).result
        present user, with: Entities::SignUp
      end
    end
  end
end
