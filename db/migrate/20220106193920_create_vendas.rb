class CreateVendas < ActiveRecord::Migration[7.0]
  def change
    create_table :vendas do |t|
      t.belongs_to :funcionario, null: false, foreign_key: true
      t.belongs_to :perfil, null: false, foreign_key: true
      t.datetime :data_pagamento
      t.integer :desconto, default: 0
      t.integer :quantidade_de_parcelas, default: 0
      t.integer :total

      t.timestamps
    end
  end
end
