class Funcionario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #
  has_one_attached :avatar
  has_one :perfil, as: :perfil, dependent: :destroy
  enum cargo: { 
    :Administrador=> 0, 
    :Vendedor => 1 
  }
  validates :cargo, presence:true
end
