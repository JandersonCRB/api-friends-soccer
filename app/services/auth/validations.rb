# frozen_string_literal: true

module Auth
  module Validations
    def one_of_privileges!(privileges, skip_admin: true)
      return if skip_admin && admin?
      return if privileges.any? { |privilege| has_privilege?(privilege) }

      raise Exceptions::CustomError.new(
        Exceptions::ErrorMessages::AUTHORITY_ERROR,
        Exceptions::ErrorCodes::AUTHORITY_ERROR,
        403
      )
    end

    def user_roles
      @decoded_token[:roles]
    end

    def admin?
      user_roles.include?("ADMIN")
    end

    def has_privilege?(privilege)
      user_roles.include?(privilege)
    end
  end
end
