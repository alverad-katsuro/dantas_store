class CreateFuncionarios < ActiveRecord::Migration[7.0]
  def change
    create_table :funcionarios do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :cargo
      t.string :banco
      t.string :agencia
      t.string :conta_corrente
      t.string :cpf
      t.float :salario
      t.integer :vendas
      t.boolean :ativo

      t.timestamps
    end
  end
end
