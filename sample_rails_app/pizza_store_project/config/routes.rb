Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users

  get "pizza/new", to: "pizza#new"
  post "pizza/create", to: "pizza#create"
end
