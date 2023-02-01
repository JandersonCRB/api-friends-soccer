# frozen_string_literal: true

Rails.application.routes.draw do
  mount API => "/"
  # Routes to health check
  get "/health", to: "health#health_check"

  # Routes to users
  get "/users", to: "users#list"
  post "/users", to: "users#sign_up"

  # Routes to authentication
  post "/auth/login", to: "auth#login"
end
