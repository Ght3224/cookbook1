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

ActiveRecord::Schema.define(version: 2019_07_11_165811) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", primary_key: "dept_no", id: :string, limit: 4, force: :cascade do |t|
    t.string "dept_name", limit: 80, null: false
    t.index ["dept_name"], name: "departments_dept_name_key", unique: true
  end

  create_table "dept_emp", primary_key: ["emp_no", "dept_no"], force: :cascade do |t|
    t.integer "emp_no", null: false
    t.string "dept_no", limit: 4, null: false
    t.date "from_date", null: false
    t.date "to_date", null: false
    t.index ["dept_no"], name: "dept_emp_dept_no_idx"
    t.index ["emp_no"], name: "dept_emp_emp_no_idx"
  end

  create_table "dept_manager", primary_key: ["emp_no", "dept_no"], force: :cascade do |t|
    t.string "dept_no", limit: 4, null: false
    t.integer "emp_no", null: false
    t.date "from_date", null: false
    t.date "to_date", null: false
    t.index ["dept_no"], name: "dept_manager_dept_no_idx"
    t.index ["emp_no"], name: "dept_manager_emp_no_idx"
  end

# Could not dump table "employees" because of following StandardError
#   Unknown type 'employees_gender' for column 'gender'

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "ingredients"
    t.string "prep_time"
    t.string "integer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "salaries", primary_key: ["emp_no", "from_date"], force: :cascade do |t|
    t.integer "emp_no", null: false
    t.integer "salary", null: false
    t.date "from_date", null: false
    t.date "to_date", null: false
    t.index ["emp_no"], name: "salaries_emp_no_idx"
  end

  create_table "titles", primary_key: ["emp_no", "title", "from_date"], force: :cascade do |t|
    t.integer "emp_no", null: false
    t.string "title", limit: 100, null: false
    t.date "from_date", null: false
    t.date "to_date"
    t.index ["emp_no"], name: "titles_emp_no_idx"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "dept_emp", "departments", column: "dept_no", primary_key: "dept_no", name: "dept_emp_ibfk_2", on_delete: :cascade
  add_foreign_key "dept_emp", "employees", column: "emp_no", primary_key: "emp_no", name: "dept_emp_ibfk_1", on_delete: :cascade
  add_foreign_key "dept_manager", "departments", column: "dept_no", primary_key: "dept_no", name: "dept_manager_ibfk_2", on_delete: :cascade
  add_foreign_key "dept_manager", "employees", column: "emp_no", primary_key: "emp_no", name: "dept_manager_ibfk_1", on_delete: :cascade
  add_foreign_key "salaries", "employees", column: "emp_no", primary_key: "emp_no", name: "salaries_ibfk_1", on_delete: :cascade
  add_foreign_key "titles", "employees", column: "emp_no", primary_key: "emp_no", name: "titles_ibfk_1", on_delete: :cascade
end
