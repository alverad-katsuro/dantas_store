Rails.application.routes.draw do
  root 'home#index'
  get "user", to: "users#index" 
  devise_for :users, controllers: {
    registrations: 'user/registrations',
    #sessions: 'user/sessions'
  }
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
  #resources :users
end
