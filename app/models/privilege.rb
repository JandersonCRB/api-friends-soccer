# frozen_string_literal: true

class Privilege < ApplicationRecord
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :users
end
