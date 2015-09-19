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

ActiveRecord::Schema.define(version: 20150919054448) do

  create_table "crime_histories", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,   null: false
    t.string   "crime_name", limit: 255, null: false
    t.date     "crimed_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "crime_histories", ["user_id"], name: "index_crime_histories_on_user_id", using: :btree

  create_table "educational_backgrounds", force: :cascade do |t|
    t.integer  "user_id",     limit: 4,   null: false
    t.string   "school_name", limit: 255, null: false
    t.date     "joined_at"
    t.date     "quited_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "educational_backgrounds", ["user_id"], name: "index_educational_backgrounds_on_user_id", using: :btree

  create_table "face_selections", force: :cascade do |t|
    t.string   "file_name",    limit: 255, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "face_type_id", limit: 4,   null: false
  end

  add_index "face_selections", ["face_type_id"], name: "index_face_selections_on_face_type_id", using: :btree

  create_table "face_types", force: :cascade do |t|
    t.string   "type",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "medical_histories", force: :cascade do |t|
    t.integer  "user_id",      limit: 4,   null: false
    t.string   "disease_name", limit: 255, null: false
    t.date     "joined_at"
    t.date     "quited_at"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "medical_histories", ["user_id"], name: "index_medical_histories_on_user_id", using: :btree

  create_table "preference_faces", force: :cascade do |t|
    t.integer  "user_id",      limit: 4, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "face_type_id", limit: 4, null: false
  end

  add_index "preference_faces", ["face_type_id"], name: "index_preference_faces_on_face_type_id", using: :btree
  add_index "preference_faces", ["user_id"], name: "index_preference_faces_on_user_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.integer  "sender_id",   limit: 4,               null: false
    t.integer  "receiver_id", limit: 4,               null: false
    t.string   "message",     limit: 255
    t.integer  "status",      limit: 4,   default: 0, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "requests", ["receiver_id"], name: "index_requests_on_receiver_id", using: :btree
  add_index "requests", ["sender_id"], name: "index_requests_on_sender_id", using: :btree

  create_table "talks", force: :cascade do |t|
    t.integer  "sender_id",   limit: 4,   null: false
    t.integer  "receiver_id", limit: 4,   null: false
    t.string   "message",     limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "talks", ["receiver_id"], name: "index_talks_on_receiver_id", using: :btree
  add_index "talks", ["sender_id"], name: "index_talks_on_sender_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "my_number",              limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "name",                   limit: 255,              null: false
    t.date     "birthdate",                                       null: false
    t.string   "address",                limit: 255,              null: false
    t.string   "hobby",                  limit: 255
    t.integer  "gender",                 limit: 4,                null: false
    t.string   "avater",                 limit: 255,              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "face_type_id",           limit: 4,                null: false
  end

  add_index "users", ["face_type_id"], name: "index_users_on_face_type_id", using: :btree
  add_index "users", ["my_number"], name: "index_users_on_my_number", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "work_experiences", force: :cascade do |t|
    t.integer  "user_id",      limit: 4,   null: false
    t.string   "company_name", limit: 255, null: false
    t.date     "joined_at"
    t.date     "quited_at"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "work_experiences", ["user_id"], name: "index_work_experiences_on_user_id", using: :btree

  add_foreign_key "crime_histories", "users"
  add_foreign_key "educational_backgrounds", "users"
  add_foreign_key "face_selections", "face_types"
  add_foreign_key "medical_histories", "users"
  add_foreign_key "preference_faces", "face_types"
  add_foreign_key "preference_faces", "users"
  add_foreign_key "users", "face_types"
  add_foreign_key "work_experiences", "users"
end
