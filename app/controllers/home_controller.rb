class HomeController < ApplicationController
  def index
    @categoria = []
    @inicio = Categoria.all
    @inicio.each_slice(2) do |a, b|
      @categoria.append([a,b])
    end
  end
end
