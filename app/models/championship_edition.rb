# frozen_string_literal: true

class ChampionshipEdition < ApplicationRecord
  belongs_to :championship
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }, uniqueness: { scope: :championship_id }
  # TODO: write specs for validations
end
