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

ActiveRecord::Schema.define(version: 20190421064153) do

  create_table "menu_categories", force: :cascade do |t|
    t.text     "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "category_id"
    t.text     "name",          null: false
    t.text     "description",   null: false
    t.text     "image_path_01"
    t.text     "image_path_02"
    t.text     "image_path_03"
    t.integer  "price",         null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "menus", ["category_id"], name: "index_menus_on_category_id"
  add_index "menus", ["restaurant_id"], name: "index_menus_on_restaurant_id"

  create_table "order_histories", force: :cascade do |t|
    t.integer  "menu_id"
    t.integer  "quantity",     null: false
    t.integer  "seat_number",  null: false
    t.boolean  "is_telled",    null: false
    t.boolean  "is_cancelled", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "order_histories", ["menu_id"], name: "index_order_histories_on_menu_id"

  create_table "restaurants", force: :cascade do |t|
    t.text     "name",           null: false
    t.integer  "number_of_seat", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
