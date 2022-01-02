class CreateFuncionarios < ActiveRecord::Migration[7.0]
  def change
    create_table :funcionarios do |t|
      t.boolean :admin, defaults: "false"
      t.integer :cargo
      t.string :banco
      t.string :agencia
      t.string :conta_corrente
      t.string :salario_vendas
      t.boolean :ativo

      t.timestamps
    end
  end
end
