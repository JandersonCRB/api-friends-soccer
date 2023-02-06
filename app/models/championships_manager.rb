# frozen_string_literal: true

class ChampionshipsManager < ApplicationRecord
  belongs_to :championship
  belongs_to :user
end
