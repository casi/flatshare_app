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

ActiveRecord::Schema.define(version: 2022_02_05_222013) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.integer "info_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["info_id"], name: "index_comments_on_info_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "infos", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.boolean "archived"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_infos_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_infos_on_user_id"
  end

  create_table "listitems", id: :serial, force: :cascade do |t|
    t.string "item"
    t.boolean "done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qandas", id: :serial, force: :cascade do |t|
    t.string "question"
    t.text "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.date "birthday"
    t.date "moved_in"
    t.date "moved_out"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.string "picture"
    t.string "locale"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "comments", "infos"
  add_foreign_key "comments", "users"
  add_foreign_key "infos", "users"
end
