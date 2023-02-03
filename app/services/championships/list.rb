# frozen_string_literal: true

module Championships
  class List
    prepend SimpleCommand
    include Auth::Validations

    PRIVILEGES = %w[LIST_CHAMPIONSHIPS].freeze

    def initialize(decoded_token, params)
      @decoded_token = decoded_token
      @params = params
    end

    def call
      security_checks
      fetch_championships
    end

    def security_checks
      one_of_privileges!(PRIVILEGES)
    end

    def fetch_championships
      # TODO: Return only championships user have access to
      Championship.all
    end
  end
end
