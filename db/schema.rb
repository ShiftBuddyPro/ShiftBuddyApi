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

ActiveRecord::Schema.define(version: 20181227053939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cash_drops", force: :cascade do |t|
    t.float "amount"
    t.integer "number"
    t.bigint "shift_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shift_id"], name: "index_cash_drops_on_shift_id"
  end

  create_table "change_sheets", force: :cascade do |t|
    t.bigint "shift_id"
    t.integer "start_pennies"
    t.integer "start_nickels"
    t.integer "start_dimes"
    t.integer "start_quarters"
    t.integer "start_ones"
    t.integer "start_fives"
    t.integer "start_tens"
    t.integer "start_twenties"
    t.integer "end_pennies"
    t.integer "end_nickels"
    t.integer "end_dimes"
    t.integer "end_quarters"
    t.integer "end_ones"
    t.integer "end_fives"
    t.integer "end_tens"
    t.integer "end_twenties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shift_id"], name: "index_change_sheets_on_shift_id"
  end

  create_table "checks", force: :cascade do |t|
    t.integer "number"
    t.string "company"
    t.float "amount"
    t.bigint "shift_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shift_id"], name: "index_checks_on_shift_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.bigint "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "username"
    t.index ["manager_id"], name: "index_employees_on_manager_id"
  end

  create_table "inventory_items", force: :cascade do |t|
    t.string "name"
    t.integer "start_amount"
    t.integer "end_amount"
    t.bigint "shift_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shift_id"], name: "index_inventory_items_on_shift_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.string "message"
    t.bigint "shift_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shift_id"], name: "index_notes_on_shift_id"
  end

  create_table "paid_outs", force: :cascade do |t|
    t.string "company"
    t.float "amount"
    t.bigint "shift_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shift_id"], name: "index_paid_outs_on_shift_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_shifts_on_employee_id"
  end

  create_table "tracked_items", force: :cascade do |t|
    t.string "name"
    t.bigint "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_tracked_items_on_manager_id"
  end

  add_foreign_key "cash_drops", "shifts"
  add_foreign_key "change_sheets", "shifts"
  add_foreign_key "checks", "shifts"
  add_foreign_key "employees", "managers"
  add_foreign_key "inventory_items", "shifts"
  add_foreign_key "notes", "shifts"
  add_foreign_key "paid_outs", "shifts"
  add_foreign_key "shifts", "employees"
  add_foreign_key "tracked_items", "managers"
end
