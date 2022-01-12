class Funcionario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #
  has_one :perfil, as: :perfil, dependent: :destroy
  accepts_nested_attributes_for :perfil, :allow_destroy => true
  
  enum cargo: { 
    :"Super-Administrador"=> 0, 
    :Administrador => 1,
    :Vendedor => 2,
    :"Agente de Cobranca" => 3
  }

  validates :cargo, presence:true

  rails_admin do
    object_label_method :to_s
    list do
    end
  end

  def to_s
    if perfil
      self.perfil.nome + " " + self.perfil.sobrenome
    end
  end

  validates :perfil, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :email, presence: true

end
