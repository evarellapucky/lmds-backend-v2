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

ActiveRecord::Schema[7.1].define(version: 2024_06_19_133103) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.bigint "attendee_id"
    t.bigint "event_id"
    t.boolean "is_pending"
    t.bigint "event_instrument_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendee_id"], name: "index_attendances_on_attendee_id"
    t.index ["event_id"], name: "index_attendances_on_event_id"
    t.index ["event_instrument_id"], name: "index_attendances_on_event_instrument_id"
  end

  create_table "event_instruments", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "instrument_id"
    t.integer "total_spots"
    t.integer "available_spots"
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_instruments_on_event_id"
    t.index ["instrument_id"], name: "index_event_instruments_on_instrument_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "category"
    t.integer "price"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "location"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["creator_id"], name: "index_events_on_creator_id"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "publications", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "title"
    t.text "description"
    t.boolean "to_display", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_publications_on_creator_id"
  end

  create_table "skills", force: :cascade do |t|
    t.bigint "musician_id"
    t.bigint "instrument_id"
    t.integer "level", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instrument_id"], name: "index_skills_on_instrument_id"
    t.index ["musician_id"], name: "index_skills_on_musician_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.string "role"
    t.boolean "is_subscriber"
    t.datetime "subscription_end_date"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attendances", "event_instruments"
  add_foreign_key "attendances", "events"
  add_foreign_key "attendances", "users", column: "attendee_id"
  add_foreign_key "event_instruments", "events"
  add_foreign_key "event_instruments", "instruments"
  add_foreign_key "events", "users", column: "creator_id"
  add_foreign_key "publications", "users", column: "creator_id"
  add_foreign_key "skills", "instruments"
  add_foreign_key "skills", "users", column: "musician_id"
end
