class Parcela < ApplicationRecord
  belongs_to :venda

  rails_admin do
    visible true
    edit do
      configure :venda do
        hide
      end
    end
  end

  validates :parcelas, presence: true

  def configura_campos
    
  end
end
