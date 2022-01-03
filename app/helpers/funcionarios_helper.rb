module FuncionariosHelper
  def current_auth_resource
    if funcionario_signed_in?
      current_funcionario
    end
  end

  def current_ability
      @current_ability or @current_ability = Ability.new(current_auth_resource)
  end
end
