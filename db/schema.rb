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

ActiveRecord::Schema[7.0].define(version: 2022_05_04_093213) do
  create_table "addresses", force: :cascade do |t|
    t.string "city"
    t.string "voivodship"
    t.string "postcode"
    t.string "country"
    t.string "street"
    t.integer "user_id", null: false
    t.integer "library_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_addresses_on_library_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "type"
    t.string "publisher"
    t.boolean "available"
    t.integer "order_id", null: false
    t.integer "library_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_books_on_library_id"
    t.index ["order_id"], name: "index_books_on_order_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.string "name"
    t.string "department"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "library_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "library_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_library_users_on_library_id"
    t.index ["user_id"], name: "index_library_users_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_date"
    t.string "return_date"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "subscryptions", force: :cascade do |t|
    t.string "price"
    t.string "level"
    t.integer "library_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_subscryptions_on_library_id"
  end

  create_table "user_data", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "university"
    t.string "department"
    t.string "field_of_study"
    t.string "country"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_data_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "libraries"
  add_foreign_key "addresses", "users"
  add_foreign_key "books", "libraries"
  add_foreign_key "books", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "subscryptions", "libraries"
  add_foreign_key "user_data", "users"
end
