class CreateMatchGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :match_goals do |t|
      t.references :match_team, null: false, foreign_key: true
      t.references :goaler_match_team_player_id, null: false, foreign_key: { to_table: :match_team_players }
      t.references :assister_match_team_player_id, null: true, foreign_key: { to_table: :match_team_players }

      t.timestamps
    end
  end
end
