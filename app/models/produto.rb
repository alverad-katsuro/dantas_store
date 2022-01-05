class Produto < ApplicationRecord
  has_one_attached :foto_00
  has_one_attached :foto_01
  has_one_attached :foto_02
  has_one_attached :foto_03
  has_one_attached :foto_04
  has_many :tag
  has_many :categoria, through: :tag

  validates :nome, presence: true
  validates :descricao, presence: true
  validates :codigo_produto, presence: true
  validates :foto_00, presence: true
  validates :categoria, presence: true

  rails_admin do
    list do
      exclude_fields  :foto_00, :foto_01, :foto_02, :foto_03, :foto_04
    end
  end
end
