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

ActiveRecord::Schema.define(version: 20130726144117) do

  create_table "activities", force: true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "titulo"
    t.string   "slugg"
    t.text     "descripcion"
    t.integer  "dificultad"
    t.string   "imgExt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id"
  end

  add_index "courses", ["student_id"], name: "index_courses_on_student_id"

  create_table "friendships", force: true do |t|
    t.integer  "friend_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "homeworks", force: true do |t|
    t.string   "titulo"
    t.text     "descripcion"
    t.date     "entrega"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "homeworks", ["course_id"], name: "index_homeworks_on_course_id"

  create_table "my_courses", force: true do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "my_courses", ["course_id"], name: "index_my_courses_on_course_id"
  add_index "my_courses", ["student_id"], name: "index_my_courses_on_student_id"

  create_table "publications", force: true do |t|
    t.text     "body"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
  end

  add_index "publications", ["student_id"], name: "index_publications_on_student_id"

  create_table "students", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nombre"
    t.string   "apellido"
    t.text     "biografia"
    t.string   "img"
  end

  add_index "students", ["email"], name: "index_students_on_email", unique: true
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true

  create_table "topics", force: true do |t|
    t.string   "titulo"
    t.integer  "corte"
    t.integer  "course_id"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topics", ["course_id"], name: "index_topics_on_course_id"

end
