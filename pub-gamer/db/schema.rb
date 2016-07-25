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

ActiveRecord::Schema.define(version: 20160725021641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "body",       null: false
    t.integer  "event_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_games", force: :cascade do |t|
    t.integer  "game_id",    null: false
    t.integer  "event_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description", null: false
    t.date     "date",        null: false
    t.time     "time",        null: false
    t.string   "location",    null: false
    t.integer  "limit",       null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "review_vibes", force: :cascade do |t|
    t.integer  "review_id",  null: false
    t.integer  "vibe_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "content",    null: false
<<<<<<< fc8d36877e7ca25c71eac23d13260c133b5bd259
<<<<<<< 3840b2dad8094564896057fa0c404bce8e59b2eb
<<<<<<< HEAD
    t.string   "week"
=======
    t.string   "vibe",       null: false
>>>>>>> master
=======
=======
<<<<<<< 9beed83288d17e6de4d457af9829ae392018d87d
>>>>>>> add week field to review table
<<<<<<< fb44f0bff9a9a6998933f1fb0f35428768ee6ba9
    t.string   "vibe",       null: false
=======
>>>>>>> update review vibes to select multiple vibes
<<<<<<< fc8d36877e7ca25c71eac23d13260c133b5bd259
>>>>>>> update review vibes to select multiple vibes
=======
=======
    t.string   "week"
>>>>>>> add week field to review table
>>>>>>> add week field to review table
    t.integer  "rating"
    t.integer  "venue_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_events", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "event_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_venues", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "venue_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name",       null: false
    t.string   "password_digest", null: false
    t.string   "email",           null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "venue_games", force: :cascade do |t|
    t.integer  "game_id",    null: false
    t.integer  "venue_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "address",     null: false
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "vibes", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "pic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
