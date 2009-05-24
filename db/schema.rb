# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090423164730) do

  create_table "contacts", :force => true do |t|
    t.text     "team_left"
    t.text     "team_center"
    t.text     "team_right"
    t.text     "hardware_left"
    t.text     "hardware_center"
    t.text     "hardware_right"
    t.text     "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string  "name"
    t.date    "date"
    t.text    "kind"
    t.text    "column_left"
    t.text    "column_center"
    t.text    "column_right"
    t.integer "reference_id"
    t.string  "location_name"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "lat"
    t.float    "lng"
    t.string   "full_address"
  end

  create_table "news", :force => true do |t|
    t.string  "name"
    t.date    "date"
    t.integer "city_id"
    t.integer "photo_id"
    t.text    "column_left"
    t.text    "column_center"
    t.text    "column_right"
  end

  create_table "photos", :force => true do |t|
    t.integer  "attachable_id"
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachable_type"
  end

  create_table "publications", :force => true do |t|
    t.string  "name"
    t.text    "description"
    t.date    "date"
    t.integer "parent_id"
    t.string  "content_type"
    t.string  "filename"
    t.string  "thumbnail"
    t.integer "size"
    t.integer "width"
    t.integer "height"
  end

  create_table "references", :force => true do |t|
    t.string  "name"
    t.text    "column_left"
    t.text    "column_center"
    t.text    "column_right"
    t.integer "location_id"
    t.integer "size"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

end
