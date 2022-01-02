Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
  get "user", to: "users#index" 
  get "funcionario", to: "funcionarios#index" 
  get "departamento", to: "departamento#index" 
  get "sobre", to: "sobre#index" 
  get "contato", to: "contato#index" 
  #resources :users
  
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
