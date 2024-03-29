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

ActiveRecord::Schema.define(version: 20151202144340) do

  create_table "basket_items", force: :cascade do |t|
    t.integer  "wine_id"
    t.integer  "basket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quantity"
  end

  create_table "baskets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "wines", force: :cascade do |t|
    t.string   "short_description"
    t.string   "bottle_size"
    t.float    "price"
    t.string   "long_description"
    t.string   "origin_country"
    t.string   "company"
    t.string   "grape_type"
    t.boolean  "is_vegetarian"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "image_url"
    t.string   "barcode"
  end

end
