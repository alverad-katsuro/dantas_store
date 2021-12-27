Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, get: {
    "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  }, controllers: {
    registrations: 'user/registrations',
  }
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
