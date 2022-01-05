class Categoria < ApplicationRecord
  rails_admin do
    object_label_method :to_s
    list do
    end
  end

  def to_s
    "#{self.categoria.capitalize}"
  end
end
