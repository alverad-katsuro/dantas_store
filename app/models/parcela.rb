class Parcela < ApplicationRecord
  belongs_to :venda

  rails_admin do
    object_label_method :to_s
    visible true
  end

  validates :parcelas, presence: true
end
