class Categoria < ApplicationRecord
  has_one_attached :foto_apresentacao

  rails_admin do
    object_label_method :to_s
    list do
    end
  end

  def to_s
    if categoria
      "#{self.categoria.capitalize}"
    end
  end

  validates :categoria, presence: true
  validates :descricao, presence: true
  validates :foto_apresentacao, presence: true
end
