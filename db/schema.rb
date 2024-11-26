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

ActiveRecord::Schema[7.2].define(version: 2024_11_25_170639) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street", null: false
    t.string "number", null: false
    t.string "neighborhood", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "cep", null: false
    t.bigint "proponent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proponent_id"], name: "index_addresses_on_proponent_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.boolean "reference", default: false
    t.string "telephone", null: false
    t.bigint "proponent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proponent_id"], name: "index_contacts_on_proponent_id"
  end

  create_table "proponents", force: :cascade do |t|
    t.string "name", null: false
    t.string "cpf", null: false
    t.date "birth_date", null: false
    t.decimal "salary", precision: 11, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "discount", precision: 11, scale: 2
    t.integer "aliquot_range", default: 1, null: false
  end

  add_foreign_key "addresses", "proponents"
  add_foreign_key "contacts", "proponents"
end
