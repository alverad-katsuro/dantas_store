class CreateFuncionarios < ActiveRecord::Migration[7.0]
  def change
    create_table :funcionarios do |t|
      t.integer :cargo
      t.string :banco
      t.string :agencia
      t.string :conta_corrente
      t.string :salario
      t.boolean :ativo, default: true

      t.timestamps
    end
  end
end
