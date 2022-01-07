class CreatePerfils < ActiveRecord::Migration[7.0]
  def change
    create_table :perfils do |t|
      t.references :perfil, polymorphic: true, index: true
      t.string :nome
      t.string :sobrenome
      t.string :telefone
      t.integer :sexo
      t.string :rua
      t.string :cpf
      t.integer :numero
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.text :complemento
      t.date :nascimento

      t.timestamps
    end
  end
end
