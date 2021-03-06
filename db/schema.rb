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

ActiveRecord::Schema.define(version: 2021_01_23_071427) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "question_id"
    t.integer "tag_id"
    t.text "introduction"
    t.string "link"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
  end

  create_table "event_entries", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.integer "cancel", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer "user_id"
    t.string "date"
    t.string "start"
    t.string "finish"
    t.integer "entry_fee"
    t.string "organizer"
    t.text "event_detail"
    t.integer "event_status", default: 0
    t.integer "capacity"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "post_image_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.text "introduction", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "histories", force: :cascade do |t|
    t.integer "answer_id"
    t.integer "event_id"
    t.integer "post_id"
    t.integer "question_id"
    t.integer "user_id"
    t.integer "event_entry_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_images", force: :cascade do |t|
    t.integer "admin_id"
    t.string "image_id"
    t.text "introduction"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "question_id"
    t.integer "user_id"
    t.integer "genre_id"
    t.integer "tag_id"
    t.string "title"
    t.text "introduction"
    t.string "link"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer "tag_id"
    t.string "title"
    t.text "introduction"
    t.string "link"
    t.string "is_active", default: "f"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "answer_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.string "introduction", null: false
    t.integer "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "popular", default: "0"
    t.boolean "is_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "agree", default: "f"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
