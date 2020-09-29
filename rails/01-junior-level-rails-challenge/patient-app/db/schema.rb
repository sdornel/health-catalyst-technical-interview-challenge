# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_27_162859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "partner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exports", force: :cascade do |t|
    t.string "export_status", default: "Pending"
    t.integer "number_records"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "export_ended"
    t.float "export_duration_in_mins"
    t.integer "customer_id"
    t.integer "partner_id"
  end

  create_table "partners", force: :cascade do |t|
    t.string "name"
    t.string "location"
  end

  create_table "patients", force: :cascade do |t|
    t.date "date_of_birth"
    t.string "given_name"
    t.string "family_name"
    t.string "phone_number"
    t.string "sex"
    t.string "external_id"
    t.integer "customer_id"
    t.integer "customer_external_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
