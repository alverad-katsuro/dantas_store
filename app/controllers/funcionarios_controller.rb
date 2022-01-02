class FuncionariosController < ApplicationController
  before_action :authenticate_funcionario!

  def index
    set_funcionario
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funcionario
      @funcionario = Funcionario.find(current_funcionario.id)
    end

end
