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

ActiveRecord::Schema.define(version: 20180804194353) do

  create_table "cities", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.text     "description"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "city_id"
    t.integer  "event_type",    default: 0
    t.string   "title"
    t.string   "image_data"
    t.string   "venue"
    t.string   "address"
    t.string   "category"
    t.text     "description"
    t.text     "what_to_bring"
    t.text     "what_to_wear"
    t.text     "where_to_park"
    t.string   "website"
    t.string   "start_hour"
    t.string   "end_hour"
    t.string   "start_minute"
    t.string   "end_minute"
    t.string   "start_am_pm"
    t.string   "end_am_pm"
    t.string   "month"
    t.string   "day"
    t.string   "year"
    t.datetime "start_time"
    t.datetime "end_time"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "slug"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["city_id"], name: "index_events_on_city_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "thing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["thing_id"], name: "index_likes_on_thing_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.string   "description"
    t.text     "content"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "rsvps", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_rsvps_on_event_id"
    t.index ["user_id"], name: "index_rsvps_on_user_id"
  end

  create_table "things", force: :cascade do |t|
    t.integer  "city_id"
    t.integer  "thing_type",    default: 0
    t.string   "title"
    t.string   "image"
    t.string   "venue"
    t.string   "address"
    t.string   "category"
    t.text     "description"
    t.text     "what_to_bring"
    t.text     "what_to_wear"
    t.text     "where_to_park"
    t.string   "website"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "slug"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["city_id"], name: "index_things_on_city_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "username",               default: "", null: false
    t.string   "slug",                   default: "", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
