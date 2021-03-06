Rails.application.routes.draw do
  get    '/signup',   to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  root to: 'events#index'
  resources :users, only:[:new, :create, :show]
  resources :events, only:[:new, :create, :show, :index]
  resources :attendings, only: :create
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
