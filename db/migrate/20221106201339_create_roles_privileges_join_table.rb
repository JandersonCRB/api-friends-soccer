# frozen_string_literal: true

class CreateRolesPrivilegesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :roles, :privileges do |t|
      t.index :role_id
      t.index :privilege_id
    end
  end
end
