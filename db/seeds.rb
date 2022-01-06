# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

perfil = Perfil.new
perfil.nome = "ADMIN"
perfil.sobrenome = "ADMIN"
perfil.telefone = "(00) 00000-0000"
perfil.sexo = 0
perfil.rua = "admin"
perfil.cpf = "000.000.000-00"
perfil.numero = "admin"
perfil.cidade = "admin"
perfil.bairro = "admin"
perfil.estado = "ad"
perfil.complemento = "admin"

funcionarios = Funcionario.new
funcionarios.email = 'admin@admin'
funcionarios.password = "adminadmin"
funcionarios.password_confirmation = "adminadmin"
funcionarios.perfil = perfil
funcionarios.ativo = "true"
funcionarios.cargo = 0
funcionarios.save!

cama = Categoria.new
cama.categoria = "cama"
cama.descricao = "Roupa de cama e afins"
cama.foto_apresentacao.attach(io: File.open(Rails.root.join('app/assets/images/cama.jpg')), filename: 'cama.jpg')
cama.save!



mesa = Categoria.new
mesa.categoria = "mesa"
mesa.foto_apresentacao.attach(io: File.open(Rails.root.join('app/assets/images/mesa.jpg')), filename: 'mesa.jpg')
mesa.descricao = "Toalha de mesa e afins"
mesa.save!

banho = Categoria.new
banho.categoria = "banho"
banho.foto_apresentacao.attach(io: File.open(Rails.root.join('app/assets/images/banho.jpg')), filename: 'banho.jpg')
banho.descricao = "Toalhas e afins"
banho.save!

decoracao = Categoria.new
decoracao.categoria = "decoracao"
decoracao.foto_apresentacao.attach(io: File.open(Rails.root.join('app/assets/images/decoracao.jpg')), filename: 'decoracao.jpg')
decoracao.descricao = "Decoração em geral"
decoracao.save!

for k in 1..200
  prod = Produto.new
  prod.codigo_produto = k
  prod.nome = "Nome legal #{k}"
  prod.descricao = "Descricao legal #{k} Descricao legal #{k} Descricao legal #{k}"
  prod.quantidade = k * +10
  prod.preco_de_compra = k + 5 
  prod.preco_de_venda = prod.preco_de_compra * 1.3
  if k < 50
    Tag.create(:produto_id => k, :categoria_id => cama.id)
    prod.categoria.append(cama)
    prod.foto_00.attach(io: File.open(Rails.root.join('app/assets/images/cama.jpg')), filename: 'cama.jpg')
  elsif k < 100 && k >= 50
    Tag.create(:produto_id => k, :categoria_id => cama.id)
    prod.categoria.append(banho)
    prod.foto_00.attach(io: File.open(Rails.root.join('app/assets/images/banho.jpg')), filename: 'banho.jpg')
  elsif k < 150 && k >= 100
    Tag.create(:produto_id => k, :categoria_id => cama.id)
    prod.categoria.append(mesa)
    prod.foto_00.attach(io: File.open(Rails.root.join('app/assets/images/mesa.jpg')), filename: 'mesa.jpg')
  else
    Tag.create(:produto_id => k, :categoria_id => cama.id)
    prod.categoria.append(decoracao)
    prod.foto_00.attach(io: File.open(Rails.root.join('app/assets/images/decoracao.jpg')), filename: 'decoracao.jpg')
  end
  prod.save!
end