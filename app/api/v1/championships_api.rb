# frozen_string_literal: true

module V1
  class ChampionshipsAPI < Grape::API
    helpers API::V1::Helpers
    namespace :championships do
      desc "Create championship"
      params do
        use :authorization_token
        requires :name, type: String, desc: "name"
      end
      post do
        user_authenticate!
        championship = Championship::Create.call(decoded_token, params).result
        present championship, with: Entities::Championship
      end

      desc "List championships"
      params do
        use :authorization_token
      end
      get do
        user_authenticate!
        championships = Championship::List.call(decoded_token, params).result
        present championships, with: Entities::Championship
      end
    end
  end
end
