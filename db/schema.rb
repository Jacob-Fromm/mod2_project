# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_27_170351) do

  create_table "parks", force: :cascade do |t|
    t.string "url"
    t.string "fullName"
    t.string "park_id"
    t.string "parkCode"
    t.text "description"
    t.string "latitude"
    t.string "longitude"
    t.string "latLong"
    t.string "acitivites"
    t.string "topics"
    t.string "states"
    t.string "contacts"
    t.string "entranceFees"
    t.string "entrancePasses"
    t.text "directionsInfo"
    t.string "directionsURL"
    t.string "operatingHours"
    t.string "addresses"
    t.string "images"
    t.string "weatherInfo"
    t.string "name"
    t.string "designation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trips", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "park_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["park_id"], name: "index_trips_on_park_id"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "trips", "parks"
  add_foreign_key "trips", "users"
end
