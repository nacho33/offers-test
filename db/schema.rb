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

ActiveRecord::Schema.define(:version => 20130926090311) do

  create_table "offers", :force => true do |t|
    t.integer  "price"
    t.string   "description"
    t.string   "city"
    t.float    "points",             :default => 0.0
    t.datetime "start_date"
    t.datetime "finish_date"
    t.integer  "offer_type"
    t.integer  "number",             :default => 0
    t.integer  "venue_id"
    t.string   "title"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "opinions", :force => true do |t|
    t.integer  "user_id"
    t.string   "description"
    t.integer  "points"
    t.string   "title"
    t.string   "offer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",        :null => false
    t.string   "encrypted_password",     :default => "",        :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.string   "role",                   :default => "user"
    t.string   "username",               :default => "default"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_venues", :force => true do |t|
    t.integer "venue_id"
    t.integer "user_id"
  end

  add_index "users_venues", ["user_id", "venue_id"], :name => "by_user_id_and_venue_id", :unique => true
  add_index "users_venues", ["venue_id", "user_id"], :name => "by_venue_id_and_user_id", :unique => true

  create_table "venues", :force => true do |t|
    t.string   "venue_name"
    t.string   "address"
    t.string   "description"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "contact_name"
    t.string   "contact_number"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
