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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130819131424) do

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.string   "file_extension"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "rules", :force => true do |t|
    t.string   "expression"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "technicalnote"
    t.string   "businessnote"
    t.integer  "language_id"
    t.integer  "type_of_rule_id"
  end

  create_table "type_of_rules", :force => true do |t|
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vulnerabilities", :force => true do |t|
    t.string   "file"
    t.integer  "loc"
    t.string   "who_commited_it"
    t.integer  "points"
    t.string   "description"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "rule_id"
  end

end
