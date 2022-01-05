class CreateProdutos < ActiveRecord::Migration[7.0]
  def change
    create_table :produtos do |t|
      t.integer :codigo_produto
      t.string :nome
      t.text :descricao
      t.integer :quantidade, default: 0
      t.float :preco, default: 0.0

      t.timestamps
    end
    add_index :produtos, :codigo_produto, unique: true
  end
end
