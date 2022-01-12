class Venda < ApplicationRecord
  before_validation :estoque?, :valida_quantidade_de_parcelas#, :valida_data
  before_create :define_total
  after_create :reduz_stock?, :cria_parcelas!
  belongs_to :funcionario
  belongs_to :perfil
  after_initialize :set_date
  
  has_many :parcela, dependent: :destroy
  accepts_nested_attributes_for :parcela, :allow_destroy => true

  has_many :item_vendido, dependent: :destroy
  accepts_nested_attributes_for :item_vendido, :allow_destroy => true

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
      configure :funcionario do
        default_value do
          bindings[:view]._current_user.id
        end
      end
      configure :data_pagamento do
        default_value do
          bindings[:view]._date_time
        end
      end
      configure :parcela do
        hide
      end
      configure :item_vendido do
        show
      end
    end
  end

  enum desconto: { 
  :"Sem Desconto"=> 0, 
  :"10%"=> 1, 
  :"20%" => 2,
  :"30%" => 3 
  }

  enum quantidade_de_parcelas: {
    :Avista => 0,
    :Uma => 1,
    :Duas => 2,
    :Tres => 3,
    :Quatro => 4,
    :Cinco => 5,
    :Seis => 6,
    :Sete => 7,
    :Oito => 8
  }


  validates :data_pagamento, presence: true
  validates :desconto, presence: true
  validates :quantidade_de_parcelas, presence: true
  validates :item_vendido, presence: true

  def estoque?
    self.item_vendido.each do |item|
      unless item.produto.quantidade > item.quantidade_de_itens
        errors.add(:estoque, "Sem estoque de #{item.produto}")
      end
    end
  end
  
  def reduz_stock?
    self.item_vendido.each do |item|
      item.produto.quantidade -= item.quantidade_de_itens
      item.produto.save!
    end
  end

  def cria_parcelas!
    unless self.quantidade_de_parcelas.eql? "Avista"
      parcelas = []
      valor = self.total / (Venda.quantidade_de_parcelas[self.quantidade_de_parcelas])
      Venda.quantidade_de_parcelas[self.quantidade_de_parcelas].times do |parcela|
        parcelas.append(Parcela.create(venda_id: self.id, parcela_atual: (parcela + 1), data_vencimento: self.data_pagamento.change(month: parcela + 1), pago: false, valor: valor))
      end
      self.parcela = parcelas
      self.save!
    end
  end

  def valida_quantidade_de_parcelas
    if (Venda.quantidade_de_parcelas[self.quantidade_de_parcelas] < 9 && Venda.quantidade_de_parcelas[self.quantidade_de_parcelas] >= 0)
      true
    else
      errors.add(:parcelas, "Parcelas fora do intervalo")
    end
  end

  def define_total
    total = 0
    self.item_vendido.each do |item|
      total += item.quantidade_de_itens * item.produto.preco_de_venda - (item.produto.preco_de_venda * desconto.to_i / 100 * item.quantidade_de_itens)
    end
    self.total = total
  end

  def valida_data
    unless self.data_pagamento > DateTime.now - 1
      errors.add(:data_pagamento, "Data anterior ao dia Atual")
      return false
    else
      return true
    end
  end

  def set_date
    self.data_pagamento = DateTime.now
  end
end
