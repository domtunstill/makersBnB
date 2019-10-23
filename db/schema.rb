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

ActiveRecord::Schema.define(version: 2019_10_23_122712) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "property_id"
    t.bigint "user_id"
    t.date "check_in", null: false
    t.date "check_out", null: false
    t.string "image"
    t.string "booking_status", null: false
    t.index ["property_id"], name: "index_bookings_on_property_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name", null: false
    t.string "description", null: false
    t.integer "price_per_night", null: false
    t.boolean "booked"
    t.string "image"
    t.date "available_from"
    t.date "available_to"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
  end

end
