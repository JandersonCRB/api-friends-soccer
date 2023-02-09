# frozen_string_literal: true

module Exceptions
  class ErrorCodes
    WRONG_CREDENTIALS = "WrongCredentials"
    AUTHORITY_ERROR = "AuthorityError"
    EMAIL_TAKEN = "EmailTaken"
    NOT_FOUND = "NotFound"
    TOKEN_EXPIRED = "TokenExpired"
    INVALID_TOKEN = "InvalidToken"
    PASSWORD_MISMATCH = "PasswordMismatch"
  end
end
