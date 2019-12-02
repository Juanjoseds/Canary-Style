# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/products', to: 'products#index'
  get '/products/new', to: 'products#new'
  post '/products', to: 'products#create'
  get '/products/:id', to: 'products#show', as: 'product'
  get '/products/:id/edit', to: 'products#edit', as: 'edit_product'
  patch '/products/:id', to: 'products#update'
  delete '/products/:id', to: 'products#delete'

  get '/users', to: 'users#index' # users_path
  get '/users/new', to: 'users#new' # users_new_path
  post '/users', to: 'users#login', as: 'user'

  # resources :products
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
