class Categoria < ApplicationRecord
  belongs_to :cama, polymorphic: true
  belongs_to :mesa, polymorphic: true
  belongs_to :banho, polymorphic: true
  belongs_to :cozinha, polymorphic: true
  belongs_to :decoracao, polymorphic: true
end
