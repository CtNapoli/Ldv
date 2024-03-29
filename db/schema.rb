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

ActiveRecord::Schema.define(version: 2024_03_02_154216) do

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

  create_table "admins", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_admins_on_username"
  end

  create_table "apartment_translations", force: :cascade do |t|
    t.bigint "apartment_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "content"
    t.index ["apartment_id"], name: "index_apartment_translations_on_apartment_id"
    t.index ["locale"], name: "index_apartment_translations_on_locale"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "area_id"
    t.boolean "published", default: true
    t.boolean "in_evidence", default: false
    t.string "slug"
    t.text "content", default: "[]"
    t.float "price_default"
    t.float "price_cleaning_service"
    t.string "old_slug"
    t.float "price_selling"
    t.boolean "on_selling", default: false
    t.index ["area_id"], name: "index_apartments_on_area_id"
    t.index ["slug"], name: "index_apartments_on_slug", unique: true
  end

  create_table "apartments_services", force: :cascade do |t|
    t.bigint "apartment_id"
    t.bigint "service_id"
    t.index ["apartment_id"], name: "index_apartments_services_on_apartment_id"
    t.index ["service_id"], name: "index_apartments_services_on_service_id"
  end

  create_table "area_translations", force: :cascade do |t|
    t.bigint "area_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "description"
    t.text "content"
    t.index ["area_id"], name: "index_area_translations_on_area_id"
    t.index ["locale"], name: "index_area_translations_on_locale"
  end

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.text "content", default: "[]"
    t.string "slug"
    t.index ["name"], name: "index_areas_on_name"
    t.index ["slug"], name: "index_areas_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "owner_requests", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "email"
    t.string "phone_number"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade do |t|
    t.date "start"
    t.date "end"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "apartment_id"
    t.date "price_offer_start"
    t.date "price_offer_end"
    t.float "price_offer_value"
    t.float "price_without_offer"
    t.index ["apartment_id"], name: "index_prices_on_apartment_id"
  end

  create_table "question_translations", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "request"
    t.string "reply"
    t.index ["locale"], name: "index_question_translations_on_locale"
    t.index ["question_id"], name: "index_question_translations_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "request"
    t.text "reply"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_questions_on_slug", unique: true
  end

  create_table "requests", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "guests"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "apartment_id"
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.text "more_info"
    t.datetime "date_start"
    t.datetime "date_end"
    t.integer "status", default: 50
    t.float "total_price"
    t.index ["apartment_id"], name: "index_reservations_on_apartment_id"
  end

  create_table "service_translations", force: :cascade do |t|
    t.bigint "service_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["locale"], name: "index_service_translations_on_locale"
    t.index ["service_id"], name: "index_service_translations_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["name"], name: "index_services_on_name"
    t.index ["slug"], name: "index_services_on_slug", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
