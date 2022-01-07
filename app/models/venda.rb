class Venda < ApplicationRecord
  before_validation :estoque?
  after_create :reduz_stock?

  belongs_to :funcionario
  belongs_to :produto
  belongs_to :perfil

  has_one :parcela, dependent: :destroy
  accepts_nested_attributes_for :parcela, :allow_destroy => true

  rails_admin do
    visible true
    list do
      configure :perfil do
        show
        label "Comprador"
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
      configure :perfil do
        label "Comprador"
      end
      field :funcionario do
        default_value do
          bindings[:view]._current_user.id
        end
        hide
      end
    end
  end

  #validates :parcela, presence: true
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
