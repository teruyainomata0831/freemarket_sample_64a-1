Rails.application.routes.draw do

  root to: "posts#index"


  get 'users/mypage_side'
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:show] do
    collection do
      get :mypage_list
      get :mypage
    end
  end

  devise_for :users, skip: :all
  devise_scope :user do
    resources :signup
  end
end