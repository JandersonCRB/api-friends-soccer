class CreateChampionships < ActiveRecord::Migration[7.0]
  def change
    create_table :championships do |t|
      t.string :name
      t.references :owner, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
