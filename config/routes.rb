Rails.application.routes.draw do
  get 'bookmarks/index'
  root 'sessions#new'
  get 'articles/form'
  post 'registration/signin'
  get    '/signup',  to: 'registration#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  put '/bookmark',  to: 'articles#bookmark'
  #get '/articles',    to: 'articles#index'
  #get '/articles/:id', to: 'articles#show'

  #post   '/bookmarks',   to: 'bookmarks#create'
  resources :registration,:home,:sessions,:articles,:bookmarks, :comment
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
