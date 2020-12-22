Rails.application.routes.draw do
  devise_for :users

  root 'toppages#index'
  get 'photos/search'
  resource :toppages, only: [:index]
  resources :photos, only: [:index,:new,:create]
  resources :users, only: [:show]
end
