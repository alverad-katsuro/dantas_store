class Perfil < ApplicationRecord
  belongs_to :perfil, polymorphic: true, optional: true
  
  has_one_attached :avatar

  validates :nome, presence:true
  validates :sobrenome, presence:true
  validates :telefone, presence:true, length: { minimum: 11, maximim: 15 }
  validates :sexo, presence:false
  validates :rua, presence:true
  validates :cpf, presence:true
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
    object_label_method :to_s
    list do
      configure :perfil do
        label "Conta Associada"
      end
    end
    show do
      configure :perfil do
        label "Conta Associada"
      end
    end
  end

  def to_s
    "#{self.nome} #{self.sobrenome} CPF: #{get_cpf}"
  end

  def get_cpf
    if self.cpf?
      return self.cpf
    else
      return "S/CPF"
    end
  end
end
