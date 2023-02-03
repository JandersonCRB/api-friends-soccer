# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :roles
  has_many :privileges, through: :roles
  has_many :championships, through: :championship_managers, as: :managed_championships

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6, maximum: 30 }

  def as_json(options = nil)
    super(options).except("password")
  end

  def authenticate(password)
    self.password == password
  end
end
