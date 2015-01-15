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

ActiveRecord::Schema.define(version: 20150113134503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bundle_supplies", force: true do |t|
    t.integer  "supply_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bundle_id"
  end

  add_index "bundle_supplies", ["bundle_id"], name: "index_bundle_supplies_on_bundle_id", using: :btree
  add_index "bundle_supplies", ["supply_id"], name: "index_bundle_supplies_on_supply_id", using: :btree

  create_table "bundles", force: true do |t|
    t.string   "bundle_name"
    t.string   "pricing"
    t.text     "bundle_desc"
    t.integer  "person_min"
    t.integer  "person_max"
    t.integer  "supplier_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bundles", ["supplier_id"], name: "index_bundles_on_supplier_id", using: :btree

  create_table "galleries", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "photo_id_id"
    t.integer  "supply_id_id"
  end

  add_index "galleries", ["photo_id_id"], name: "index_galleries_on_photo_id_id", using: :btree
  add_index "galleries", ["supply_id_id"], name: "index_galleries_on_supply_id_id", using: :btree

  create_table "photos", force: true do |t|
    t.string   "name"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pricings", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", force: true do |t|
    t.string   "supplier_name"
    t.string   "supplier_address"
    t.string   "supplier_email"
    t.string   "supplier_contact_no"
    t.text     "supplier_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "avatar"
  end

  create_table "supplies", force: true do |t|
    t.string   "supply_name"
    t.text     "supply_desc"
    t.decimal  "supply_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "supplier_id"
    t.string   "pricing"
  end

  add_index "supplies", ["supplier_id"], name: "index_supplies_on_supplier_id", using: :btree

end
