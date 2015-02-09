Rails.application.routes.draw do
  resources :hyvelets

  #Home
  root 'home#index'
  post 'push' => 'home#push'
end
