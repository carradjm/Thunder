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

ActiveRecord::Schema.define(version: 20140826181704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "playlist_songs", force: true do |t|
    t.integer "playlist_id"
    t.integer "song_id"
  end

  add_index "playlist_songs", ["playlist_id", "song_id"], name: "index_playlist_songs_on_playlist_id_and_song_id", unique: true, using: :btree

  create_table "playlists", force: true do |t|
    t.string   "title",       null: false
    t.integer  "user_id",     null: false
    t.text     "description"
    t.integer  "duration"
    t.string   "genre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", force: true do |t|
    t.string   "title",       null: false
    t.string   "artist",      null: false
    t.integer  "user_id",     null: false
    t.text     "description"
    t.string   "genre"
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "songs", ["artist"], name: "index_songs_on_artist", using: :btree
  add_index "songs", ["genre"], name: "index_songs_on_genre", using: :btree
  add_index "songs", ["title"], name: "index_songs_on_title", using: :btree
  add_index "songs", ["user_id"], name: "index_songs_on_user_id", using: :btree

  create_table "user_follows", force: true do |t|
    t.integer  "follower_id",  null: false
    t.integer  "following_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_follows", ["follower_id", "following_id"], name: "index_user_follows_on_follower_id_and_following_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "username"
    t.string   "session_token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "full_name"
    t.string   "country"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
