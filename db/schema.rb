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

ActiveRecord::Schema[7.1].define(version: 2023_10_06_194159) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "card_sets", force: :cascade do |t|
    t.uuid "scryfall_id"
    t.string "code"
    t.string "name"
    t.date "released_on"
    t.string "set_type"
    t.integer "card_count"
    t.string "icon_svg_uri"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scryfall_id"], name: "index_card_sets_on_scryfall_id", unique: true
  end

  create_table "cards", force: :cascade do |t|
    t.uuid "scryfall_id"
    t.uuid "scryfall_set_id"
    t.string "name"
    t.integer "collector_number"
    t.string "rarity"
    t.string "scryfall_normal_image_uri"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "scryfall_small_image_uri"
    t.string "scryfall_large_image_uri"
    t.string "mana_cost"
    t.integer "converted_mana_cost"
    t.string "type_line"
    t.index ["scryfall_id"], name: "index_cards_on_scryfall_id", unique: true
    t.index ["scryfall_set_id"], name: "index_cards_on_scryfall_set_id"
  end

end
