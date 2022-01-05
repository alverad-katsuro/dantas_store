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
cama.save!

mesa = Categoria.new
mesa.categoria = "mesa"
mesa.save!

banho = Categoria.new
banho.categoria = "banho"
banho.save!

decoracao = Categoria.new
decoracao.categoria = "decoracao"
decoracao.save!