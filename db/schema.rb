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

ActiveRecord::Schema.define(version: 2020_01_14_211731) do

  create_table "contacts", force: :cascade do |t|
    t.string "issue"
    t.text "description"
    t.boolean "has_responded"
    t.boolean "is_meaningful"
    t.integer "user_id"
    t.integer "rep_id"
  end

  create_table "reps", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.string "address"
    t.string "party"
    t.string "phone"
    t.string "website"
    t.string "photo"
    t.string "facebook"
    t.string "twitter"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "name"
    t.string "address"
  end

end
