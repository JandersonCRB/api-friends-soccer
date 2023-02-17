module Championships
  class ListParticipating
    prepend SimpleCommand
    include Auth::Validations

    PRIVILEGES = %w[LIST_CHAMPIONSHIPS].freeze

    def initialize(decoded_token, params)
      @decoded_token = decoded_token
      @params = params
    end

    def call
      security_checks

      user = fetch_user

      fetch_championships(user)
    end

    def security_checks
      one_of_privileges!(PRIVILEGES)
    end

    def fetch_championships(user)
      user.championships_participating
    end

    def fetch_user
      User.find(@decoded_token[:user_id])
    end
  end
end
