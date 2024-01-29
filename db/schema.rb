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

ActiveRecord::Schema[7.0].define(version: 2024_01_29_092449) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inks", force: :cascade do |t|
    t.string "name", null: false
    t.string "brand", null: false
    t.string "color"
    t.integer "ink_level"
    t.date "purchase_date"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ink_image"
    t.index ["user_id"], name: "index_inks_on_user_id"
  end

  create_table "pens", force: :cascade do |t|
    t.string "name", null: false
    t.string "brand", null: false
    t.string "nib"
    t.date "purchase_date"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pen_image"
    t.index ["user_id"], name: "index_pens_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "inks", "users"
  add_foreign_key "pens", "users"
end
