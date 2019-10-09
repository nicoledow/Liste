Rails.application.routes.draw do
  root to: 'application#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback', to: 'sessions#facebook_create'
  
  resources :users, only: [:new, :create]

  resources :lists, only: [:show, :index] do
    resources :tasks, only: [:new, :create, :index]
  end

  resources :lists

  resources :tasks, only: [:index, :new, :create, :show]

  resources :assignments, only: [:index, :show, :new, :create]

  resources :notes, only: [:new, :create]
end
