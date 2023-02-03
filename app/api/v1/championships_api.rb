# frozen_string_literal: true

module V1
  class ChampionshipsAPI < Grape::API
    helpers API::V1::Helpers
    namespace :championships do
      desc "Create championship"
      params do
        requires :name, type: String, desc: "name"
      end
      post do
        user_authenticate!
        championship = Championship::Create.call(decoded_token, params).result
        present championship, with: Entities::Championship
      end
    end
  end
end
