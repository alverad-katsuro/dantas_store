class CreateCategoria < ActiveRecord::Migration[7.0]
  def change
    create_table :categoria do |t|
      t.string :name

      t.timestamps
    end
    add_index :categoria, :name, unique: true
  end
end
