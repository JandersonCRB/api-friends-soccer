class CreateChampionshipEditions < ActiveRecord::Migration[7.0]
  def change
    create_table :championship_editions do |t|
      t.references :championship, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
