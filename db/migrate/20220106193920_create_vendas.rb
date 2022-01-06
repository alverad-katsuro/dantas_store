class CreateVendas < ActiveRecord::Migration[7.0]
  def change
    create_table :vendas do |t|
      t.belongs_to :funcionario, null: false, foreign_key: true
      t.belongs_to :produto, null: false, foreign_key: true
      t.belongs_to :perfil, null: false, foreign_key: true
      t.date :data_pagamento
      t.integer :quantidade
      t.integer :desconto
      t.integer :total

      t.timestamps
    end
  end
end
