class CategoriaController < ApplicationController
  def show
    @categoria = Categoria.find_by(categoria: params[:categoria])
    @tags = Tag.find_by_sql("select * from tags where categoria_id=#{@categoria.id};")
  end
end
