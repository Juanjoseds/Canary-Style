# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'welcome#index', as: 'main'

  get '/products', to: 'products#index'
  get '/products/new', to: 'products#new'
  post '/products', to: 'products#create'
  get '/product/:id', to: 'products#show', as: 'product'
  get '/products/:id/edit', to: 'products#edit', as: 'edit_product'
  patch '/product/:id', to: 'products#update'
  put '/product/:id', to: 'products#update'
  delete '/product/:id', to: 'products#delete'

  get '/users', to: 'users#index' # users_path
  get '/users/new', to: 'users#new' # users_new_path
  post '/:username', to: 'users#login', as: 'login'
  get '/users/login/:username', to: 'users#login'
  get '/users/logout', to: 'users#logout', as: 'logout'

  get '/products/novedades', to: 'products#novedades', as: 'novedades'
  get '/products/hombre', to: 'products#hombre', as: 'hombre'


  # resources :products
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
