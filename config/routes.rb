Rails.application.routes.draw do
  
  root to: 'items#index'

  # ユーザー登録
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    resources :signup
  end

  resources :address, only: [ :new, :create ]

  resources :credit, only: :index do
    collection do
      get 'done'
    end
  end

  # マイページ
  resources :users, only: :index do
    collection do
      get 'mypage'
      get 'signout'
      get 'editprofile'
    end
  end

  # payjp カード登録
  resources :card, only: [:new, :destroy] do
    collection do
      get 'exp'
      post 'exp'
      post 'pay'
    end
  end

  #payjpで商品購入
  resources :buy, only: [:index] do
    collection do
      post 'pay'
      get 'fin'
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

end
