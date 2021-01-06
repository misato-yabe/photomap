Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      omniauth_callbacks: 'users/omniauth_callbacks',
      registrations: 'users/registrations'
    }

  root 'photos#index'

  resources :photos do
    collection do
      get 'photos/search'
    end
  end
  resources :users, only: [:show, :edit, :update]

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

end
