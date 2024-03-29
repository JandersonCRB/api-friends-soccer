# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :code
      t.string :name
      t.string :description

      t.index :code, unique: true

      t.timestamps
    end
  end
end
