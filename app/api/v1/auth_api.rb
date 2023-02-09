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

    content_type :html, "text/html"

    get :reset_password do
      content_type "text/html"
      format "html"
      template = Tilt.new("app/views/reset_password.html.erb")
      template.render(self, token: params[:token])
    end

    params do
      requires :token, type: String, desc: "token"
    end
    post :reset_password do
      Auth::ResetPassword.call(params).result
      status 200
    end
  end
end
