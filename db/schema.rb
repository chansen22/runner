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

ActiveRecord::Schema.define(:version => 20121204234047) do

  create_table "comments", :force => true do |t|
    t.text     "text"
    t.integer  "run_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["run_id"], :name => "index_comments_on_run_id"

  create_table "follows", :force => true do |t|
    t.integer  "user_id"
    t.integer  "followee_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "follows", ["user_id"], :name => "index_follows_on_user_id"

  create_table "games", :force => true do |t|
    t.string   "name"
    t.string   "system"
    t.integer  "release_year"
    t.string   "publisher"
    t.string   "series"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "moderates", :force => true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "moderates", ["game_id"], :name => "index_moderates_on_game_id"
  add_index "moderates", ["user_id"], :name => "index_moderates_on_user_id"

  create_table "runs", :force => true do |t|
    t.string   "url"
    t.boolean  "verified"
    t.string   "category"
    t.string   "time_in_seconds"
    t.integer  "game_id"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "runs", ["game_id"], :name => "index_runs_on_game_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

end
