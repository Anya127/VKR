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

ActiveRecord::Schema.define(version: 20171021174622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calendars", force: :cascade do |t|
    t.date     "date_c"
    t.boolean  "is_output"
    t.integer  "year_c"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.text     "name_c",       null: false
    t.text     "full_name_c",  null: false
    t.text     "d_vocation_c", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.text     "number_c",           null: false
    t.date     "d_conclusion_c",     null: false
    t.date     "d_expiration_c",     null: false
    t.float    "stavka",             null: false
    t.text     "vocation_c",         null: false
    t.text     "special_conditions"
    t.integer  "worker_id"
    t.integer  "relation_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["number_c", "d_conclusion_c"], name: "index_contracts_on_number_c_and_d_conclusion_c", unique: true, using: :btree
    t.index ["relation_id"], name: "index_contracts_on_relation_id", using: :btree
    t.index ["worker_id"], name: "index_contracts_on_worker_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.text     "name_p",      null: false
    t.text     "full_name_p", null: false
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_posts_on_category_id", using: :btree
  end

  create_table "relations", force: :cascade do |t|
    t.text     "d_vocation_pu", null: false
    t.integer  "post_id"
    t.integer  "unit_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["post_id"], name: "index_relations_on_post_id", using: :btree
    t.index ["unit_id"], name: "index_relations_on_unit_id", using: :btree
  end

  create_table "role_users", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.jsonb    "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_role_users_on_role_id", using: :btree
    t.index ["user_id"], name: "index_role_users_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "info"
    t.text     "full_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.text     "name_u",      null: false
    t.text     "full_name_u", null: false
    t.integer  "unit_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["unit_id"], name: "index_units_on_unit_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.index ["activation_token"], name: "index_users_on_activation_token", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
  end

  create_table "vocations", force: :cascade do |t|
    t.integer  "type_v",         null: false
    t.date     "d_conclusion_v", null: false
    t.date     "d_expiration_v", null: false
    t.boolean  "is_real",        null: false
    t.date     "order_date",     null: false
    t.text     "order_number",   null: false
    t.integer  "contract_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["contract_id"], name: "index_vocations_on_contract_id", using: :btree
  end

  create_table "workers", force: :cascade do |t|
    t.text     "l_name",     null: false
    t.text     "f_name",     null: false
    t.text     "s_name"
    t.text     "inn",        null: false
    t.text     "passport",   null: false
    t.text     "snils",      null: false
    t.date     "d_bday",     null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inn", "snils", "passport"], name: "index_workers_on_inn_and_snils_and_passport", unique: true, using: :btree
    t.index ["user_id"], name: "index_workers_on_user_id", using: :btree
  end

  add_foreign_key "contracts", "relations"
  add_foreign_key "contracts", "workers"
  add_foreign_key "posts", "categories"
  add_foreign_key "relations", "posts"
  add_foreign_key "relations", "units"
  add_foreign_key "role_users", "roles"
  add_foreign_key "role_users", "users"
  add_foreign_key "units", "units"
  add_foreign_key "vocations", "contracts"
  add_foreign_key "workers", "users"
end
