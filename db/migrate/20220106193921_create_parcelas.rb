class CreateParcelas < ActiveRecord::Migration[7.0]
  def change
    create_table :parcelas do |t|
      t.belongs_to :venda, null: false, foreign_key: true
      t.integer :parcela_atual, default: 1
      t.boolean :pago, default: false
      t.float :valor
      t.date :data_pagamento
      t.date :data_vencimento

      t.timestamps
    end
  end
end
