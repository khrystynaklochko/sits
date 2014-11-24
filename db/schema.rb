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

ActiveRecord::Schema.define(version: 20141123233255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operators", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["key"], name: "index_tickets_on_key", unique: true, using: :btree

  create_table "tickets_types", force: true do |t|
    t.integer  "ticket_id"
    t.integer  "department_id"
    t.integer  "status_id"
    t.integer  "operator_id"
    t.string   "subject"
    t.text     "description"
    t.string   "from"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets_types", ["department_id"], name: "index_tickets_types_on_department_id", using: :btree
  add_index "tickets_types", ["operator_id"], name: "index_tickets_types_on_operator_id", using: :btree
  add_index "tickets_types", ["status_id"], name: "index_tickets_types_on_status_id", using: :btree
  add_index "tickets_types", ["ticket_id"], name: "index_tickets_types_on_ticket_id", using: :btree

end
