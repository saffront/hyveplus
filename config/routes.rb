Rails.application.routes.draw do
  #Home
  root 'home#index'
  post 'push' => 'home#push'
end
