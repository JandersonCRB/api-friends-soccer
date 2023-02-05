# frozen_string_literal: true

module V1
  class AuthAPI < Grape::API
    desc "Login"
    namespace :login do
      desc "Login via email and password"
      params do
        requires :email, type: String, desc: "email"
        requires :password, type: String, desc: "password"
      end
      post do
        login = Auth::Login.call(params).result
        status 200
        present login, with: Entities::Login
      end
    end

    namespace :forgot_password do
      desc "Forgot password"
      params do
        requires :email, type: String, desc: "email"
      end
      post do
        Auth::ForgotPassword.call(params).result
        status 200
      end
    end
  end
end
