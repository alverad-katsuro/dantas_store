class ItemVendido < ApplicationRecord
  belongs_to :venda
  belongs_to :produto


  rails_admin do
    object_label_method :to_s
    edit do
      configure :venda do
        hide
      end
    end
  end

  validates :produto, presence: true
  validates :quantidade_de_itens, presence: true

  def to_s
    unless produto.nil?
      "#{produto.codigo_produto} #{produto.nome}"
    end
  end
end
