# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_06_225443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "color"
    t.decimal "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.string "rgb"
    t.text "talla", default: [], array: true
    t.integer "genero"
    t.integer "offer", default: 0
    t.integer "product_type", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "admin"
    t.string "name"
    t.integer "talla_pie"
    t.string "talla_camiseta"
    t.integer "talla_pantalon"
    t.string "talla_chandal"
    t.string "direccion", default: "0", null: false
    t.string "ciudad", default: "0", null: false
    t.string "phone", default: "0", null: false
    t.string "pais", default: "0", null: false
  end

end
