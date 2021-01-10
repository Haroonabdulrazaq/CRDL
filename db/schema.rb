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

ActiveRecord::Schema.define(version: 2021_01_10_054135) do

  create_table "currencies", force: :cascade do |t|
    t.string "currency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "department_for_tests", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "users_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["users_id"], name: "index_department_for_tests_on_users_id"
  end

  create_table "lab_tests", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.float "price_per_unit"
    t.integer "users_id", null: false
    t.integer "department_for_tests_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_for_tests_id"], name: "index_lab_tests_on_department_for_tests_id"
    t.index ["users_id"], name: "index_lab_tests_on_users_id"
  end

  create_table "prices", force: :cascade do |t|
    t.float "price", default: 0.0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "results", force: :cascade do |t|
    t.float "Tv"
    t.float "Ws"
    t.boolean "proteinrich"
    t.float "Wsc"
    t.float "Wca"
    t.float "Abs"
    t.float "T"
    t.float "DO5"
    t.float "DO1"
    t.float "DABSsample"
    t.float "DABSstd"
    t.float "Bsap"
    t.float "Ssap"
    t.float "Nsap"
    t.float "Wsap"
    t.float "Va"
    t.float "Na"
    t.float "Wa"
    t.float "bi"
    t.float "Si"
    t.float "Ni"
    t.float "Wi"
    t.float "Vp"
    t.float "Np"
    t.integer "sample_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sample_id"], name: "index_results_on_sample_id"
  end

  create_table "samples", force: :cascade do |t|
    t.text "name"
    t.text "Address"
    t.text "institution"
    t.string "phone_num"
    t.text "email"
    t.text "supervisor_name"
    t.text "supervisor_contact"
    t.text "referrer"
    t.text "current_status"
    t.text "required_service"
    t.text "description"
    t.boolean "perishable"
    t.decimal "retention_time"
    t.date "result_due_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "price_id"
    t.integer "currency_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.boolean "admin_role", default: false, null: false
    t.boolean "scientist_role", default: false, null: false
    t.boolean "receptionist_role", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "department_for_tests", "users", column: "users_id"
  add_foreign_key "lab_tests", "department_for_tests", column: "department_for_tests_id"
  add_foreign_key "lab_tests", "users", column: "users_id"
  add_foreign_key "results", "samples"
  add_foreign_key "samples", "currencies"
  add_foreign_key "samples", "prices"
end
