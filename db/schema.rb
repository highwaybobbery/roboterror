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

ActiveRecord::Schema.define(:version => 20120501020547) do

  create_table "chasses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "equipment_stats", :force => true do |t|
    t.integer  "equipment_id", :null => false
    t.integer  "stat_id",      :null => false
    t.integer  "modifier",     :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "equipment_types", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "equipments", :force => true do |t|
    t.string   "name"
    t.integer  "price",             :default => 0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "chassis_id",                       :null => false
    t.integer  "equipment_type_id",                :null => false
  end

  add_index "equipments", ["chassis_id", "equipment_type_id"], :name => "index_equipments_on_chassis_id_and_type_id"

  create_table "inventories", :force => true do |t|
    t.integer  "equipment_id"
    t.integer  "user_id"
    t.integer  "robot_id"
    t.integer  "price"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "robots", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "chassis_id"
  end

  add_index "robots", ["chassis_id"], :name => "index_robots_on_chassis_id"
  add_index "robots", ["user_id"], :name => "index_robots_on_user_id"

  create_table "stats", :force => true do |t|
    t.string   "name",                          :null => false
    t.integer  "price",        :default => 1,   :null => false
    t.decimal  "price_growth", :default => 1.0, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password", :limit => 128
    t.string   "salt",               :limit => 128
    t.string   "confirmation_token", :limit => 128
    t.string   "remember_token",     :limit => 128
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.boolean  "admin"
    t.integer  "balance",                           :default => 1000
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
