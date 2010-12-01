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

ActiveRecord::Schema.define(:version => 20101124134042) do

  create_table "jobs", :force => true do |t|
    t.string   "jobTitle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leagues", :force => true do |t|
    t.string   "leagueName"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.integer  "user_id"
    t.string   "primaryPosition"
    t.string   "secondPosition"
    t.string   "thirdPosition"
    t.float    "weight"
    t.integer  "Number"
    t.integer  "team_id"
    t.string   "foot"
    t.date     "inTeamSince"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "standing_datas", :force => true do |t|
    t.date     "birthday"
    t.string   "birthcountry"
    t.string   "nationality"
    t.string   "mobilephone"
    t.string   "street"
    t.string   "city"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "firstname"
    t.string   "middlename"
    t.string   "lastname"
  end

  create_table "teams", :force => true do |t|
    t.string   "teamName"
    t.integer  "league_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "division"
    t.boolean  "manTeam"
  end

  create_table "training_dates", :force => true do |t|
    t.integer  "team_id"
    t.datetime "date"
    t.string   "trainingtype"
    t.integer  "intensity"
    t.text     "description"
    t.string   "objective"
    t.text     "review"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "email"
  end

end
