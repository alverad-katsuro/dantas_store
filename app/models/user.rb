class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  ##

  has_one :perfil, as: :perfil, dependent: :destroy
  accepts_nested_attributes_for :perfil, :allow_destroy => true

  rails_admin do
    visible true
    edit do
      configure :perfil do
        show
      end
    end
  end

  validates :perfil, presence: true

end
