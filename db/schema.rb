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

ActiveRecord::Schema.define(version: 2019_03_12_072829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "apartments", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "postal_code"
    t.string "city"
    t.string "province"
    t.float "lat"
    t.float "lng"
    t.integer "capacity"
    t.integer "square_meters"
    t.integer "rooms"
    t.integer "bedrooms"
    t.integer "toilette"
    t.integer "in_evidence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "area_id"
    t.index ["area_id"], name: "index_apartments_on_area_id"
  end

  create_table "apartments_services", force: :cascade do |t|
    t.bigint "apartment_id"
    t.bigint "service_id"
    t.index ["apartment_id"], name: "index_apartments_services_on_apartment_id"
    t.index ["service_id"], name: "index_apartments_services_on_service_id"
  end

  create_table "areas", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["name"], name: "index_areas_on_name"
  end

  create_table "requests", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_services_on_name"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
