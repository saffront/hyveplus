Rails.application.routes.draw do
  resources :hyvelet_missing_locations

  resources :master_pins

  resources :hyvelets

  #Home
  root 'home#index'
  post 'push' => 'home#push'
end
