class CreateParcelas < ActiveRecord::Migration[7.0]
  def change
    create_table :parcelas do |t|
      t.belongs_to :venda, null: false, foreign_key: true
      t.integer :parcelas, default: 1
      t.boolean :primeira, default: false
      t.boolean :segunda, default: false
      t.boolean :terceira, default: false
      t.boolean :quarta, default: false
      t.boolean :quinta, default: false
      t.boolean :sexta, default: false
      t.boolean :setima, default: false
      t.boolean :oitava, default: false
      t.boolean :nona, default: false
      t.boolean :decima, default: false
      t.boolean :decima_primeira, default: false
      t.boolean :decima_segunda, default: false

      t.timestamps
    end
  end
end
