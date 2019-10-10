Rails.application.routes.draw do
  root to: 'application#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback', to: 'sessions#create'
  
  
  resources :users, only: [:new, :create, :index] do
    resources :assignments, only: [:index]
  end

  resources :lists, only: [:show, :index] do
    resources :tasks, only: [:new, :create, :index, :destroy, :edit, :update]
    get '/completed', to: 'tasks#completed'
  end

  resources :lists

  resources :tasks

  resources :assignments, only: [:index, :show, :new, :create]

  resources :notes, only: [:new, :create]
end
