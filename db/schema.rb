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

ActiveRecord::Schema.define(version: 20170131202654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.string   "reference_url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "excerpt"
    t.string   "image_url"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "kind"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
  end

  create_table "picture_in_sections", force: :cascade do |t|
    t.integer  "picture_id"
    t.text     "sections",   default: [],              array: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["sections"], name: "index_picture_in_sections_on_sections", using: :gin
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "title"
    t.integer  "year"
    t.date     "photo_taken_date"
    t.text     "description"
    t.integer  "user_id"
    t.point    "location"
    t.string   "url"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "disposition_on_landing_page"
    t.string   "published"
    t.text     "list_of_tags"
  end

  create_table "promoted_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "order"
    t.boolean  "visible"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "seo_for_pages", force: :cascade do |t|
    t.string   "page_identifier"
    t.string   "title"
    t.text     "description"
    t.string   "keywords"
    t.string   "image_url"
    t.string   "url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "tags", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["category_id"], name: "index_tags_on_category_id", using: :btree
    t.index ["taggable_type", "taggable_id"], name: "index_tags_on_taggable_type_and_taggable_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
