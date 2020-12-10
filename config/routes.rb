Rails.application.routes.draw do
  devise_for :users

  root 'toppages#index'
  resource :toppages
  resources :photos, only: [:index]
  resources :users, only: [:show]
end
