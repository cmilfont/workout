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

ActiveRecord::Schema.define(:version => 20121211001902) do

  create_table "exercicios", :force => true do |t|
    t.string   "titulo"
    t.text     "descricao"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "itens", :force => true do |t|
    t.integer  "rotina_id"
    t.integer  "exercicio_id"
    t.integer  "repeticao"
    t.string   "tempo"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "itens", ["exercicio_id"], :name => "index_itens_on_exercicio_id"
  add_index "itens", ["rotina_id"], :name => "index_itens_on_rotina_id"

  create_table "rotinas", :force => true do |t|
    t.string   "titulo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
