# frozen_string_literal: true

class Championship < ApplicationRecord
  belongs_to :user
  has_many :users, through: :championships_managers, as: :managers
end
