# frozen_string_literal: true

class PasswordReset < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :token, presence: true, uniqueness: true
  validates :expires_at, presence: true

  def self.generate_unique_token(user_id)
    SecureRandom.hex(32) + user_id.to_s + Time.now.to_i.to_s
  end
end
