class CreateMatchTeamPlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :match_team_players do |t|
      t.references :match_team, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
