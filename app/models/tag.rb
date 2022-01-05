class Tag < ApplicationRecord
  belongs_to :produto
  belongs_to :categoria
  rails_admin do
    visible false
  end
end
