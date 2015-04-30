Rails.application.routes.draw do

  # ==============================================================================================
  # Static Pages
  # ==============================================================================================
  root 'pages#home'

  # Header
  get '/company', to: 'pages#company', as: 'company'
  get '/press', to: 'pages#press', as: 'press'
  get '/product', to: 'pages#product', as: 'product'
  get '/kickstarter', to: 'pages#kickstarter', as: 'kickstarter'

  # Footer
  get '/faq', to: 'pages#faq', as: 'faq'
  get '/contact', to: 'pages#contact', as: 'contact'
  get '/tnc', to: 'pages#tnc', as: 'tnc'

  # Soma
  get '/soma', to: 'pages#soma', as: 'soma'

  post :contact_us, to: 'contacts#send_contact_form'
 
  # ==============================================================================================
  # Flywheel (Blog)
  # ==============================================================================================
  get '/blog' => redirect("https://hyveplus.com/blog") 

  # ==============================================================================================
  # Resources
  # ==============================================================================================

  resources :users, only: [:new, :create] 
  resources :password_resets, only: [:new, :create, :edit, :update]

  # ==============================================================================================
  # User Sessions/Login/Logout
  # ==============================================================================================
  resources :user_sessions, only: [:create]
  get 'login', to: 'user_sessions#new', as: 'login'
  post 'logout', to: 'user_sessions#destroy', as: 'logout'

  # ==============================================================================================
  # Mailchimp Subscription
  # ==============================================================================================
  post :subscribe_early_adopters, to: 'mailings#sub_adopters'

  # ==============================================================================================
  # Sorcery/Omniauth
  # ==============================================================================================
  post 'oauth/callback', to: 'oauth#callback'
  get 'oauth/callback', to: 'oauth#callback' #for use with Facebook
  get 'oauth/:provider', to: 'oauth#oauth', as: :auth_at_provider

  # ==============================================================================================
  # MY namespace
  # ==============================================================================================
  namespace :my do
    resources :hyves, only: [:update]
    resource :account, only: [:show] do
      patch :update_profile, on: :member
      patch :update_password, on: :member 
      #patch "update_hyve/:uuid", to: 'accounts#update_hyve', as: :update_hyve 
    end
  end
  
  # ==============================================================================================
  # Admin namespace
  # ==============================================================================================
  namespace :admin do
    resources :users, except: [:new, :create]
    resources :hyves, except: [:new, :create]
  end

  # ==============================================================================================
  # API for iOS mobile
  # ==============================================================================================
  namespace :api do
    namespace :v1 do
      resource :account, only: [:show, :update]
      resources :hyves, except: [:new, :edit]
      resources :user_sessions, only: [:create, :destroy]
      post :register, to: 'user_sessions#register'
    end
  end
end
