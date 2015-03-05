Rails.application.routes.draw do
  resources :hyvelet_missing_locations

  resources :master_pins

  #Omniauth
  post 'oauth/callback', to: 'oauth#callback'
  get 'oauth/callback', to: 'oauth#callback' #for use with Facebook
  get 'oauth/:provider', to: 'oauth#oauth', as: :auth_at_provider

  namespace :my do
    resource :account, only: [:show, :destroy] do
      post :subscribe, to: 'mailings#sub'
      post :unsubscribe, to: 'mailings#unsub'
      get :edit_profile
      patch :update_profile, to: 'accounts#update_profile'
      get :edit_password
      patch :update_password, to: 'accounts#update_password'
    end
  end

  resources :users, except: [:edit, :update, :destroy] do 
    get :activate, on: :member
  end

  resources :password_resets
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :hyvelets

  get 'login', to: 'user_sessions#new', as: 'login'
  post 'logout', to: 'user_sessions#destroy', as: 'logout'
  
  #Home
  root 'pages#home'
  post 'push' => 'home#push'

end
