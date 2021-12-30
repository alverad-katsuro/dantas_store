class Perfil < ApplicationRecord
  belongs_to :user


  #validates :email, presence:true
  #validates :email, presence:true
  validates :nome, presence:true
  validates :sobrenome, presence:true
  validates :telefone, presence:true
  validates :sexo, presence:true
  validates :rua, presence:true
  validates :numero, presence:true
  validates :cidade, presence:true
  validates :bairro, presence:true
  validates :estado, presence:true
  validates :complemento, length: { maximum: 300 }
end
