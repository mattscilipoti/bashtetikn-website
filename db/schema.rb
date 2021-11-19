# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_10_234817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "page_scans", force: :cascade do |t|
    t.string "type"
    t.string "url"
    t.bigint "webpage_id"
    t.string "warnings", default: [], array: true
    t.string "issues", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "raw_results"
    t.index ["issues"], name: "index_page_scans_on_issues", using: :gin
    t.index ["warnings"], name: "index_page_scans_on_warnings", using: :gin
    t.index ["webpage_id"], name: "index_page_scans_on_webpage_id"
  end

  create_table "webpages", force: :cascade do |t|
    t.string "name"
    t.string "url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "website_id"
    t.index ["website_id"], name: "index_webpages_on_website_id"
  end

  create_table "websites", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "page_scans", "webpages"
  add_foreign_key "webpages", "websites"
end
