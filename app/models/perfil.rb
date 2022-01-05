class Perfil < ApplicationRecord
  belongs_to :perfil, polymorphic: true
  
  has_one_attached :avatar

  validates :name, presence:true
  validates :sobrenome, presence:true
  validates :telefone, presence:true, length: { minimum: 11, maximim: 15 }
  validates :sexo, presence:false
  validates :rua, presence:true
  validates :numero, presence:true
  validates :cidade, presence:true
  validates :bairro, presence:true
  validates :estado, presence:true
  validates :complemento, presence:true, length: { maximum: 300 }
  enum sexo: { 
    :"Masculino"=> 0, 
    :"Feminino" => 1,
    :"Prefiro Não Informar" => 2
  }

  rails_admin do
    visible false
    show do
      perfil_format
    end
  end
end
