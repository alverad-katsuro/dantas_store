class Produto < ApplicationRecord
  has_one_attached :foto_00
  has_one_attached :foto_01
  has_one_attached :foto_02
  has_one_attached :foto_03
  has_one_attached :foto_04
  
  has_many :tag
  has_many :categoria, through: :tag

  validates :categoria, presence: true
  validates :descricao, presence: true
  validates :codigo_produto, presence: true
  validates :foto_00, presence: true
  validates :categoria, presence: true
  validates :preco_de_compra, presence: true
  validates :preco_de_venda, presence: true

  rails_admin do
    object_label_method :to_s
    list do
      exclude_fields  :foto_00, :foto_01, :foto_02, :foto_03, :foto_04, :creat_at, :updated_at, :tag
    end
    edit do
      exclude_fields  :tag
    end
  end

  def to_s
    "#{self.codigo_produto} - #{self.nome}"
  end

  def next_image
    
  end

end
