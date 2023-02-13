# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_13_040135) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "championship_editions", force: :cascade do |t|
    t.bigint "championship_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["championship_id"], name: "index_championship_editions_on_championship_id"
  end

  create_table "championships", force: :cascade do |t|
    t.string "name"
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_championships_on_owner_id"
  end

  create_table "championships_managers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "championship_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["championship_id"], name: "index_championships_managers_on_championship_id"
    t.index ["user_id"], name: "index_championships_managers_on_user_id"
  end

  create_table "match_team_players", force: :cascade do |t|
    t.bigint "match_team_id", null: false
    t.bigint "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_team_id"], name: "index_match_team_players_on_match_team_id"
    t.index ["player_id"], name: "index_match_team_players_on_player_id"
  end

  create_table "match_teams", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.string "team_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_match_teams_on_match_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "championship_edition_id", null: false
    t.datetime "match_datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["championship_edition_id"], name: "index_matches_on_championship_edition_id"
  end

  create_table "password_resets", force: :cascade do |t|
    t.string "token"
    t.datetime "expires_at"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_password_resets_on_user_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "user_id", null: false
    t.bigint "championship_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["championship_id"], name: "index_players_on_championship_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "privileges", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_privileges_on_code", unique: true
  end

  create_table "privileges_roles", id: false, force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "privilege_id", null: false
    t.index ["privilege_id"], name: "index_privileges_roles_on_privilege_id"
    t.index ["role_id"], name: "index_privileges_roles_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_roles_on_code", unique: true
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.index ["role_id"], name: "index_roles_users_on_role_id"
    t.index ["user_id"], name: "index_roles_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", limit: 255, null: false
    t.string "last_name", limit: 255, null: false
    t.string "email", limit: 255, null: false
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "championship_editions", "championships"
  add_foreign_key "championships", "users", column: "owner_id"
  add_foreign_key "championships_managers", "championships"
  add_foreign_key "championships_managers", "users"
  add_foreign_key "match_team_players", "match_teams"
  add_foreign_key "match_team_players", "players"
  add_foreign_key "match_teams", "matches"
  add_foreign_key "matches", "championship_editions"
  add_foreign_key "password_resets", "users"
  add_foreign_key "players", "championships"
  add_foreign_key "players", "users"
end
