# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141110210331) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "commenter_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
  end

  create_table "favorited_rants", force: true do |t|
    t.integer  "rant_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "followers", force: true do |t|
    t.integer "user_id"
    t.integer "following"
  end

  create_table "ip_addresses", force: true do |t|
    t.string   "ip"
    t.integer  "visits",     default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rants", force: true do |t|
    t.string   "subject"
    t.text     "rant"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spams", force: true do |t|
    t.integer  "user_id"
    t.integer  "rant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "bio"
    t.string   "rant_frequency"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ip_id"
    t.string   "avatar"
    t.string   "email"
    t.boolean  "admin",           default: false
    t.string   "token"
    t.boolean  "enabled",         default: false
  end

end
