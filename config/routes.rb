Rails.application.routes.draw do

  resources :hyvelet_missing_locations

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
  end
  
  namespace :admin do
    resources :users, only: [:index]
  end

  resources :users, except: [:index, :edit, :update, :destroy] do 
    get :activate, on: :member
  end

  resources :password_resets
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :hyvelets

  get 'login', to: 'user_sessions#new', as: 'login'
  post 'logout', to: 'user_sessions#destroy', as: 'logout'
  
  #Mailchimp subscription
  post :subscribe, to: 'mailings#sub'
  post :unsubscribe, to: 'mailings#unsub'

  #Home
  root 'pages#home'
  post 'push' => 'home#push'

  #Static Pages
  get '/company', to: 'pages#company', as: 'company'
  get '/press', to: 'pages#press', as: 'press'
  get '/product', to: 'pages#product', as: 'product'
  get '/order', to: 'pages#order', as: 'order'

  #API for Mobile App
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show]
      resources :hyvelets, except: [:create, :new]
      resources :user_sessions, only: [:create, :destroy]
    end
  end

end
