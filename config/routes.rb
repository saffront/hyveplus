Rails.application.routes.draw do
<<<<<<< HEAD
  resources :hyvelet_missing_locations

  resources :master_pins

=======

  #Omniauth
  post 'oauth/callback', to: 'oauth#callback'
  get 'oauth/callback', to: 'oauth#callback' #for use with Facebook
  get 'oauth/:provider', to: 'oauth#oauth', as: :auth_at_provider

  resources :users do 
    get :activate, on: :member
    post :subscribe, on: :member, to: 'mailings#sub'
    post :unsubscribe, on: :member, to: 'mailings#unsub'
  end
  resources :password_resets
  resources :user_sessions
>>>>>>> 937fcee9bb1ba46e2dd68d0ead8d66f21943bc41
  resources :hyvelets

  get 'login', to: 'user_sessions#new', as: 'login'
  post 'logout', to: 'user_sessions#destroy', as: 'logout'
  
  #Home
  root 'users#index'
  post 'push' => 'home#push'

  #Mailing
  #post 'subscribe', to: 'mailings#sub'
  #post '/users/:id/unsubscribe', to: 'mailings#unsub'
end
