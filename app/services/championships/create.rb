# frozen_string_literal: true

module Championships
  class Create
    prepend SimpleCommand
    include Auth::Validations
    include Championships::ChampionshipHelper

    PRIVILEGES = %w[CREATE_CHAMPIONSHIP].freeze

    def initialize(decoded_token, params)
      @decoded_token = decoded_token
      @params = params
    end

    def call
      validate_request

      create_championship
    end

    def validate_request
      one_of_privileges!(PRIVILEGES)
    end

    def create_championship
      championship = Championship.create!(championship_params)

      ChampionshipsManager.create(championship_id: championship.id, user_id: @decoded_token[:user_id])
      championship
    end

    def championship_params
      {
        name: @params[:name],
        owner_id: @decoded_token[:user_id]
      }
    end
  end
end
