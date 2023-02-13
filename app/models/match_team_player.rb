class MatchTeamPlayer < ApplicationRecord
  belongs_to :match_team
  belongs_to :player
end
