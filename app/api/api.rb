# frozen_string_literal: true

class API < Grape::API
  prefix "api"
  format :json

  rescue_from JWT::DecodeError do |e|
    error_response(message: e.message, status: 401)
  end

  rescue_from Exceptions::CustomError do |e|
    exception = {
      error_code: e.code,
      error_desc: e.message
    }
    # Root.log_error(e) if e.http_status == 500
    error!(exception, e.http_status)
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    exception = {
      error_code: "ValidationError",
      error_desc: e.record.errors.errors.as_json
    }

    error!(exception, 422)
  end

  namespace :v1 do
    mount V1::AuthAPI
    mount V1::ChampionshipsAPI
    mount V1::PersonalTrainersAPI
    mount V1::StudentsAPI
    mount V1::UsersAPI
  end
end
