class DepartamentoController < ApplicationController
  def show
    @produto = Produto.find(params[:format])
  end
end
