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

ActiveRecord::Schema.define(version: 20140613023341) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assets", force: true do |t|
    t.string   "title"
    t.string   "type"
    t.string   "author"
    t.text     "description"
    t.integer  "news_asset_collection_id"
    t.string   "assets_file_name"
    t.string   "assets_content_type"
    t.integer  "assets_file_size"
    t.datetime "assets_updated_at"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

  create_table "messages", force: true do |t|
    t.string   "type"
    t.string   "keyword"
    t.text     "content"
    t.integer  "media_id"
    t.string   "title"
    t.text     "description"
    t.string   "music_url"
    t.string   "hq_music_url"
    t.string   "thumb_media_id"
    t.integer  "article_count"
    t.string   "picurl"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_asset_collections", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
