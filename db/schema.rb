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

ActiveRecord::Schema.define(version: 2020_06_07_142133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "name_original"
    t.string "street_original"
    t.string "code"
    t.string "town"
    t.string "country"
    t.string "delivery_phone"
    t.string "email"
    t.string "address_note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.index ["order_id"], name: "index_addresses_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "id_distributors"
    t.string "payment_method"
    t.string "transaction_id"
    t.string "transaction_mode"
    t.string "transaction_state"
    t.string "transaction_percent"
    t.string "tva_reference"
    t.string "import_url"
    t.string "coupon"
    t.string "amount"
    t.string "god_father"
    t.boolean "shipping_direct"
    t.boolean "is_shipped"
    t.string "how_known"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shipping_address_id"
    t.bigint "billing_address_id"
    t.string "payment_id"
    t.index ["billing_address_id"], name: "index_orders_on_billing_address_id"
    t.index ["shipping_address_id"], name: "index_orders_on_shipping_address_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_type"
    t.string "product_category"
    t.string "number"
    t.string "pricing"
    t.string "unit"
    t.string "subtotal"
    t.string "shipping"
    t.string "total"
    t.string "mode"
    t.string "tax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.index ["order_id"], name: "index_products_on_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "products", "orders"
end
