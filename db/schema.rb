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

ActiveRecord::Schema.define(:version => 20130405205936) do

  create_table "cards", :force => true do |t|
    t.integer  "deck_id"
    t.string   "name"
    t.string   "subtitle"
    t.string   "stat_names"
    t.string   "stat_values"
    t.string   "image_prefix"
    t.string   "interesting_facts"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "cards", ["deck_id"], :name => "index_cards_on_deck_id"

  create_table "decks", :force => true do |t|
    t.integer  "player_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "decks", ["player_id"], :name => "index_decks_on_player_id"

  create_table "games", :force => true do |t|
    t.integer  "stat_type"
    t.integer  "whos_turn"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "players", :force => true do |t|
    t.integer  "game_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "players", ["game_id"], :name => "index_players_on_game_id"

end
