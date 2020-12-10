Rails.application.routes.draw do
  devise_for :users

  root 'toppages#index'
  resources :toppages
  resources :photos, only: [:index]
end
