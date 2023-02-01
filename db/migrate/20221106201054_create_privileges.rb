# frozen_string_literal: true

class CreatePrivileges < ActiveRecord::Migration[7.0]
  def change
    create_table :privileges do |t|
      t.string :name
      t.string :code
      t.string :description

      t.index :code, unique: true

      t.timestamps
    end
  end
end
