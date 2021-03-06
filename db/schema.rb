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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121116235142) do

  create_table "extras", :force => true do |t|
    t.string   "name"
    t.date     "release_date"
    t.integer  "metascore"
    t.integer  "game_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "extra_type"
    t.string   "url"
    t.integer  "current_price"
  end

  create_table "games", :force => true do |t|
    t.integer  "metascore"
    t.string   "name"
    t.date     "release_date"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "steam_id"
    t.string   "url"
    t.integer  "current_price"
  end

  create_table "prices", :force => true do |t|
    t.integer  "ammount"
    t.datetime "start_date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "buyable_id"
    t.string   "buyable_type"
  end

end
