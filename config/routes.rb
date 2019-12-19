Rails.application.routes.draw do
  
  # ユーザー登録
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    resources :signup
  end
  root to: 'items#index'

  resources :user do
    collection do
      get 'mypage'
      get 'signout'
      get 'editprofile'
    end
  end

  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # 出品ページ
  resources :items  do
    collection do
      get 'buy'
    end
    member do
      get 'exhibit'
    end
  end
  

  resources :address, only: [ :new, :create ]
  resources :credit, only: :index do
    collection do
      get 'done'
    end
  end

  resources :posts do
    member do
      get 'mypage'
    end
  end

end
