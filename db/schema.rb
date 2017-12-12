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

ActiveRecord::Schema.define(version: 20171212155258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: :cascade do |t|
    t.integer  "owner_profile_id"
    t.string   "status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["owner_profile_id"], name: "index_jobs_on_owner_profile_id", using: :btree
  end

  create_table "owner_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "verification_status"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["user_id"], name: "index_owner_profiles_on_user_id", using: :btree
  end

  create_table "requests", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "status"
    t.integer  "job_id"
    t.integer  "worker_profile_id"
    t.float    "hours"
    t.time     "start_time"
    t.float    "material_cost"
    t.datetime "time"
    t.string   "photo"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["job_id"], name: "index_requests_on_job_id", using: :btree
    t.index ["worker_profile_id"], name: "index_requests_on_worker_profile_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    # TO DO correct spelling (rename column) location
    t.string   "loacation"
    t.string   "phone_number"
    t.string   "photo"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "worker_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "verification_status"
    t.string   "skill_area"
    t.text     "bio"
    t.integer  "price_per_hour"
    t.date     "dob"
    t.boolean  "available"
    t.time     "timetable"
    t.integer  "completed_tasks"
    t.float    "rating"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["user_id"], name: "index_worker_profiles_on_user_id", using: :btree
  end

  add_foreign_key "jobs", "owner_profiles"
  add_foreign_key "owner_profiles", "users"
  add_foreign_key "requests", "jobs"
  add_foreign_key "requests", "worker_profiles"
  add_foreign_key "worker_profiles", "users"
end
