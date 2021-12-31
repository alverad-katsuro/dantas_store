class Perfil < ApplicationRecord
  belongs_to :user

  validates :nome, presence:true
  validates :sobrenome, presence:true
  validates :telefone, presence:true, length: { minimum: 15 }
  validates :sexo, presence:true
  validates :rua, presence:true
  validates :numero, presence:true
  validates :cidade, presence:true
  validates :bairro, presence:true
  validates :estado, presence:true
  validates :complemento, presence:true, length: { maximum: 300 }
end
