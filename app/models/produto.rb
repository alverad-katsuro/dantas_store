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
      configure :foto_00 do
        pretty_value do
          if value
            path = Rails.application.routes.url_helpers.rails_blob_path(value, only_path: true)
            bindings[:view].content_tag(:img, "", style: "width: 400px", src: path)
          end
        end
      end
      configure :foto_01 do
        pretty_value do
          if value
            path = Rails.application.routes.url_helpers.rails_blob_path(value, only_path: true)
            bindings[:view].content_tag(:img, "", style: "width: 400px", src: path)
          end
        end
      end
      configure :foto_02 do
        pretty_value do
          if value
            path = Rails.application.routes.url_helpers.rails_blob_path(value, only_path: true)
            bindings[:view].content_tag(:img, "", style: "width: 400px", src: path)
          end
        end
      end
      configure :foto_03 do
        pretty_value do
          if value
            path = Rails.application.routes.url_helpers.rails_blob_path(value, only_path: true)
            bindings[:view].content_tag(:img, "", style: "width: 400px", src: path)
          end
        end
      end
      configure :foto_04 do
        pretty_value do
          if value
            path = Rails.application.routes.url_helpers.rails_blob_path(value, only_path: true)
            bindings[:view].content_tag(:img, "", style: "width: 400px", src: path)
          end
        end
      end
    end
    show do
      configure :foto_00 do
        pretty_value do
          if value
            path = Rails.application.routes.url_helpers.rails_blob_path(value, only_path: true)
            bindings[:view].content_tag(:img, "", style: "width: 400px", src: path)
          end
        end
      end
      configure :foto_01 do
        pretty_value do
          if value
            path = Rails.application.routes.url_helpers.rails_blob_path(value, only_path: true)
            bindings[:view].content_tag(:img, "", style: "width: 400px", src: path)
          end
        end
      end
      configure :foto_02 do
        pretty_value do
          if value
            path = Rails.application.routes.url_helpers.rails_blob_path(value, only_path: true)
            bindings[:view].content_tag(:img, "", style: "width: 400px", src: path)
          end
        end
      end
      configure :foto_03 do
        pretty_value do
          if value
            path = Rails.application.routes.url_helpers.rails_blob_path(value, only_path: true)
            bindings[:view].content_tag(:img, "", style: "width: 400px", src: path)
          end
        end
      end
      configure :foto_04 do
        pretty_value do
          if value
            path = Rails.application.routes.url_helpers.rails_blob_path(value, only_path: true)
            bindings[:view].content_tag(:img, "", style: "width: 400px", src: path)
          end
        end
      end
    end
  end

  def to_s
    "#{self.codigo_produto} - #{self.nome}"
  end

  def next_image
    
  end

end
