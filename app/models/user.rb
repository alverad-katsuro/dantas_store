class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  ##

  has_one :perfil, dependent: :destroy
  accepts_nested_attributes_for :perfil
end
