Rails.application.routes.draw do
  devise_for :users

  root 'toppages#index'
  resource :toppages, only: [:index]
  resources :photos, only: [:index,:new,:create]
  resources :users, only: [:show]
  get 'photos/search'
end
