Rails.application.routes.draw do
  root to: 'static#index'
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  resources :books
  resources :orders
  resources :subscryptions
  resources :user_data
  resources :addresses
  resources :users
  resources :libraries
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
