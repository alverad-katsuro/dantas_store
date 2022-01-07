class ProdutosController < ApplicationController
  def index
    @produtos = Produto.all
  end

  def show
    @produto = Produto.find(params[:format])
    if params[:commit].eql? "1"
      return @imagem = @produto.foto_01
    elsif params[:commit].eql? "2"
      return @imagem = @produto.foto_02
    elsif params[:commit].eql? "3"
      return @imagem = @produto.foto_03
    elsif params[:commit].eql? "4"
      return @imagem = @produto.foto_04
    else
      return @imagem = @produto.foto_00
    end
  end
end
