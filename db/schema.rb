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

ActiveRecord::Schema.define(version: 20131218222538) do

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "blurb"
    t.integer  "goal"
    t.integer  "pledged"
    t.string   "state"
    t.string   "country"
    t.string   "currency"
    t.string   "currency_symbol"
    t.integer "deadline"
    t.integer "created_at"
    t.integer "launched_at"
    t.integer  "backers_count"
    t.string   "photo"
    t.string   "creator"
    t.string   "location"
    t.string   "category"
    t.string   "urls"
    t.datetime "updated_at"
  end

end
