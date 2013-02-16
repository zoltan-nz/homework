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

ActiveRecord::Schema.define(:version => 20130216121859) do

  create_table "bookings", :force => true do |t|
    t.integer  "room_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "number_of_guests"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "bookings", ["room_id", "start_date", "end_date"], :name => "index_bookings_on_room_id_and_start_date_and_end_date"

  create_table "hosts", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "hosts", ["name"], :name => "index_hosts_on_name"

  create_table "rooms", :force => true do |t|
    t.integer  "host_id"
    t.integer  "capacity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "rooms", ["host_id"], :name => "index_rooms_on_host_id"

end
