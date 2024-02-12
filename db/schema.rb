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

ActiveRecord::Schema[7.0].define(version: 20_240_203_081_743) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'favorite_inks', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'ink_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['ink_id'], name: 'index_favorite_inks_on_ink_id'
    t.index %w[user_id ink_id], name: 'index_favorite_inks_on_user_id_and_ink_id', unique: true
    t.index ['user_id'], name: 'index_favorite_inks_on_user_id'
  end

  create_table 'favorite_pens', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'pen_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['pen_id'], name: 'index_favorite_pens_on_pen_id'
    t.index %w[user_id pen_id], name: 'index_favorite_pens_on_user_id_and_pen_id', unique: true
    t.index ['user_id'], name: 'index_favorite_pens_on_user_id'
  end

  create_table 'inks', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'brand', null: false
    t.string 'color'
    t.string 'ink_level'
    t.date 'purchase_date'
    t.text 'description'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'ink_image'
    t.index ['user_id'], name: 'index_inks_on_user_id'
  end

  create_table 'pens', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'brand', null: false
    t.string 'nib'
    t.date 'purchase_date'
    t.text 'description'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'pen_image'
    t.integer 'ink_id'
    t.index ['ink_id'], name: 'index_pens_on_ink_id'
    t.index ['user_id'], name: 'index_pens_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'crypted_password'
    t.string 'salt'
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'avatar'
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  add_foreign_key 'favorite_inks', 'inks'
  add_foreign_key 'favorite_inks', 'users'
  add_foreign_key 'favorite_pens', 'pens'
  add_foreign_key 'favorite_pens', 'users'
  add_foreign_key 'inks', 'users'
  add_foreign_key 'pens', 'inks'
  add_foreign_key 'pens', 'users'
end
