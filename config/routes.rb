Rails.application.routes.draw do

  root 'posts#index'

  resources :posts, only: :index

  resources :address, only: [ :new, :create ]

  resources :credit, only: [ :new, :create ]

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    resources :signup
  end
end
