class CreateCategoria < ActiveRecord::Migration[7.0]
  def change
    create_table :categoria do |t|
      t.string :categoria
      t.text :descricao

      t.timestamps
    end
    add_index :categoria, :categoria, unique: true
  end
end
