Rails.application.routes.draw do
  root 'home#index'
  get "user", to: "users#index" 
  devise_for :users, controllers: {
    registrations: 'user/registrations',
  }
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
  #resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
