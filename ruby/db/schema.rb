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

ActiveRecord::Schema[7.0].define(version: 0) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "following", primary_key: ["user_id", "target_id"], force: :cascade do |t|
    t.string "user_id", null: false
    t.string "target_id", null: false
  end

  create_table "groups", id: :uuid, default: nil, force: :cascade do |t|
    t.string "owner_id"
    t.string "name", null: false
    t.string "description", null: false
    t.datetime "created_at", precision: nil
    t.boolean "is_public", default: true
  end

  create_table "invite_groups", primary_key: ["user_id", "group_id"], force: :cascade do |t|
    t.string "user_id", null: false
    t.uuid "group_id", null: false
  end

  create_table "likes", primary_key: ["user_id", "post_id"], force: :cascade do |t|
    t.uuid "post_id", null: false
    t.string "user_id", null: false
  end

  create_table "posts", id: :uuid, default: nil, force: :cascade do |t|
    t.string "user_id"
    t.string "content", null: false
    t.string "created_at"
    t.string "update_at"
  end

  create_table "replies", id: :uuid, default: nil, force: :cascade do |t|
    t.uuid "post_id"
    t.string "user_id"
    t.string "content", null: false
    t.datetime "created_at", precision: nil
  end

  create_table "rooms", id: :uuid, default: nil, force: :cascade do |t|
    t.string "owner_id"
    t.string "title", null: false
    t.string "description", null: false
    t.boolean "is_public", default: true
    t.uuid "group_id"
    t.datetime "start_time", precision: nil
    t.datetime "end_time", precision: nil
    t.integer "count", default: 0
  end

  create_table "users", id: :string, force: :cascade do |t|
    t.string "image_url"
    t.string "name"
    t.string "email", null: false
  end

  create_table "users_groups", primary_key: ["user_id", "group_id"], force: :cascade do |t|
    t.string "user_id", null: false
    t.uuid "group_id", null: false
  end

  add_foreign_key "following", "users", column: "target_id", name: "following_target_id_fkey"
  add_foreign_key "following", "users", name: "following_user_id_fkey"
  add_foreign_key "groups", "users", column: "owner_id", name: "groups_owner_id_fkey"
  add_foreign_key "invite_groups", "groups", name: "invite_groups_group_id_fkey"
  add_foreign_key "invite_groups", "users", name: "invite_groups_user_id_fkey"
  add_foreign_key "likes", "posts", name: "likes_post_id_fkey"
  add_foreign_key "likes", "users", name: "likes_user_id_fkey"
  add_foreign_key "posts", "users", name: "posts_user_id_fkey"
  add_foreign_key "replies", "posts", name: "replies_post_id_fkey"
  add_foreign_key "replies", "users", name: "replies_user_id_fkey"
  add_foreign_key "rooms", "groups", name: "rooms_group_id_fkey"
  add_foreign_key "rooms", "users", column: "owner_id", name: "rooms_owner_id_fkey"
  add_foreign_key "users_groups", "groups", name: "users_groups_group_id_fkey"
  add_foreign_key "users_groups", "users", name: "users_groups_user_id_fkey"
end
