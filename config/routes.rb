Rails.application.routes.draw do
  get "/" => "home#index"
  post "todos/create"
  resources :todos
  resources :users
end
