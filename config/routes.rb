Rails.application.routes.draw do
  devise_for :users

  root 'toppages#index'
  resources :photos do
    resources :purchases, only: [:index,:create]
  end
end
