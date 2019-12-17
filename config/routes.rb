Rails.application.routes.draw do

  root 'posts#index'

  resources :address, only: [ :new, :create ]

  resources :credit, only: :index do
    collection do
      get 'done'
    end
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    resources :signup
  end
end
