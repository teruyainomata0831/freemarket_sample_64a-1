Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'
  
  # ユーザー登録
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    resources :signup
  resources :address, only: [ :new, :create ]
  resources :credit, only: :index do
    collection do
      get 'done'
    end
  end
  
  # 出品ページ
  resources :items

end
