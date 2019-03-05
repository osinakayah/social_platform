Rails.application.routes.draw do
  # devise_for :users
  get 'static_pages/index'
  root 'posts#index'
  get 'posts', to: 'posts#index'
  resources :posts, only: [:create]
  resources :comments, only: [:create]
  resources :user_friends, only: [:create, :update]
  devise_for :users, controllers: { sessions: 'users/sessions',
                                    omniauth_callbacks: 'users/omniauth_callbacks'}

  get 'users/index', to: 'users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
