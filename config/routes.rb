Rails.application.routes.draw do
<<<<<<< HEAD
  resources :hyvelet_missing_locations

  resources :master_pins

=======

  resources :users
  resources :user_sessions
>>>>>>> 937fcee9bb1ba46e2dd68d0ead8d66f21943bc41
  resources :hyvelets

  get 'login', to: 'user_sessions#new', as: 'login'
  post 'logout', to: 'user_sessions#destroy', as: 'logout'
  
  #Home
  root 'users#index'
  post 'push' => 'home#push'
end
