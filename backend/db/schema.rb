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

ActiveRecord::Schema[7.0].define(version: 2022_06_25_172738) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "user_email_authentications", force: :cascade do |t|
    t.bigint "user_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_user_email_authentications_on_email", unique: true
    t.index ["user_id"], name: "index_user_email_authentications_on_user_id"
  end

  create_table "user_lockings", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_lockings_on_user_id"
  end

  create_table "user_password_resets", force: :cascade do |t|
    t.bigint "user_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reset_password_token"], name: "index_user_password_resets_on_reset_password_token", unique: true
    t.index ["user_id"], name: "index_user_password_resets_on_user_id"
  end

  create_table "user_registrations", force: :cascade do |t|
    t.bigint "user_id"
    t.string "confirmation_token", null: false
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_user_registrations_on_confirmation_token", unique: true
    t.index ["user_id"], name: "index_user_registrations_on_user_id"
  end

  create_table "user_trackings", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_trackings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_email_authentications", "users"
  add_foreign_key "user_lockings", "users"
  add_foreign_key "user_password_resets", "users"
  add_foreign_key "user_registrations", "users"
  add_foreign_key "user_trackings", "users"
end
