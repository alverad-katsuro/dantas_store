class Item < ApplicationRecord
  has_one :cama, as: :cama, dependent: :destroy
  has_one :mesa, as: :mesa, dependent: :destroy
  has_one :banho, as: :banho, dependent: :destroy
  has_one :cozinha, as: :cozinha, dependent: :destroy
  has_one :decoracao, as: :decoracao, dependent: :destroy
end
