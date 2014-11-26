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

ActiveRecord::Schema.define(version: 20141205212936) do

  create_table "customers", force: true do |t|
    t.string   "email_address"
    t.string   "phone_number"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "published",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nome"
    t.string   "sobrenome"
  end

  create_table "fornecedors", force: true do |t|
    t.string   "empresa"
    t.string   "endereco"
    t.string   "cidade"
    t.string   "estado"
    t.string   "cep"
    t.string   "telefone"
    t.string   "fax"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "funcionarios", force: true do |t|
    t.string   "nome"
    t.string   "data_nascimento"
    t.string   "endereco"
    t.string   "cidade"
    t.string   "estado"
    t.string   "cep"
    t.string   "telefone"
    t.string   "admissao"
    t.string   "cargo"
    t.string   "cpf"
    t.string   "identidade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "homes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "sku"
    t.string   "name"
    t.text     "description"
    t.decimal  "price",            precision: 8, scale: 2
    t.integer  "stock_amount"
    t.integer  "amount_sold",                              default: 0
    t.decimal  "cost_price",       precision: 8, scale: 2
    t.boolean  "published",                                default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_category_id"
    t.integer  "fornecedor_id"
  end

  add_index "items", ["fornecedor_id"], name: "index_items_on_fornecedor_id", using: :btree

  create_table "line_items", force: true do |t|
    t.integer  "item_id"
    t.integer  "quantity",                            default: 1
    t.decimal  "price",       precision: 8, scale: 2
    t.decimal  "total_price", precision: 8, scale: 2
    t.integer  "sale_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.integer  "sale_id"
    t.decimal  "amount",       precision: 8, scale: 2
    t.string   "payment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pedidos", force: true do |t|
    t.integer  "fornecedor_id"
    t.string   "data"
    t.string   "pedido"
    t.text     "observacoes"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pedidos", ["fornecedor_id"], name: "index_pedidos_on_fornecedor_id", using: :btree

  create_table "sales", force: true do |t|
    t.decimal  "amount",           precision: 8,  scale: 2
    t.decimal  "total_amount",     precision: 8,  scale: 2
    t.decimal  "remaining_amount", precision: 10, scale: 0
    t.decimal  "discount",         precision: 8,  scale: 2
    t.decimal  "tax",              precision: 8,  scale: 2
    t.integer  "customer_id"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "funcionario_id"
  end

  add_index "sales", ["funcionario_id"], name: "index_sales_on_funcionario_id", using: :btree

  create_table "store_configurations", force: true do |t|
    t.string   "store_name"
    t.text     "store_description"
    t.string   "email_address"
    t.string   "phone_number"
    t.string   "website_url"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "currency"
    t.decimal  "tax_rate",          precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transportadoras", force: true do |t|
    t.string   "nome"
    t.string   "endereco"
    t.string   "cidade"
    t.string   "estado"
    t.string   "telefone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cep"
  end

  create_table "usuarios", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

end
