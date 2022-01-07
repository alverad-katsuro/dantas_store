Rails.application.routes.draw do
  get 'categoria/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
  get "user", to: "users#index" 
  get "funcionario", to: "funcionarios#index" 
  get "departamento", to: "departamento#index" 
  #get "produtos", to: "produtos#index"
  get "produto", to: "produtos#show"
  get "categoria/:categoria", to: "categoria#show"
  get "vendas", to: "vendas#new"
  post "vendas", to: "vendas#create"
  get "perfil", to: "perfil#new"
  post "perfil", to: "perfil#create"
  #get "sobre", to: "sobre#index" 
  #get "contato", to: "contato#index" 

  devise_for :funcionarios, 
              controllers: {
                registrations: 'funcionario/registrations',
                sessions: 'funcionario/sessions'
              }
  devise_for :users, 
              controllers: {
                registrations: 'user/registrations'
              }
end
