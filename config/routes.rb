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
  delete '/products/:id/delete', to: 'products#delete', as: 'deleteproduct'
  get 'products/:id/delete', to: 'products#delete'

  get '/users', to: 'users#index' # users_path
  get '/users/new', to: 'users#new' # users_new_path
  post '/:username', to: 'users#login', as: 'login'
  get '/users/login/:username', to: 'users#login'
  get '/users/logout', to: 'users#logout', as: 'logout'
  get '/user/cesta', to: 'users#cesta', as: 'cesta'
  post '/users/:id/carritoadd', to: 'users#carritoadd'

  get '/products/novedades', to: 'products#novedades', as: 'novedades'
  get '/products/hombre', to: 'products#hombre', as: 'hombre'
  get '/products/mujer', to: 'products#mujer', as: 'mujer'
  post 'products/:id/talla', to: 'products#talla', as: 'savetalla'
  get 'products/:id/talla/:talla', to: 'products#talla'
  get 'users/deletecarrito/:index', to: 'users#deletecarrito'
  get '/user', to: 'users#show', as: 'userview'
  get 'products/buy', to: 'products#buy'
  post 'products/buy', to: 'products#buy'
  get '/users/option1', to: 'users#option1'
  get '/users/option2', to: 'users#option2'
  get '/users/option3', to: 'users#option3'

  get '/user/:id', to: 'users#show'
  post '/user/:id', to: 'users#update', as: 'update'

  get '/products/search', to: 'products#search', as: 'search'
  get '/products/admin/search', to: 'products#searchadmin', as: 'searchadmin'
  get '/products/admin', to: 'products#index', as: 'mainadmin'


  # resources :products
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
