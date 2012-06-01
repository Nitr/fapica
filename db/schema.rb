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

ActiveRecord::Schema.define(:version => 20120601062627) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "device_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", :force => true do |t|
    t.integer  "terminal_id"
    t.integer  "device_type_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "devices", ["terminal_id"], :name => "index_devices_on_terminal_id"

  create_table "keycodes", :force => true do |t|
    t.string   "keycode"
    t.boolean  "temp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs", :force => true do |t|
    t.integer  "user_id"
    t.datetime "visit"
    t.integer  "visit_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "logs", ["user_id"], :name => "index_logs_on_user_id"

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "terminals", :force => true do |t|
    t.string   "hashkey"
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "terminals", ["company_id"], :name => "index_terminals_on_company_id"

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
    t.string   "f"
    t.string   "i"
    t.string   "o"
    t.string   "job"
    t.string   "photo"
    t.integer  "company_id"
    t.integer  "keycode_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
