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

ActiveRecord::Schema.define(version: 2018_08_22_162846) do

  create_table "crono_jobs", force: :cascade do |t|
    t.string "job_id", null: false
    t.text "log", limit: 1073741823
    t.datetime "last_performed_at"
    t.boolean "healthy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_crono_jobs_on_job_id", unique: true
  end

  create_table "cryptocurrencies", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.string "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cryptocurrency_id"
    t.index ["cryptocurrency_id"], name: "index_cryptocurrencies_on_cryptocurrency_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "symbol"
    t.string "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["symbol"], name: "index_currencies_on_symbol"
  end

  create_table "histories", force: :cascade do |t|
    t.string "amount1"
    t.string "amount2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "currency1"
    t.string "currency2"
  end

end
