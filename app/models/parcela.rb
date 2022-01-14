class Parcela < ApplicationRecord
  belongs_to :venda
  before_validation :pagou_mais?
  before_update :valor_diferente_da_parcela?
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

  def pagou_mais?
    if self.pago
      debito = 0
      venda = self.venda
      for k in (self.parcela_atual - 1)...(venda.parcela.size)
        debito += venda.parcela[k].valor_da_parcela
      end
      if self.valor_pago > debito
        errors.add(:valor_pago, "Valor pago superior ao debito!")
      end
    end
  end

  def valor_diferente_da_parcela?
    if self.valor_pago != self.valor_da_parcela && self.pago
      venda = self.venda
      contador = (self.valor_pago  / self.valor_da_parcela).to_i
      if contador == 0
        diferenca = (self.valor_da_parcela - self.valor_pago)
        if venda.parcela[self.parcela_atual].nil?
          venda.parcela.append(Parcela.create(venda_id: venda.id, parcela_atual: self.parcela_atual, data_vencimento: self.data_vencimento.next_month, pago: false, valor_da_parcela: diferenca))
          self.valor_da_parcela = self.valor_pago
        else
          venda.parcela[self.parcela_atual].valor_da_parcela += diferenca
          self.valor_da_parcela = self.valor_pago
        end
      else
        diferenca_no_valor_da_parcela = self.valor_pago
        (contador + 1).times do |parcela|
          puts "entroooooooooooooo contador #{parcela}"
          if venda.parcela[self.parcela_atual + parcela - 1].valor_da_parcela == diferenca_no_valor_da_parcela
            venda.parcela[self.parcela_atual + parcela - 1].valor_pago = self.valor_da_parcela
            venda.parcela[self.parcela_atual + parcela - 1].pago = true
            diferenca_no_valor_da_parcela = 0
            self.valor_pago = self.valor_da_parcela
            break
          elsif venda.parcela[self.parcela_atual + parcela - 1].valor_da_parcela > diferenca_no_valor_da_parcela
            venda.parcela[self.parcela_atual + parcela - 1].valor_da_parcela -= diferenca_no_valor_da_parcela
            diferenca_no_valor_da_parcela = 0
            self.valor_pago = self.valor_da_parcela
            break
          else
            venda.parcela[self.parcela_atual + parcela - 1].valor_pago = self.valor_da_parcela
            venda.parcela[self.parcela_atual + parcela - 1].pago = true
            diferenca_no_valor_da_parcela -= self.valor_da_parcela
          end
        end
      end
      venda.save!
    end
  end
end
