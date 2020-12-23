Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }

  root 'toppages#index'

  resource :toppages, only: [:index]
  resources :photos, only: [:index,:new,:create] do
    collection do
      get 'photos/search'
    end
  end
  resources :users, only: [:show, :edit, :update]
end
