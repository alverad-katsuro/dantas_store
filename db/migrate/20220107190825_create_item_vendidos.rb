class CreateItemVendidos < ActiveRecord::Migration[7.0]
  def change
    create_table :item_vendidos do |t|
      t.belongs_to :venda, null: false, foreign_key: true
      t.belongs_to :produto, null: false, foreign_key: true
      t.integer :quantidade_de_itens, default: 1

      t.timestamps
    end
  end
end
