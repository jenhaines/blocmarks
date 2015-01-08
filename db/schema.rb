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

ActiveRecord::Schema.define(version: 20150108015039) do

  create_table "bookmarks", force: true do |t|
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "thumbnail_url"
    t.string   "title"
  end

  add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id"

  create_table "bookmarktopics", force: true do |t|
    t.integer "bookmark_id"
    t.integer "topic_id"
  end

  add_index "bookmarktopics", ["bookmark_id"], name: "index_bookmarktopics_on_bookmark_id"
  add_index "bookmarktopics", ["topic_id"], name: "index_bookmarktopics_on_topic_id"

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "bookmark_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorites", ["bookmark_id"], name: "index_favorites_on_bookmark_id"
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id"

  create_table "topics", force: true do |t|
    t.string   "topic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topics", ["topic"], name: "index_topics_on_topic", unique: true

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
