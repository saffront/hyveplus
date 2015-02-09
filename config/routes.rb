Rails.application.routes.draw do

  resources :users
  resources :user_sessions

  get 'login', to: 'user_sessions#new', as: 'login'
  post 'logout', to: 'user_sessions#destroy', as: 'logout'

  #Home
  root 'users#index'
  post 'push' => 'home#push'
end
