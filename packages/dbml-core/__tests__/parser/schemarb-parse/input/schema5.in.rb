# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_11_14_000001) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", id: :bigint, default: -> { "timestamp_id('accounts'::text)" }, force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "domain"
  end

  create_table "account_domain_blocks", force: :cascade do |t|
    t.string "domain"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "account_id"
    t.index ["account_id", "domain"], name: "index_account_domain_blocks_on_account_id_and_domain", unique: true
  end

  # add_foreign_key "account_domain_blocks", "accounts", name: "fk_206c6029bd", on_delete: :cascade
  add_foreign_key "account_domain_blocks", "accounts", on_delete: :cascade
end
