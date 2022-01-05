class Venda < ApplicationRecord
  belongs_to :funcionario
  belongs_to :produto
  belongs_to :perfil
  
  rails_admin do
    visible true
    list do
      field :perfil do
        label "Perfil"
        pretty_value do
          perfil = bindings[:object].perfil
          link = bindings[:view]
          team = bindings[:object]
          link.link_to(perfil.name + " " + perfil.sobrenome, link.show_path(model_name: 'Perfil', id: bindings[:object].perfil))
        end
      end
    end
    edit do

    end
  end

  validates :parcelas, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 13}

  def valida_tamanho(x)
    if (self.parcelas > 0 && self.parcelas < 13)
      true
    else
      false
    end
  end
end
