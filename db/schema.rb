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

ActiveRecord::Schema.define(version: 2021_12_27_194544) do

  create_table "funcionarios", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "cargo"
    t.string "banco"
    t.string "agencia"
    t.string "conta_corrente"
    t.string "cpf"
    t.float "salario"
    t.integer "vendas"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_funcionarios_on_user_id"
  end

  create_table "perfils", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "nome"
    t.string "sobrenome"
    t.string "telefone"
    t.string "sexo"
    t.string "rua"
    t.integer "numero"
    t.string "cidade"
    t.string "bairro"
    t.string "estado"
    t.text "complemento"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "aniversario"
    t.index ["user_id"], name: "index_perfils_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.boolean "funcionario"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "funcionarios", "users"
  add_foreign_key "perfils", "users"
end
