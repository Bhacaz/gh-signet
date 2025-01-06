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

ActiveRecord::Schema[8.0].define(version: 2023_12_09_001458) do
  create_table "pr_signets", force: :cascade do |t|
    t.string "query"
    t.integer "user_id", null: false
    t.string "title"
    t.integer "sort", limit: 1, default: 0, null: false
    t.integer "order", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "display_order", default: 1, null: false
    t.json "display_settings", default: {}, null: false
    t.index ["user_id"], name: "index_pr_signets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider_id"
    t.string "username"
    t.string "email", limit: 500
    t.string "gho_token", limit: 500
    t.string "name"
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["provider_id"], name: "index_users_on_provider_id"
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "pr_signets", "users"
end
