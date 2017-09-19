# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170919040934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "nfl_players", force: :cascade do |t|
    t.string "name"
    t.bigint "nfl_position_id"
    t.bigint "nfl_team_id"
    t.string "stats"
    t.integer "season_pts"
    t.integer "season_projected_pts"
    t.integer "week_pts"
    t.integer "week_projected_pts"
    t.string "image"
    t.index ["nfl_position_id"], name: "index_nfl_players_on_nfl_position_id"
    t.index ["nfl_team_id"], name: "index_nfl_players_on_nfl_team_id"
  end

  create_table "nfl_positions", force: :cascade do |t|
    t.string "position"
  end

  create_table "nfl_teams", force: :cascade do |t|
    t.string "team"
  end

  add_foreign_key "nfl_players", "nfl_positions"
  add_foreign_key "nfl_players", "nfl_teams"
end
