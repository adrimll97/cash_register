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

ActiveRecord::Schema.define(version: 2023_11_18_160042) do

  create_table "basket_products", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_basket_products_on_product_id"
  end

  create_table "free_promotions", force: :cascade do |t|
    t.integer "bougths_products"
    t.integer "free_products"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "price_promotions", force: :cascade do |t|
    t.integer "min_product_quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "product_discount"
  end

  create_table "product_promotions", force: :cascade do |t|
    t.integer "product_id", null: false
    t.string "promotionable_type", null: false
    t.integer "promotionable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_promotions_on_product_id"
    t.index ["promotionable_type", "promotionable_id"], name: "index_product_promotions_on_promotionable"
  end

  create_table "products", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_products_on_code", unique: true
  end

  add_foreign_key "basket_products", "products"
  add_foreign_key "product_promotions", "products"
end
