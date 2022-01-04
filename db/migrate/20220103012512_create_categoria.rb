class CreateCategoria < ActiveRecord::Migration[7.0]
  def change
    create_table :categoria do |t|
      t.references :cama, polymorphic: true, null: false
      t.references :mesa, polymorphic: true, null: false
      t.references :banho, polymorphic: true, null: false
      t.references :cozinha, polymorphic: true, null: false
      t.references :decoracao, polymorphic: true, null: false

      t.timestamps
    end
  end
end
