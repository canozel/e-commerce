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

ActiveRecord::Schema.define(version: 20150318114323) do

  create_table "addresses", force: :cascade do |t|
    t.string   "recipient",  limit: 255
    t.string   "city",       limit: 255
    t.string   "street",     limit: 255
    t.string   "zip_code",   limit: 255
    t.string   "phone",      limit: 255
    t.integer  "user_id",    limit: 4
    t.integer  "status",     limit: 4,   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["status"], name: "index_addresses_on_status", using: :btree
  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "carts", force: :cascade do |t|
    t.integer  "line_items_count", limit: 4, default: 0
    t.integer  "shipment_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "carts", ["shipment_id"], name: "index_carts_on_shipment_id", using: :btree
  add_index "carts", ["updated_at"], name: "index_carts_on_updated_at", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.text     "description",    limit: 65535
    t.integer  "products_count", limit: 4,     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_translations", force: :cascade do |t|
    t.integer  "category_id", limit: 4,   null: false
    t.string   "locale",      limit: 255, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "title",       limit: 255
  end

  add_index "category_translations", ["category_id"], name: "index_category_translations_on_category_id", using: :btree
  add_index "category_translations", ["locale"], name: "index_category_translations_on_locale", using: :btree
  add_index "category_translations", ["title"], name: "index_category_translations_on_title", using: :btree

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "order_id",   limit: 4
    t.integer  "cart_id",    limit: 4
    t.integer  "quantity",   limit: 4,                         default: 1
    t.decimal  "price",                precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "shipping_address_id", limit: 4
    t.integer  "billing_address_id",  limit: 4
    t.integer  "shipment_id",         limit: 4
    t.integer  "user_id",             limit: 4
    t.integer  "payment_id",          limit: 4
    t.integer  "status",              limit: 4, default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["billing_address_id"], name: "index_orders_on_billing_address_id", using: :btree
  add_index "orders", ["payment_id"], name: "index_orders_on_payment_id", using: :btree
  add_index "orders", ["shipment_id"], name: "index_orders_on_shipment_id", using: :btree
  add_index "orders", ["shipping_address_id"], name: "index_orders_on_shipping_address_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "payment_translations", force: :cascade do |t|
    t.integer  "payment_id", limit: 4,   null: false
    t.string   "locale",     limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "title",      limit: 255
  end

  add_index "payment_translations", ["locale"], name: "index_payment_translations_on_locale", using: :btree
  add_index "payment_translations", ["payment_id"], name: "index_payment_translations_on_payment_id", using: :btree
  add_index "payment_translations", ["title"], name: "index_payment_translations_on_title", using: :btree

  create_table "payments", force: :cascade do |t|
    t.string "title", limit: 255
  end

  create_table "product_translations", force: :cascade do |t|
    t.integer  "product_id",  limit: 4,     null: false
    t.string   "locale",      limit: 255,   null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
  end

  add_index "product_translations", ["locale"], name: "index_product_translations_on_locale", using: :btree
  add_index "product_translations", ["product_id"], name: "index_product_translations_on_product_id", using: :btree
  add_index "product_translations", ["title"], name: "index_product_translations_on_title", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.string   "ean",            limit: 255
    t.text     "description",    limit: 65535
    t.decimal  "price",                        precision: 8, scale: 2
    t.string   "image",          limit: 255
    t.integer  "quantity",       limit: 4,                             default: 0
    t.integer  "reserved_count", limit: 4,                             default: 0
    t.integer  "sold_count",     limit: 4,                             default: 0
    t.integer  "category_id",    limit: 4
    t.integer  "vat_id",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["created_at"], name: "index_products_on_created_at", using: :btree
  add_index "products", ["price"], name: "index_products_on_price", using: :btree
  add_index "products", ["updated_at"], name: "index_products_on_updated_at", using: :btree
  add_index "products", ["vat_id"], name: "index_products_on_vat_id", using: :btree

  create_table "shipment_translations", force: :cascade do |t|
    t.integer  "shipment_id", limit: 4,   null: false
    t.string   "locale",      limit: 255, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "title",       limit: 255
  end

  add_index "shipment_translations", ["locale"], name: "index_shipment_translations_on_locale", using: :btree
  add_index "shipment_translations", ["shipment_id"], name: "index_shipment_translations_on_shipment_id", using: :btree
  add_index "shipment_translations", ["title"], name: "index_shipment_translations_on_title", using: :btree

  create_table "shipments", force: :cascade do |t|
    t.string  "provider", limit: 255
    t.string  "title",    limit: 255
    t.decimal "fee",                  precision: 8, scale: 2
    t.boolean "default",                                      default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "name",                   limit: 255
    t.string   "string",                 limit: 255
    t.integer  "role",                   limit: 4
    t.integer  "integer",                limit: 4
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "invitation_token",       limit: 255
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit",       limit: 4
    t.integer  "invited_by_id",          limit: 4
    t.string   "invited_by_type",        limit: 255
    t.integer  "invitations_count",      limit: 4,   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invited_by_id", "invited_by_type"], name: "index_users_on_invited_by_id_and_invited_by_type", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vats", force: :cascade do |t|
    t.string  "title", limit: 255
    t.integer "rate",  limit: 4
  end

end
