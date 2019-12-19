Rails.application.routes.draw do
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
    end
  end

  # payjp カード登録
  resources :card, only: [:new, :show] do
    collection do
      post 'show'
      post 'pay'
      post 'delete'
    end
  end

  #payjpで商品購入
  resources :buy, only: [:index] do
    collection do
      get 'index'
      post 'pay'
      get 'fin'
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
    # 出品ページ
  resources :items  do
    collection do
      get 'buy'
    end
  end
  
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

  resources :posts do
    collection do
      get 'mypage'
      get 'signout'
      get 'exhibit'
      get 'creditConfirm'
    end
  end
  



end
