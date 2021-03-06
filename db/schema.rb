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

ActiveRecord::Schema.define(:version => 20130623164834) do

  create_table "ads", :force => true do |t|
    t.string   "image"
    t.string   "url"
    t.string   "title"
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "status"
    t.integer  "category_ad_id"
  end

  create_table "announcements", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "introtext"
    t.string   "tag"
    t.string   "image"
    t.string   "frandly_name"
    t.integer  "user_id"
    t.string   "video"
    t.boolean  "order"
  end

  create_table "category_ads", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "category_news", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "film_id"
    t.integer  "user_id"
  end

  create_table "films", :force => true do |t|
    t.string   "name"
    t.integer  "year"
    t.text     "introtext"
    t.string   "role"
    t.text     "film"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "type_id"
    t.string   "users"
    t.string   "image"
    t.string   "directed_by"
    t.string   "length"
    t.string   "country"
    t.string   "tag"
    t.string   "frendlyname"
    t.float    "rate"
    t.float    "f_rate"
    t.integer  "user_id"
    t.boolean  "order"
  end

  create_table "films_janrs", :id => false, :force => true do |t|
    t.integer "film_id"
    t.integer "janr_id"
  end

  create_table "janrs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "news", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "introtext"
    t.string   "tag"
    t.string   "image"
    t.string   "frandly_name"
    t.integer  "user_id"
    t.string   "video"
    t.integer  "category_ad_id"
    t.integer  "category_news_id"
    t.boolean  "order"
  end

  create_table "rates", :force => true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.integer  "stars",         :null => false
    t.string   "dimension"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "rates", ["rateable_id", "rateable_type"], :name => "index_rates_on_rateable_id_and_rateable_type"
  add_index "rates", ["rater_id"], :name => "index_rates_on_rater_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "settings", :force => true do |t|
    t.string   "site_name"
    t.string   "tegs"
    t.integer  "count_page"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "vidjet"
    t.text     "counter"
    t.text     "socbutton"
    t.text     "commentvk"
  end

  create_table "slides", :force => true do |t|
    t.string   "image"
    t.boolean  "is_show"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "role_id"
    t.string   "username"
    t.string   "avatar"
    t.string   "url"
    t.text     "harakter"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "users_roles", ["role_id"], :name => "index_users_roles_on_role_id"
  add_index "users_roles", ["user_id"], :name => "index_users_roles_on_user_id"

end
