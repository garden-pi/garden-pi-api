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

ActiveRecord::Schema.define(version: 2019_07_08_181619) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.string "action_type"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer "number_fruit"
    t.float "height"
    t.integer "overall_health"
    t.text "notes"
    t.bigint "plant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_evaluations_on_plant_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "logs", force: :cascade do |t|
    t.bigint "action_id"
    t.bigint "plant_id"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_id"], name: "index_logs_on_action_id"
    t.index ["plant_id"], name: "index_logs_on_plant_id"
  end

  create_table "plants", force: :cascade do |t|
    t.bigint "species_id"
    t.bigint "group_id"
    t.string "name"
    t.float "ph_min"
    t.float "ph_max"
    t.float "soil_moisture_min"
    t.float "soil_moisture_max"
    t.float "humidity_min"
    t.float "humidity_max"
    t.float "temperature_min"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_plants_on_group_id"
    t.index ["species_id"], name: "index_plants_on_species_id"
  end

  create_table "species", force: :cascade do |t|
    t.string "scientific_name"
    t.integer "trefle_id"
    t.float "ph_min"
    t.float "ph_max"
    t.float "soil_moisture_min"
    t.float "soil_moisture_max"
    t.float "humidity_min"
    t.float "humidity_max"
    t.string "common_name"
    t.string "moisture_use"
    t.float "temperature_min"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "precipitation_min"
    t.float "precipitation_max"
    t.float "root_depth_min"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "evaluations", "plants"
  add_foreign_key "groups", "users"
  add_foreign_key "logs", "actions"
  add_foreign_key "logs", "plants"
  add_foreign_key "plants", "groups"
  add_foreign_key "plants", "species"
end
