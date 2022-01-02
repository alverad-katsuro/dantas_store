class CreatePerfils < ActiveRecord::Migration[7.0]
  def change
    create_table :perfils do |t|
      t.references :user, null: false, foreign_key: true
      t.string :nome
      t.string :sobrenome
      t.string :telefone
      t.string :sexo
      t.string :rua
      t.integer :numero
      t.string :cidade
      t.string :bairro
      t.string :estado
      t.text :complemento
      t.date :nascimento

      t.timestamps
    end
  end
end
