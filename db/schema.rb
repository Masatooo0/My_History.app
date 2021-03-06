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

ActiveRecord::Schema.define(version: 2021_07_27_112029) do

  create_table "advantages", force: :cascade do |t|
    t.string "advantage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "history_id"
    t.index ["history_id"], name: "index_advantages_on_history_id"
    t.index ["user_id"], name: "index_advantages_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.text "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dreams", force: :cascade do |t|
    t.string "content"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dreams_on_user_id"
  end

  create_table "histories", force: :cascade do |t|
    t.string "title", null: false
    t.text "event", null: false
    t.integer "motivation", null: false
    t.integer "user_id", null: false
    t.integer "period_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "summarize"
    t.string "image_id"
    t.index ["period_id"], name: "index_histories_on_period_id"
    t.index ["user_id"], name: "index_histories_on_user_id"
  end

  create_table "missions", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "deadline", null: false
    t.boolean "status", default: false, null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_missions_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "action"
    t.boolean "checked", default: false, null: false
    t.integer "mission_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id"], name: "index_notifications_on_mission_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "periods", force: :cascade do |t|
    t.string "period", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_periods_on_id"
  end

  create_table "reasons", force: :cascade do |t|
    t.text "reason", null: false
    t.integer "history_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["history_id"], name: "index_reasons_on_history_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.date "period", null: false
    t.string "content", null: false
    t.boolean "status", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_resumes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "birth_day", null: false
    t.string "profile_image_id"
    t.string "axis"
    t.boolean "is_valid", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
