class Venda < ApplicationRecord
  belongs_to :funcionario
  belongs_to :produto
  belongs_to :perfil
  has_one :parcela
  before_validation :estoque?
  after_create :reduz_stock?

  rails_admin do
    visible true
    list do
      configure :perfil do
        show
      end
      include_fields :created_at
      field :created_at do
        label "Dia da venda"
      end
    end
    edit do
      configure :total do
        hide
      end
    end
  end

  validates :parcela, presence: true
  validates :quantidade, presence: true
  validates :data_pagamento, presence: true

  def estoque?
    unless produto.quantidade > quantidade
      errors.add(:estoque, "Sem estoque")
      return false
    else
      return true
    end
  end
  
  def reduz_stock?
    puts("reduz")
    produto.quantidade -= quantidade
    produto.save!
  end

  def valida_tamanho(x)
    if (parcelas > 0 && parcelas < 13)
      true
    else
      errors.add(:parcelas, "Parcelas fora do intervalo")
    end
  end
end
