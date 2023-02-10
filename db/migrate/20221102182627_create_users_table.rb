# frozen_string_literal: true

# Create Users Table
class CreateUsersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false, limit: 255
      t.string :last_name, null: false, limit: 255
      t.string :email, null: false, limit: 255
      t.string :password

      t.index [:email], unique: true

      t.timestamps
    end
  end
end
