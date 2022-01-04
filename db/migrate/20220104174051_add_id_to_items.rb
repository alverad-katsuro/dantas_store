class AddIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :codigo_produto, :integer
    add_index :items, :codigo_produto, unique: true
  end
end
