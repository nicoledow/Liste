Rails.application.routes.draw do
  root to: 'application#home'
  get '/login', to: 'sessions#new'
  
  resources :users, only: [:new, :create]
end
