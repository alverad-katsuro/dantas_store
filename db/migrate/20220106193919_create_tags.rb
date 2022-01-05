class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.belongs_to :produto, null: false, foreign_key: true
      t.belongs_to :categoria, null: false, foreign_key: true

      t.timestamps
    end
  end
end
