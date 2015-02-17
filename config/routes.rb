Rails.application.routes.draw do
  resources :hyvelet_missing_locations

  resources :master_pins

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
  resources :hyvelets

  get 'users/:id/edit_password', to: 'users#edit_password', as: 'edit_password'
  get 'login', to: 'user_sessions#new', as: 'login'
  post 'logout', to: 'user_sessions#destroy', as: 'logout'
  
  #Home
  root 'pages#home'
  post 'push' => 'home#push'

end
