# frozen_string_literal: true

class Championship < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'owner_id'
  has_many :users, through: :championships_managers, as: :managers

  validates :name, presence: true
  validates :owner_id, presence: true
end
