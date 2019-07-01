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

ActiveRecord::Schema.define(version: 2019_06_30_235854) do

  create_table "evaluations", force: :cascade do |t|
    t.integer "number_fruit"
    t.float "height"
    t.integer "overall_health"
    t.text "notes"
    t.integer "plant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_evaluations_on_plant_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "plants", force: :cascade do |t|
    t.integer "species_id"
    t.integer "group_id"
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
    t.string "common_name"
    t.string "moisture_use"
    t.float "temperature_min"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
