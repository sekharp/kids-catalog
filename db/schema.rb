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

ActiveRecord::Schema.define(version: 20160117221446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "author_first_name"
    t.string   "author_last_name"
    t.string   "isbn"
  end

  create_table "books_users", id: false, force: :cascade do |t|
    t.integer "book_id",   null: false
    t.integer "user_id",   null: false
    t.boolean "favorited"
    t.boolean "read"
  end

  add_index "books_users", ["book_id"], name: "index_books_users_on_book_id", using: :btree
  add_index "books_users", ["user_id"], name: "index_books_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "grade"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.string   "email"
    t.string   "image_url"
    t.datetime "token_expires_at"
  end

end
