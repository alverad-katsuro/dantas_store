Rails.application.routes.draw do
  get 'departamento/index'
  get 'contato/index'
  get 'sobre/index'
  root 'home#index'
  get "user", to: "users#index" 
  devise_for :users, 
              controllers: {
                registrations: 'user/registrations',
                #sessions: 'user/sessions'
              }, skip: {
                #post "/users/sign_up" => "user/registrations#create", :as => :new_user_registration
              }
  devise_scope :users do
    get "/users/sign_out" => "devise/sessions#destroy"
    post "/users" => "devise/registrations#create"
  end
  #resources :users
end
