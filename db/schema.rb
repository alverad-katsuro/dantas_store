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

ActiveRecord::Schema.define(version: 2022_01_07_190825) do

  create_table "active_storage_attachments", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: 6, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categoria", charset: "utf8mb4", force: :cascade do |t|
    t.string "categoria"
    t.text "descricao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categoria"], name: "index_categoria_on_categoria", unique: true
  end

  create_table "funcionarios", charset: "utf8mb4", force: :cascade do |t|
    t.integer "cargo"
    t.string "banco"
    t.string "agencia"
    t.string "conta_corrente"
    t.string "salario"
    t.boolean "ativo", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.index ["email"], name: "index_funcionarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_funcionarios_on_reset_password_token", unique: true
  end

  create_table "item_vendidos", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "venda_id", null: false
    t.bigint "produto_id", null: false
    t.integer "quantidade_de_itens", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["produto_id"], name: "index_item_vendidos_on_produto_id"
    t.index ["venda_id"], name: "index_item_vendidos_on_venda_id"
  end

  create_table "parcelas", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "venda_id", null: false
    t.integer "parcela_atual", default: 1
    t.boolean "pago", default: false
    t.float "valor"
    t.date "data_pagamento"
    t.date "data_vencimento"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["venda_id"], name: "index_parcelas_on_venda_id"
  end

  create_table "perfils", charset: "utf8mb4", force: :cascade do |t|
    t.string "perfil_type"
    t.bigint "perfil_id"
    t.string "nome"
    t.string "sobrenome"
    t.string "telefone"
    t.integer "sexo"
    t.string "rua"
    t.string "cpf"
    t.integer "numero"
    t.string "bairro"
    t.string "cidade"
    t.string "estado"
    t.text "complemento"
    t.date "nascimento"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["perfil_type", "perfil_id"], name: "index_perfils_on_perfil"
  end

  create_table "produtos", charset: "utf8mb4", force: :cascade do |t|
    t.integer "codigo_produto"
    t.string "nome"
    t.text "descricao"
    t.integer "quantidade", default: 0
    t.float "preco_de_venda", default: 0.0
    t.float "preco_de_compra", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["codigo_produto"], name: "index_produtos_on_codigo_produto", unique: true
  end

  create_table "tags", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "produto_id", null: false
    t.bigint "categoria_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categoria_id"], name: "index_tags_on_categoria_id"
    t.index ["produto_id"], name: "index_tags_on_produto_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendas", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "funcionario_id", null: false
    t.bigint "perfil_id", null: false
    t.datetime "data_pagamento", precision: 6
    t.integer "desconto", default: 0
    t.integer "quantidade_de_parcelas", default: 0
    t.integer "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["funcionario_id"], name: "index_vendas_on_funcionario_id"
    t.index ["perfil_id"], name: "index_vendas_on_perfil_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "item_vendidos", "produtos"
  add_foreign_key "item_vendidos", "vendas"
  add_foreign_key "parcelas", "vendas"
  add_foreign_key "tags", "categoria", column: "categoria_id"
  add_foreign_key "tags", "produtos"
  add_foreign_key "vendas", "funcionarios"
  add_foreign_key "vendas", "perfils"
end
