Rails.application.routes.draw do
  root to: 'application#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  
  resources :users, only: [:new, :create]

  resources :lists, only: [:index]
end
