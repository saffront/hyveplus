Rails.application.routes.draw do

  resources :hyve_missing_locations

  resources :master_pins

  #Omniauth
  post 'oauth/callback', to: 'oauth#callback'
  get 'oauth/callback', to: 'oauth#callback' #for use with Facebook
  get 'oauth/:provider', to: 'oauth#oauth', as: :auth_at_provider

  namespace :my do
    resource :account, only: [:show, :destroy] do
      get :edit_profile
      patch :update_profile, to: 'accounts#update_profile'
      get :edit_password
      patch :update_password, to: 'accounts#update_password'
    end
    resources :hyves, only: [:show, :edit, :update, :destroy]
  end
  
  namespace :admin do
    resources :users, only: [:index]
    resources :hyves, only: [:index]
  end

  resources :users, only: [:create, :new] 

  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :user_sessions, only: [:create]

  get 'login', to: 'user_sessions#new', as: 'login'
  post 'logout', to: 'user_sessions#destroy', as: 'logout'

  # ==============================================================================================
  # Mailchimp Subscription
  # ==============================================================================================
  post :subscribe, to: 'mailings#sub'
  post :unsubscribe, to: 'mailings#unsub'

  # ==============================================================================================
  # Static Pages
  # ==============================================================================================
  root 'pages#home'
  get '/company', to: 'pages#company', as: 'company'
  get '/press', to: 'pages#press', as: 'press'
  get '/product', to: 'pages#product', as: 'product'
  get '/order', to: 'pages#order', as: 'order'

  #Parse push notification
  #post 'push' => 'pages#push'

  # ==============================================================================================
  # API for iOS mobile
  # ==============================================================================================
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show]
      resources :hyves
      resources :user_sessions, only: [:create, :destroy]
    end
  end

end
