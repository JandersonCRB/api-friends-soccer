# frozen_string_literal: true

module Championships
  module ChampionshipHelper
    def self.can_manage_championship?(championship)
      return true if championship.user == decoded_token[:user_id] || ChampionshipsManager.exists?(
        championship: championship, user: decoded_token[:user_id]
      )

      false
    end

    def self.can_manage_championship!(championship)
      return if can_manage_championship?(championship)

      raise Exceptions::CustomError.new(
        Exceptions::ErrorMessages::AUTHORITY_ERROR,
        Exceptions::ErrorCodes::AUTHORITY_ERROR,
        400
      )
    end
  end
end
