# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :roles
  has_many :championships_managers, class_name: "ChampionshipsManager", foreign_key: "user_id"
  has_many :championships_managed, through: :championships_managers, source: :championship
  has_many :privileges, through: :roles

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6, maximum: 30 }


  def as_json(options = nil)
    super(options).except("password")
  end

  def authenticate(password)
    self.password == password
  end

  def championships_participating
    championship_ids = [
      ChampionshipsManager.where(user_id: self.id).pluck(:championship_id),
      Championship.where(owner_id: self.id).pluck(:id),
      Championship.joins(:players).where(players: { user_id: self.id }).pluck(:id)
    ]

    Championship.where(id: championship_ids.flatten.uniq)
  end
end
