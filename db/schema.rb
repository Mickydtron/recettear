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

ActiveRecord::Schema.define(version: 20150118025422) do

  create_table "inventory_items", force: true do |t|
    t.boolean  "sold"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sales_cycle_id"
    t.integer  "item_id"
    t.integer  "location"
  end

  add_index "inventory_items", ["item_id"], name: "index_inventory_items_on_item_id"
  add_index "inventory_items", ["sales_cycle_id"], name: "index_inventory_items_on_sales_cycle_id"

  create_table "item_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_categories_order_categories", force: true do |t|
    t.integer "item_category_id"
    t.integer "order_category_id"
  end

  add_index "item_categories_order_categories", ["item_category_id", "order_category_id"], name: "item_categories_order_categories_index"

  create_table "items", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_category_id"
  end

  add_index "items", ["item_category_id"], name: "index_items_on_item_category_id"

  create_table "items_order_categories", force: true do |t|
    t.integer "item_id"
    t.integer "order_category_id"
  end

  add_index "items_order_categories", ["item_id", "order_category_id"], name: "index_items_order_categories_on_item_id_and_order_category_id"

  create_table "order_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sales_cycle_id"
    t.integer  "order_category_id"
  end

  add_index "orders", ["order_category_id"], name: "index_orders_on_order_category_id"
  add_index "orders", ["sales_cycle_id"], name: "index_orders_on_sales_cycle_id"

  create_table "sales_cycles", force: true do |t|
    t.integer  "customerCount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "sales_cycles", ["user_id"], name: "index_sales_cycles_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
