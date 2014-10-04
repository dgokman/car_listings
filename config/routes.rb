Rails.application.routes.draw do
  root to: 'manufacturers#index'
  resources :manufacturers, only: [:index, :new, :create]
  resources :cars, only: [:index, :new, :create]
end
