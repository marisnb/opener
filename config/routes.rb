Rails.application.routes.draw do
  get 'bookmarks/index'
  root 'sessions#new'
  get 'articles/form'
  post 'registration/signin'
  get    '/signup',  to: 'registration#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :registration,:home,:sessions,:articles

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
