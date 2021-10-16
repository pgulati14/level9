Rails.application.routes.draw do
<<<<<<< HEAD
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "home#index"
  resources :users
  post "users/login", to: "users#login"
  resources :todos
  #get "users", to: "users#index"
  #post "users/create", to: "users#create"
  #get "users/:id", to: "users#show"
  #post "users/login", to: "users#login"
  #resources :todos
  #resources :users
=======
 get "/" => "home#index"

 resources :todos
 resources :users
>>>>>>> main
end
