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

ActiveRecord::Schema.define(version: 20140914104529) do

  create_table "ruby_wedding_courses", force: true do |t|
    t.string   "name"
    t.integer  "menu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order",      default: 0, null: false
  end

  add_index "ruby_wedding_courses", ["menu_id"], name: "index_ruby_wedding_courses_on_menu_id"

  create_table "ruby_wedding_dishes", force: true do |t|
    t.string   "name"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "vegetarian"
    t.string   "shortname",  limit: 20
  end

  add_index "ruby_wedding_dishes", ["course_id"], name: "index_ruby_wedding_dishes_on_course_id"

  create_table "ruby_wedding_guests", force: true do |t|
    t.string   "firstname"
    t.string   "surname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invitation_id"
    t.boolean  "child",         default: false, null: false
    t.boolean  "rsvp"
  end

  add_index "ruby_wedding_guests", ["invitation_id"], name: "index_ruby_wedding_guests_on_invitation_id"

  create_table "ruby_wedding_invitations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "notes",      limit: 2000
  end

  create_table "ruby_wedding_menu_choices", force: true do |t|
    t.integer  "dish_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
    t.integer  "rsvp_id",    default: 0, null: false
    t.integer  "guest_id",   default: 0, null: false
  end

  add_index "ruby_wedding_menu_choices", ["dish_id"], name: "index_ruby_wedding_menu_choices_on_dish_id"
  add_index "ruby_wedding_menu_choices", ["rsvp_id"], name: "index_ruby_wedding_menu_choices_on_rsvp_id"

  create_table "ruby_wedding_menus", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
