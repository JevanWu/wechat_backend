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

ActiveRecord::Schema.define(version: 20140704041215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assets", force: true do |t|
    t.string   "type"
    t.string   "title"
    t.text     "description"
    t.string   "media_id"
    t.string   "assets_file_name"
    t.string   "assets_content_type"
    t.integer  "assets_file_size"
    t.datetime "assets_updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keywords", force: true do |t|
    t.string   "keyword"
    t.integer  "reply_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "keywords", ["reply_id"], name: "index_keywords_on_reply_id", using: :btree

  create_table "news_assets", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "description"
    t.string   "url"
    t.integer  "news_asset_collection_id"
    t.string   "news_assets_file_name"
    t.string   "news_assets_content_type"
    t.integer  "news_assets_file_size"
    t.datetime "news_assets_updated_at"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "replies", force: true do |t|
    t.string   "type"
    t.text     "content"
    t.integer  "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
