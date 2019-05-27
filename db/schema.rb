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

ActiveRecord::Schema.define(version: 20190524164539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "book_suggestions", force: :cascade do |t|
    t.string "synopsis"
    t.decimal "price"
    t.string "author", null: false
    t.string "title", null: false
    t.string "link", null: false
    t.string "editor", null: false
    t.string "year", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_book_suggestions_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "genre", null: false
    t.string "author", null: false
    t.string "image", null: false
    t.string "title", limit: 25, null: false
    t.string "editor", null: false
    t.string "year", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rents", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "book_id", null: false
    t.date "start_date_rent", null: false
    t.date "end_date_rent", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_rents_on_book_id"
    t.index ["user_id"], name: "index_rents_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "current_sign_in_ip"
    t.datetime "current_sign_in_at"
    t.integer "sign_in_count"
    t.string "last_sign_in_ip"
    t.datetime "last_sign_in_at"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "locale"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "wprof_controllers", force: :cascade do |t|
    t.string "transaction_id"
    t.float "total_time"
    t.datetime "start_dt"
    t.datetime "end_dt"
    t.integer "code"
    t.string "controller"
    t.string "url"
    t.float "db_runtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_wprof_controllers_on_code"
    t.index ["transaction_id"], name: "index_wprof_controllers_on_transaction_id"
    t.index ["url"], name: "index_wprof_controllers_on_url"
  end

  create_table "wprof_methods", force: :cascade do |t|
    t.string "transaction_id"
    t.float "total_time"
    t.datetime "start_dt"
    t.datetime "end_dt"
    t.string "method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["method"], name: "index_wprof_methods_on_method"
    t.index ["transaction_id"], name: "index_wprof_methods_on_transaction_id"
  end

  create_table "wprof_services", force: :cascade do |t|
    t.string "transaction_id"
    t.float "total_time"
    t.datetime "start_dt"
    t.datetime "end_dt"
    t.integer "code"
    t.string "service_hostname"
    t.string "request_uri"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_wprof_services_on_code"
    t.index ["request_uri"], name: "index_wprof_services_on_request_uri"
    t.index ["service_hostname"], name: "index_wprof_services_on_service_hostname"
    t.index ["transaction_id"], name: "index_wprof_services_on_transaction_id"
  end

  add_foreign_key "book_suggestions", "users"
  add_foreign_key "rents", "books"
  add_foreign_key "rents", "users"
end
