class Parcela < ApplicationRecord
  belongs_to :venda
  after_update :pago?

  rails_admin do
    visible true
    edit do
      configure :venda do
        hide
      end
      configure :parcela_atual do
        hide
      end
      configure :data_vencimento do
        hide
      end
      configure :data_pagamento do
        hide
      end
    end
  end


  def pago?
    if self.data_pagamento.nil? && self.pago == true
      self.data_pagamento = DateTime.now
      self.save!
    end
  end

end
