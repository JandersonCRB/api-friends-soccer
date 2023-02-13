class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :championship_edition, null: false, foreign_key: true
      t.datetime :match_datetime

      t.timestamps
    end
  end
end
