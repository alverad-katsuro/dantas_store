class HomeController < ApplicationController
  def index
    @categoria = []
    @tags = []
    Categoria.all.each_slice(2) do |a, b|
      @categoria.append([a, b])
      @tags.append(Tag.find_by_sql("select * from tags where categoria_id=#{a.id} order by rand() limit 4"), Tag.find_by_sql("select * from tags where categoria_id=#{b.id} order by rand() limit 4"))
    end
  end
end
